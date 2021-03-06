package com.linkode.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import com.linkode.pojo.ViewModel.ProjectViewModel;
import com.linkode.exception.CustomException;
import com.linkode.pojo.Project;
import com.linkode.pojo.ProjectApp;
import com.linkode.pojo.ProjectCommit;
import com.linkode.pojo.ProjectRating;
import com.linkode.pojo.User;
import com.linkode.service.ChatLogService;
import com.linkode.service.ProjectAppService;
import com.linkode.service.ProjectCommitService;
import com.linkode.service.ProjectService;
import com.linkode.service.ProjectRatingService;
import com.linkode.service.UserService;
import com.linkode.util.DataPage;
import com.linkode.util.FileUploadUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping("/project")
public class ProjectController extends BaseController {

    @Autowired
    private ProjectService projectService;
    @Autowired
    private ProjectAppService projectAppService;
    @Autowired
    private ProjectCommitService projectCommitService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProjectRatingService projectRatingService;
    @Autowired
    private ChatLogService chatLogService;
    /**
     * 此类用于将Jsp上的java.sql.Date转为java.util.Date并解决时区问题。
     * 若不setTimeZone，则存入数据库中的日期会缺一天。
     */
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    dateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

    /*======== 查 ========*/
    @GetMapping("")
    public String exploreView(Model model) {
        List<ProjectViewModel> projects = projectService.getUncontractedPVM();
        return View("/project/all", model, projects);
    }

    @GetMapping("/create")
    public String createView(Model model) {
    	Integer userId = (Integer)session().getAttribute("LOGIN_USER_ID");
    	User user = userService.getById(userId);
        model.addAttribute("money", user.getMoney());
        return View("/project/create");
    }

    @GetMapping("/{id}")
    public String detailView(Model model, @PathVariable("id") Integer id) throws CustomException {
        ProjectViewModel project = projectService.findPVMByPrimaryKey(id);
        Integer userid = (Integer)session().getAttribute("LOGIN_USER_ID");
        
        if (project.getStatus().equals("post")) {
	        int hasApplied = 0;
	        if (project.getPosterId().equals(userid)) {
	        	hasApplied = 1;
	        } else {
	        	hasApplied = projectAppService.hasApplied(id,userid);
	        }
	        model.addAttribute("apps",projectAppService.getPAVMByProjectId(id));
	        model.addAttribute("hasApplied", hasApplied);
        	return View("/project/detail-post", model, project);
        } else if (project.getStatus().equals("confirm")) {
        	model.addAttribute("rating", projectRatingService.getByProjectId(id));
        }
        model.addAttribute("commits", projectCommitService.getByProjectId(id));
        model.addAttribute("user", userService.getById(project.getContractorId()));
    	return View("/project/detail-contract", model, project);
        
    }

    @GetMapping("/update/{id}")
    public String updateView(Model model, @PathVariable("id") Integer id) throws CustomException {
        Project project = projectService.findByPrimaryKey(id);
    	if (!isAuthorized(project.getPosterId()) || !project.getStatus().equals("post")) {
        	model.addAttribute("message", "无操作权限。");
        	return View("error");
        }
        User user = userService.getById(project.getPosterId());
        model.addAttribute("money", user.getMoney()+project.getMoney());
        return View("/project/update", model, project);
    }

    @GetMapping("/myProject")
    public String myProjectView(Model model) {
    	Integer userId = (Integer)session().getAttribute("LOGIN_USER_ID");
    	if (userId == null) {
    		return RedirectTo("/login");
    	}
    	model.addAttribute("type","myProject");
        List<ProjectViewModel> pvms= projectService.getPVMByPosterId(userId);
        return View("/project/all", model, pvms);
    }

    @GetMapping("/myContract")
    public String myContractView(Model model) {
    	Integer userId = (Integer)session().getAttribute("LOGIN_USER_ID");
    	if (userId == null) {
    		return RedirectTo("/login");
    	}
    	model.addAttribute("type","myContract");
        List<ProjectViewModel> pvms = projectService.getPVMByContractorId(userId);
        return View("/project/all", model, pvms);
    }
    
    @GetMapping("/myApplication")
    public String myApplicationView(Model model) {
    	Integer userId = (Integer)session().getAttribute("LOGIN_USER_ID");
    	if (userId == null) {
    		return RedirectTo("/login");
    	}
    	model.addAttribute("type","myApplication");
    	List<ProjectViewModel> pvms = projectService.getPVMByApplicantId(userId);
    	return View("/project/all",model,pvms);
    }

