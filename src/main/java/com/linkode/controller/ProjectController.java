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
import com.linkode.service.ProjectAppService;
import com.linkode.service.ProjectService;
import com.linkode.util.DataPage;

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
    public String createView() {
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
        }
    	return View("/project/detail-contract", model, project);
        
    }

    @GetMapping("/update/{id}")
    public String updateView(Model model, @PathVariable("id") Integer id) throws CustomException {
        Project project = projectService.findByPrimaryKey(id);
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

    /*======== 改 ========*/
    @PostMapping("/update")
    public String updateAction(Model model, HttpServletRequest req, @Validated Project newProject, BindingResult bindingResult) throws CustomException, ParseException {
        Project project = projectService.findByPrimaryKey(newProject.getId());
        project.setEndDate(newProject.getEndDate());
        project.setMoney(newProject.getMoney());
        project.setRequirement(newProject.getRequirement());
        project.setType(newProject.getType());
        project.setTitle(newProject.getTitle());
        project.setStartDate(new java.util.Date());
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
    	return RedirectTo("/project/"+id);
    }
    
    @GetMapping("/apply/{id}/accept")
    public String acceptAction(Model model, @PathVariable("id") Integer id) throws CustomException, ParseException{
    	ProjectApp projectApp = projectAppService.getById(id);
    	projectApp.setResult(1);
    	projectAppService.update(projectApp);

    	Project project = projectService.findByPrimaryKey(projectApp.getProjectId());
    	project.setStatus("contract");
    	project.setContractorId(projectApp.getApplicantId());
    	project.setStartDate(new Date());
    	projectService.update(project);
    	return RedirectTo("/project/"+project.getId());
    }
    
    @GetMapping("/apply/{id}/deny")
    public String denyAction(Model model, @PathVariable("id") Integer id) throws CustomException, ParseException{
    	ProjectApp projectApp = projectAppService.getById(id);
    	projectApp.setResult(0);
    	projectAppService.update(projectApp);
    	return RedirectTo("/project/"+id);
    }

    @GetMapping("/{id}/commit")
    public String submitAction(Model model, @PathVariable("id") Integer id) throws CustomException, ParseException {
        Project project = projectService.findByPrimaryKey(id);
        project.setStatus("commit");
        projectService.updateByPrimaryKey(project);
        return RedirectTo("/project/"+id);
    }

    @GetMapping("/{id}/confirm")
    public String comfirmAction(Model model, @PathVariable("id") Integer id) throws CustomException, ParseException {
        Project project = projectService.findByPrimaryKey(id);
        project.setStatus("confirm");
        projectService.updateByPrimaryKey(project);
        return RedirectTo("/project/myProject");
    }

    /*======== 增删 ========*/
    @PostMapping("/create")
    public String createAction(Model model, HttpServletRequest request, @Valid Project project, BindingResult bindingResult) throws CustomException, ParseException {
        Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");

        project.setPosterId(userid);
        project.setStartDate(new java.util.Date());
        project.setStatus("post");
        projectService.insert(project);
        return RedirectTo("/project/myProject");
    }

    @GetMapping("/delete/{id}")
    public String deleteAction(@PathVariable("id") Integer id) {
        projectService.deleteByPrimaryKey(id);
        return RedirectTo("/project/myProject");
    }

}