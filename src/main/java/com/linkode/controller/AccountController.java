package com.linkode.controller;

import com.linkode.exception.CustomException;
import com.linkode.pojo.User;
import com.linkode.pojo.ViewModel.LoginViewModel;
import com.linkode.service.UserService;
import com.linkode.util.ControllerUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
/**
 * @author Vital
 */
@Controller
public class AccountController extends BaseController {

    @Autowired
    private UserService userService;
  
    /**
     * This is for test and should be DELETED
     * after merging with master.
     */
    @GetMapping("/post")
    public String test(Model model) {
    	return View("/post/main");
    }
    
    @GetMapping("/login")
    public String login(Model model, String msg){
    	if (msg!=null) {
    		model.addAttribute("errormsg","请先登录。");
    	}
        return View("login");
    }

    @PostMapping("/login")
    public String loginSubmit(Model model, @Valid LoginViewModel loginViewModel, BindingResult bindingResult) throws CustomException {
        if(!bindingResult.hasErrors()){
            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken usernamePasswordTokentoken = new UsernamePasswordToken(loginViewModel.getEmail().trim().toLowerCase(),loginViewModel.getPassword());
            if(subject.isAuthenticated()){
                subject.logout();
            }
            try {
                subject.login(usernamePasswordTokentoken);

                //登录成功，保存用户信息
                User user = userService.findByEmail(loginViewModel.getEmail());
                subject.getSession().setAttribute("LOGIN_USER_ID",user.getId());
                subject.getSession().setAttribute("LOGIN_USER_NAME",user.getUsername());
                subject.getSession().setAttribute("LOGIN_USER_ROLE",user.getRole());
                return RedirectTo("/project");
            }catch (Exception e){
                model.addAttribute("errormsg","用户名或密码错误。");
            }
        }else{
            model.addAttribute("errors", ControllerUtil.ObjectErrorsToMap(bindingResult.getAllErrors()));
        }

        loginViewModel.setPassword("");
        return View("login",model,loginViewModel);
    }

    @GetMapping("/logout")
    public String logout(){
        Subject subject = SecurityUtils.getSubject();
        if(subject.isAuthenticated()){
            subject.logout();
        }
        return RedirectTo("/login");
    }
    
    @GetMapping("/register")
    public String register() {
    	return View("register");
    }
    
    @PostMapping("/register")
    public String registerSubmit(Model model, @Valid LoginViewModel loginViewModel, BindingResult bindingResult) {
    	if(!bindingResult.hasErrors()){
    		if (userService.findByEmail(loginViewModel.getEmail()) == null) {
	    		//邮箱未被注册，保存注册信息
	    		userService.insert(loginViewModel);
	    		Subject subject = SecurityUtils.getSubject();
	            UsernamePasswordToken usernamePasswordTokentoken = new UsernamePasswordToken(loginViewModel.getEmail().trim().toLowerCase(),loginViewModel.getPassword());
	            if(subject.isAuthenticated()){
	                subject.logout();
	            }
	    		try {
	                subject.login(usernamePasswordTokentoken);
	                User user = userService.findByEmail(loginViewModel.getEmail());
	                Integer id = user.getId();
	                String username = user.getUsername();
	                subject.getSession().setAttribute("LOGIN_USER_ID",id);
	                subject.getSession().setAttribute("LOGIN_USER_NAME",username);
	                return RedirectTo("/project");
	            }catch (Exception e){
	                model.addAttribute("errormsg","注册意外错误。");
	            }
	    	}
	    	else {
	    		model.addAttribute("errormsg", "此邮箱已被注册。");
	    	}
    	}
    	else {
    		model.addAttribute("errors", ControllerUtil.ObjectErrorsToMap(bindingResult.getAllErrors()));
    	}
    	return View("register", model, loginViewModel);
    }
}
