package com.linkode.controller;

import java.text.ParseException;
import com.linkode.pojo.ViewModel.ProjectViewModel;
import com.linkode.exception.CustomException;
import com.linkode.pojo.Project;
import com.linkode.service.ProjectService;
import com.linkode.util.DataPage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
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

    /*======== 查 ========*/
    @GetMapping("")
    public String exploreView(Model model, Integer p) {
        p = p == null ? 1 : (p < 1 ? 1 : p);
        DataPage<ProjectViewModel> page = projectService.selectPVMPage(p, 10, 6);

        return View("/project/all", model, page);
    }

    @GetMapping("/create")
    public String createView() {
        return View("/project/create");
    }

    @GetMapping("/details/{id}")
    public String detailView(Model model, @PathVariable("id") Integer id) throws CustomException {
        Project project = projectService.findByPrimaryKey(id);
        return View("details", model, project);
    }

    @GetMapping("/update/{id}")
    public String updateView(Model model, @PathVariable("id") Integer id) throws CustomException {
        Project project = projectService.findByPrimaryKey(id);
        return View("/project/update", model, project);
    }

    @GetMapping("/myProject")
    public String myProjectView(Model model, Integer p) {
        p = p == null ? 1 : (p < 1 ? 1 : p);
        DataPage<Project> page = projectService.selectPage(p, 10, 6);
        return View("/project/myProject", model, page);
    }

    @GetMapping("/myContract")
    public String myContractView(Model model, Integer p) {
        p = p == null ? 1 : (p < 1 ? 1 : p);
        DataPage<Project> page = projectService.selectPage(p, 10, 6);
        return View("/project/myContract", model, page);
    }

    /*======== 改 ========*/
    @PostMapping("/update")
    public String updateAction(Model model, HttpServletRequest req, @Validated Project newProject, BindingResult bindingResult) throws CustomException, ParseException {
        Project project = projectService.findByPrimaryKey(newProject.getId());
        project.setEndDate(getDate(req, "time"));
        project.setMoney(newProject.getMoney());
        project.setRequirement(newProject.getRequirement());
        project.setType(newProject.getType());
        project.setTitle(newProject.getTitle());
        project.setStartDate(new java.util.Date());
        projectService.updateByPrimaryKey(project);
        return RedirectTo("/project/myProject");
    }

    @GetMapping("/contract/{id}")
    public String contractAction(Model model, HttpServletRequest req, @PathVariable("id") Integer id) throws CustomException, ParseException {
        Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
        Project project = projectService.findByPrimaryKey(id);
        project.setContractorId(userid);
        project.setStatus("unfinished");
        projectService.updateByPrimaryKey(project);
        return RedirectTo("/project/myContract");
    }

    @GetMapping("/submit/{id}")
    public String submitAction(Model model, @PathVariable("id") Integer id) throws CustomException, ParseException {
        Project project = projectService.findByPrimaryKey(id);
        project.setStatus("unconfirmed");
        projectService.updateByPrimaryKey(project);
        return RedirectTo("/project/myContract");
    }

    @GetMapping("/confirm/{id}")
    public String comfirmAction(Model model, @PathVariable("id") Integer id) throws CustomException, ParseException {
        Project project = projectService.findByPrimaryKey(id);
        project.setStatus("finished");
        projectService.updateByPrimaryKey(project);
        return RedirectTo("/project/myProject");
    }

    /*======== 增删 ========*/
    @PostMapping("/create")
    public String createAction(Model model, HttpServletRequest request, @Valid Project project, BindingResult bindingResult) throws CustomException, ParseException {
        Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");

        project.setPosterId(userid);
        project.setStartDate(new java.util.Date());
        project.setEndDate(getDate(request,"time"));
        project.setStatus("uncontracted");
        projectService.insert(project);
        return RedirectTo("/project/myProject");
    }

    @GetMapping("/delete/{id}")
    public String deleteAction(@PathVariable("id") Integer id) {
        projectService.deleteByPrimaryKey(id);
        return RedirectTo("/project/myProject");
    }

}