    /*======== 改 ========*/
    @PostMapping("/update")
    public String updateAction(Model model, HttpServletRequest req, @Validated Project newProject, BindingResult bindingResult) throws CustomException, ParseException {
    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
    	User user = userService.getById(userid);
		Project project = projectService.findByPrimaryKey(newProject.getId());
    	if (!isAuthorized(project.getPosterId()) || !project.getStatus().equals("post")) {
        	model.addAttribute("message", "无操作权限。");
        	return View("error");
        }
    	if (user.getMoney()+project.getMoney()-newProject.getMoney()<0) {
    		return RedirectTo("/project/myProject");
    	}
		user.setMoney(user.getMoney()+project.getMoney()-newProject.getMoney());
		userService.update(user);
		
		project.setEndDate(newProject.getEndDate());
		project.setMoney(newProject.getMoney());
		project.setRequirement(newProject.getRequirement());
		project.setType(newProject.getType());
		project.setTitle(newProject.getTitle());
		projectService.updateByPrimaryKey(project);
		
        return RedirectTo("/project/myProject");
    }
    
    @PostMapping("/{id}/application")
    public String applicationAction(Model model, @PathVariable("id") Integer id, ProjectApp projectApp) {
    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
    	projectApp.setApplicantId(userid);
    	projectApp.setProjectId(id);
    	projectApp.setTime(new Date());
    	projectAppService.insert(projectApp);
    	
    	Project project = projectService.getById(id);
    	chatLogService.systemMessage(project.getPosterId(), 
    			"项目<a href='../../project/" + id + "'>[" + project.getTitle()+"]</a>有新的申请。");
    	return RedirectTo("/project/"+id);
    }
    
    @GetMapping("/apply/{id}/accept")
    public String acceptAction(Model model, @PathVariable("id") Integer id) throws CustomException, ParseException{
    	ProjectApp projectApp = projectAppService.getById(id);
    	Project project=projectService.findByPrimaryKey(projectApp.getProjectId());
    	if (!isAuthorized(project.getPosterId())) {
        	model.addAttribute("message", "无操作权限。");
        	return View("error");
        }
    	projectApp.setResult(1);
    	projectAppService.update(projectApp);

    	project.setStatus("contract");
    	project.setContractorId(projectApp.getApplicantId());
    	project.setStartDate(new Date());
    	projectService.update(project);
    	chatLogService.systemMessage(projectApp.getApplicantId(), 
    			"您成功承包了项目<a href='../../project/" + project.getId() + "'>[" + project.getTitle()+"]</a>。");
    	return RedirectTo("/project/"+project.getId());
    }
    
    @GetMapping("/apply/{id}/reject")
    public String denyAction(Model model, @PathVariable("id") Integer id) throws CustomException, ParseException{
    	ProjectApp projectApp = projectAppService.getById(id);
    	Project project=projectService.findByPrimaryKey(projectApp.getProjectId());
    	if (!isAuthorized(project.getPosterId())) {
        	model.addAttribute("message", "无操作权限。");
        	return View("error");
        }
    	
    	projectApp.setResult(0);
    	projectAppService.update(projectApp);

    	
    	chatLogService.systemMessage(projectApp.getApplicantId(), 
    			"您对项目<a href='../../project/" + project.getId() + "'>[" + project.getTitle()+"]</a>的申请已被拒绝。");
    	return RedirectTo("/project/"+projectApp.getProjectId());
    }
    
    @GetMapping("/apply/{id}/delete")
    public String deleteApplyAction(Model model, @PathVariable("id") Integer id) {
    	ProjectApp projectApp = projectAppService.getById(id);
    	if (!isAuthorized(projectApp.getApplicantId())) {
        	model.addAttribute("message", "无操作权限。");
        	return View("error");
        }
    	int projectId = projectApp.getProjectId();
    	projectAppService.deleteById(id);
    	return RedirectTo("/project/"+projectId);
    }

    @PostMapping("/{id}/commit")
    public String submitAction(Model model, HttpServletRequest request, @PathVariable("id") Integer id, ProjectCommit pc, @RequestParam("file") MultipartFile file) throws CustomException, ParseException {

    	String realPath = request.getSession().getServletContext().getRealPath("static/img/file");
    	Project project = projectService.findByPrimaryKey(id);

        if (!isAuthorized(project.getContractorId())) {
        	model.addAttribute("message", "无操作权限。");
        	return View("error");
        }
    	pc.setTime(new Date());
    	pc.setProjectId(id);
        projectCommitService.insert(pc);
        
        String filename="commit"+pc.getId()+file.getOriginalFilename();
        if (!FileUploadUtil.upload(file, realPath+"/"+filename)) {
        	projectCommitService.deleteById(pc.getId());
        	return RedirectTo("/project/"+id);
        }
        pc.setFilename(filename);
        projectCommitService.update(pc);
        
    	chatLogService.systemMessage(project.getPosterId(), 
    			"项目<a href='../../project/" + project.getId() + "'>[" + project.getTitle()+"]</a>有新的提交。");
        return RedirectTo("/project/"+id);
    }

