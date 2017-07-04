package com.linkode.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import com.linkode.exception.CustomException;
import com.linkode.pojo.Project;
import com.linkode.service.ProjectService;
import com.linkode.util.ControllerUtil;
import com.linkode.util.DataPage;
import com.sun.tools.internal.ws.processor.model.Request;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContext;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping("/project")
public class ProjectController extends BaseController {

    @Autowired
    private ProjectService projectService;

    @GetMapping("/explore")
    public String explore(Model model, Integer p) {
        p = p == null ? 1 : (p < 1 ? 1 : p);
        DataPage<Project> page = projectService.selectPage(p, 10, 6);
        return View("explore", model, page);
    }

    @GetMapping("/publish")
    public String publish() {
        return View("publish");
    }

    @PostMapping("/publish")
    public String publishProject(Model model, HttpServletRequest req, @Valid Project project, BindingResult bindingResult) throws CustomException, ParseException {
        if(bindingResult.hasErrors()){
            List<ObjectError> ls = bindingResult.getAllErrors();
            for (int i = 0; i < ls.size(); i++) {
                System.out.print("这是错误");
                System.out.println(i);
                System.out.println("error:"+ls.get(i));
            }
        }
        if(!bindingResult.hasErrors()) {
            String pid = req.getParameter("posterId");
            String date = req.getParameter("time");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
            java.util.Date endDate = sdf.parse(date);
            Integer postId = Integer.parseInt(pid);
            project.setPosterId(postId);
            project.setEndDate(endDate);
            project.setStatus("uncontracted");
            projectService.insert(project);
            return RedirectTo("/project/explore");
        } else {
            model.addAttribute("errors", ControllerUtil.ObjectErrorsToMap(bindingResult.getAllErrors()));
        }
        return RedirectTo("/project/explore");
        //return View("explore", model, project);
    }

    @GetMapping("/delete/{id}")
    public String delete(Model model, @PathVariable("id") Integer id) throws CustomException {
        Project project = projectService.findByPrimaryKey(id);
        return View("delete", model, project);
    }

    @GetMapping("/deleteSubmit/{id}")
    public String deleteSubmit(@PathVariable("id") Integer id) {
        projectService.deleteByPrimaryKey(id);
        return RedirectTo("/project/explore");
    }

    @GetMapping("/details/{id}")
    public String check(Model model, @PathVariable("id") Integer id) throws CustomException {
        Project project = projectService.findByPrimaryKey(id);
        return View("details", model, project);
    }

    @GetMapping("/edit/{id}")
    public String edit(Model model, @PathVariable("id") Integer id) throws CustomException {
        Project project = projectService.findByPrimaryKey(id);
        return View("edit", model, project);
    }

    @PostMapping("/edit")
    public String update(Model model, HttpServletRequest req, @Validated Project project, BindingResult bindingResult) throws CustomException, ParseException {
        if (!bindingResult.hasErrors()) {
            String date = req.getParameter("time");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date endDate = sdf.parse(date);
            project.setEndDate(endDate);
            projectService.updateByPrimaryKey(project.getId(), project);
            return RedirectTo("/project/explore");
        } else {
            model.addAttribute("errors", ControllerUtil.ObjectErrorsToMap(bindingResult.getAllErrors()));
        }

        return View("edit", model, project);
    }

    @GetMapping("/contract/{id}")
    public String contract(Model model, HttpServletRequest req, @PathVariable("id") Integer id) throws CustomException, ParseException {
        Subject subject = SecurityUtils.getSubject();
        Integer uid = (Integer) subject.getSession().getAttribute("LOGIN_USER_ID");
        Project project = projectService.findByPrimaryKey(id);
        Calendar now = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date = "" + now.get(Calendar.YEAR) + "-" + (now.get(Calendar.MONTH)+1) + "-" + now.get(Calendar.DAY_OF_MONTH);
        project.setStartDate(sdf.parse(date));
        project.setContractorId(uid);
        project.setStatus("unfinished");
        projectService.updateByPrimaryKey(id, project);
        return RedirectTo("/project/explore");
    }

    @GetMapping("/myProject")
    public String myProject(Model model, Integer p) {
        p = p == null ? 1 : (p < 1 ? 1 : p);
        DataPage<Project> page = projectService.selectPage(p, 10, 6);
        return View("myProject", model, page);
    }

    @GetMapping("/myContract")
    public String myContract(Model model, Integer p) {
        p = p == null ? 1 : (p < 1 ? 1 : p);
        DataPage<Project> page = projectService.selectPage(p, 10, 6);
        return View("myContract", model, page);
    }

    @GetMapping("/submit/{id}")
    public String submit(Model model, @PathVariable("id") Integer id) throws CustomException, ParseException {
        Project project = projectService.findByPrimaryKey(id);
        Calendar now = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date = "" + now.get(Calendar.YEAR) + "-" + (now.get(Calendar.MONTH)+1) + "-" + now.get(Calendar.DAY_OF_MONTH);
        project.setEndDate(sdf.parse(date));
        project.setStatus("unconfirmed");
        projectService.updateByPrimaryKey(id, project);
        return RedirectTo("/project/myContract");
    }

    @GetMapping("/confirm/{id}")
    public String comfirm(Model model, @PathVariable("id") Integer id) throws CustomException, ParseException {
        Project project = projectService.findByPrimaryKey(id);
        project.setStatus("finished");
        projectService.updateByPrimaryKey(id, project);
        return RedirectTo("/project/myProject");
    }
}