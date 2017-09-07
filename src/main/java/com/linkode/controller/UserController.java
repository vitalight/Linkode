package com.linkode.controller;

import java.io.IOException;
import java.io.Writer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.linkode.MD5.MD5;
import com.linkode.pojo.ChatLog;
import com.linkode.pojo.Portfolio;
import com.linkode.pojo.Project;
import com.linkode.pojo.User;
import com.linkode.pojo.ViewModel.ChatViewModel;
import com.linkode.pojo.ViewModel.PortfolioViewModel;
import com.linkode.service.ChatLogService;
import com.linkode.service.PortfolioService;
import com.linkode.service.ProjectRatingService;
import com.linkode.service.ProjectService;
import com.linkode.service.RelationService;
import com.linkode.service.UserService;
import com.linkode.util.DataPage;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private PortfolioService portfolioService;
	@Autowired
	private ChatLogService chatLogService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private ProjectRatingService projectRatingService;
	@Autowired
	private RelationService relationService;
	
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
	
	/*======== 根据ID查看用户信息 ========*/
	
	// 默认进入个人信息
	@GetMapping("/{id}")
	public String checkUser(Model model, @PathVariable("id") Integer id, String type) {

		Integer userid = (Integer)session().getAttribute("LOGIN_USER_ID");
		model.addAttribute("user", userService.findById(id));
		model.addAttribute("type",type);
		model.addAttribute("hasLiked", relationService.hasLiked(userid, id));
		if (type!=null) {
			model.addAttribute("type",type);
			return View("/user/main", model, chatLogService.getByUserId(id));
		}
		model.addAttribute("type","info");
		return View("/user/main");
	}
	
	@GetMapping("/{id}/{field}")
	public String userInfo(Model model, @PathVariable("id") Integer id, @PathVariable("field") String field, Integer p) {
		User user = userService.findById(id);
		model.addAttribute("user", user);
		if (field.equals("info")) {	// 个人信息
			return View("/user/info");
		} else if (field.equals("portfolio")) { // 个人作品
			List<PortfolioViewModel> portfolios = portfolioService.getByUserId(id);
			model.addAttribute("portfolios", portfolios);
			return View("/user/portfolio");
		} else if (field.equals("chatlog")) {
			return View("/user/chatlog", model, chatLogService.getByUserId(id));
		} else if (field.equals("rating")) {
			return View("/user/rating", model, projectRatingService.getByContractorId(id));
		} else {
	        return View("/user/project", model, projectService.getPVMByPosterId(user.getId()));
		}
	}
	
	/*======== 编辑个人信息 ========*/
	@GetMapping("/{id}/edit")
	public String editInfo(Model model, @PathVariable("id") Integer id) {
		User user = userService.findById(id);
		model.addAttribute("user",user);
		return View("/user/edit");
	}
	
	@PostMapping("/{id}/edit")
	public String submitEdit(Model model, User user, @PathVariable("id") Integer id) throws ParseException {
		User old = userService.findById(user.getId());
		old.setBirthday(user.getBirthday());
		old.setSex(user.getSex());
		old.setUsername(user.getUsername());

        session().setAttribute("LOGIN_USER_NAME",user.getUsername());
		old.setIntro(user.getIntro());
		String pwd = user.getPassword();
		if (pwd != null) {
			old.setPassword(MD5.GetMD5Code(pwd));
		}
		userService.update(old);
		return RedirectTo("/user/{id}");
	}
	
	/*======= 用户关注 =========*/
	@GetMapping("/{id}/like")
	public void likeUser(Model model, @PathVariable("id") Integer id, Writer writer) throws IOException {
		Integer userid = (Integer)session().getAttribute("LOGIN_USER_ID");
		if (userid == id){
			return;
		}
		if (relationService.hasLiked(userid, id)) {
			relationService.dislike(userid, id);
		} else {
			relationService.like(userid, id);
		}
    	writer.write("success");
	}
}