    @GetMapping("/commit/{id}/accept")
    public String commitAcceptAction(Model model, @PathVariable("id") Integer id) throws CustomException {
    	ProjectCommit pc = projectCommitService.getById(id);
        Project project = projectService.findByPrimaryKey(pc.getProjectId());
        if (!isAuthorized(project.getPosterId())) {
        	model.addAttribute("message", "无操作权限。");
        	return View("error");
        }
    	pc.setResult("accept");
    	projectCommitService.update(pc);
    	
    	chatLogService.systemMessage(project.getContractorId(), 
    			"您在项目<a href='../../project/" + project.getId() + "'>[" + project.getTitle()+"]</a>中的提交已被通过。");
    	return RedirectTo("/project/"+pc.getProjectId());
    }
    
    @GetMapping("/commit/{id}/reject")
    public String commitRejectAction(Model model, @PathVariable("id") Integer id ) throws CustomException{
    	ProjectCommit pc = projectCommitService.getById(id);
    	Project project = projectService.findByPrimaryKey(pc.getProjectId());
        if (!isAuthorized(project.getPosterId())) {
        	model.addAttribute("message", "无操作权限。");
        	return View("error");
        }
    	pc.setResult("reject");
    	projectCommitService.update(pc);

    	chatLogService.systemMessage(project.getContractorId(), 
    			"您在项目<a href='../../project/" + project.getId() + "'>[" + project.getTitle()+"]</a>中的提交已被拒绝。");
    	return RedirectTo("/project/"+pc.getProjectId());
    }
    
    @PostMapping("/{id}/confirm")
    public String comfirmAction(Model model, @PathVariable("id") Integer id, ProjectRating projectRating) throws CustomException, ParseException {
        Project project = projectService.findByPrimaryKey(id);
        

        if (!isAuthorized(project.getPosterId())) {
        	model.addAttribute("message", "无操作权限。");
        	return View("error");
        }
        
        project.setStatus("confirm");
        projectService.updateByPrimaryKey(project);

        projectRating.setProjectId(id);
        projectRating.setPosterId(project.getPosterId());
        projectRating.setContractorId(project.getContractorId());
        projectRatingService.insert(projectRating);
        
        User user = userService.findById(project.getContractorId());
        user.setMoney(user.getMoney()+project.getMoney());
        user.setRatingNumber(user.getRatingNumber()+1);
        user.setRatingTotal(user.getRatingTotal()+projectRating.getRating());
        userService.update(user);
    	chatLogService.systemMessage(project.getContractorId(), 
    			"您承包的项目<a href='../../project/" + project.getId() + "'>[" + project.getTitle()+"]</a>已完结,"+project.getMoney()+"元酬金已经到账。");
        return RedirectTo("/project/"+id);
    }

    /*======== 增删 ========*/
    @PostMapping("/create")
    public String createAction(Model model, HttpServletRequest request, @Valid Project project, BindingResult bindingResult) throws CustomException, ParseException {
        Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
        User user = userService.findById(userid);
        if (user.getMoney()<project.getMoney()|project.getMoney()<0) {
        	return RedirectTo("/project/myProject");
        }
        
        project.setPosterId(userid);
        project.setStartDate(new java.util.Date());
        project.setStatus("post");
        projectService.insert(project);
        
        user.setMoney(user.getMoney()-project.getMoney());
        userService.update(user);
        return RedirectTo("/project/myProject");
    }

    @GetMapping("/delete/{id}")
    public String deleteAction(Model model, @PathVariable("id") Integer id) throws CustomException {
        Project project = projectService.findByPrimaryKey(id);
        if (!isAuthorized(project.getPosterId())) {
        	model.addAttribute("message", "无操作权限。");
        	return View("error");
        }

    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
        User user = userService.findById(userid);
        user.setMoney(user.getMoney()+project.getMoney());
        userService.update(user);
        projectService.deleteByPrimaryKey(id);
        return RedirectTo("/project/myProject");
    }

}