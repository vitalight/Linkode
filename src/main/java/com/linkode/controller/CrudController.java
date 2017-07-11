package com.linkode.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.linkode.pojo.*;
import com.linkode.service.*;

/**
 * This is the controller for CRUD
 * @author Vital
 */
@Controller
@RequestMapping("/admin")
public class CrudController extends BaseController {
	
	@Autowired
    private AdService adService;
	@Autowired 
	private ProjectAppService projectAppService;
	@Autowired
	private UserService userService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private PostService postService;
	@Autowired
	private PostCmtService postCmtService;

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
	
	/**
	 *  CRUD for Ad 
	 */
	@GetMapping({"","/ad"})
	public String adRetrieve(Model model) {
		return View("/crud/ad", model, adService.getAll());
	}
	
	@GetMapping("/ad/create")
	public String adCreate(Model model, Ad ad) {
		adService.insert(ad);
		return RedirectTo("/admin/ad");
	}

	@GetMapping("/ad/update")
	public String adUpdate(Model model, Ad ad) {
		adService.update(ad);
		return RedirectTo("/admin/ad");
	}

	@GetMapping("/ad/delete")
	public String adDelete(Model model, int id) {
		adService.deleteById(id);
		return RedirectTo("/admin/ad");
	}
	
	/** 
	 * CRUD for ProjectAppService
	 */
	@GetMapping("/projectApp")
	public String projectAppRetrieve(Model model) {
		return View("/crud/projectApp", model, projectAppService.getAll());
	}
	
	@GetMapping("/projectApp/create")
	public String projectAppCreate(Model model, ProjectApp projectApp) {
		projectAppService.insert(projectApp);
		return RedirectTo("/admin/projectApp");
	}
	
	@GetMapping("/projectApp/update")
	public String projectAppUpdate(Model model, ProjectApp projectApp) {
		projectAppService.update(projectApp);
		return RedirectTo("/admin/projectApp");
	}
	
	@GetMapping("/projectApp/delete")
	public String projectAppDelete(Model model, int id) {
		projectAppService.deleteById(id);
		return RedirectTo("/admin/projectApp");
	}
	
	/** 
	 * CRUD for UserService
	 */
	@GetMapping("/user")
	public String userRetrieve(Model model) {
		return View("/crud/user", model, userService.getAll());
	}
	
	@GetMapping("/user/create")
	public String userCreate(Model model, User user) {
		userService.insert(user);
		return RedirectTo("/admin/user");
	}
	
	@GetMapping("/user/update")
	public String userUpdate(Model model, User user) {
		userService.update(user);
		return RedirectTo("/admin/user");
	}
	
	@GetMapping("/user/delete")
	public String userDelete(Model model, int id) {
		userService.deleteById(id);
		return RedirectTo("/admin/user");
	}
	
	/** 
	 * CRUD for UserService
	 */
	@GetMapping("/project")
	public String projectRetrieve(Model model) {
		return View("/crud/project", model, projectService.getAll());
	}
	
	@GetMapping("/project/create")
	public String projectCreate(Model model, Project project) {
		projectService.insert(project);
		return RedirectTo("/admin/project");
	}
	
	@GetMapping("/project/update")
	public String projectUpdate(Model model, Project project) {
		projectService.update(project);
		return RedirectTo("/admin/project");
	}
	
	@GetMapping("/project/delete")
	public String projectDelete(Model model, int id) {
		projectService.deleteById(id);
		return RedirectTo("/admin/project");
	}
	
	/** 
	 * CRUD for PostService
	*/ 
	@GetMapping("/post")
	public String postRetrieve(Model model) {
		return View("/crud/post", model, postService.getAll());
	}
	
	@GetMapping("/post/create")
	public String postCreate(Model model, Post post) {
		postService.insert(post);
		return RedirectTo("/admin/post");
	}
	
	@GetMapping("/post/update")
	public String postUpdate(Model model, Post post) {
		postService.update(post);
		return RedirectTo("/admin/post");
	}
	
	@GetMapping("/post/delete")
	public String postDelete(Model model, int id) {
		postService.deleteById(id);
		return RedirectTo("/admin/post");
	}
	
	/** 
	 * CRUD for PostService
	*/ 
	@GetMapping("/postCmt")
	public String postCmtRetrieve(Model model) {
		return View("/crud/postCmt", model, postCmtService.getAll());
	}
	
	@GetMapping("/postCmt/create")
	public String postCmtCreate(Model model, PostCmt postCmt) {
		postCmtService.insert(postCmt);
		return RedirectTo("/admin/postCmt");
	}
	
	@GetMapping("/postCmt/update")
	public String postCmtUpdate(Model model, PostCmt postCmt) {
		postCmtService.update(postCmt);
		return RedirectTo("/admin/postCmt");
	}
	
	@GetMapping("/postCmt/delete")
	public String postCmtDelete(Model model, int id) {
		postCmtService.deleteById(id);
		return RedirectTo("/admin/postCmt");
	}
}
