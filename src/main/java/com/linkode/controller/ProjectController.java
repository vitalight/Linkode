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
            //Subject subject = SecurityUtils.getSubject();
            //String posterId = (String)subject.getSession().getAttribute("LOGIN_USER_ID");
            System.out.println("test");
            String pid = req.getParameter("postId");
            String date = req.getParameter("time");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
            java.util.Date endDate = sdf.parse(date);
            Integer postId = Integer.parseInt(pid);
            project.setPosterId(postId);
            project.setEndDate(endDate);
            project.setStatus("uncontracted");
            //System.out.println(posterId);
            projectService.insert(project);
            return RedirectTo("/project/explore");
        } else {
            System.out.println("error");
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
}