package com.linkode.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import com.linkode.pojo.PostCmt;
import com.linkode.service.PostCmtService;
import com.linkode.pojo.ViewModel.PostCmtViewModel;
import com.linkode.pojo.ViewModel.PostViewModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/postCmt")
public class PostCmtController extends BaseController {

    @Autowired
    private PostCmtService PostCmtService;

    /*======== 查 ========*/
    @GetMapping("")
    public String exploreView(Model model,HttpSession httpSession, Integer p,HttpServletRequest request, @Valid PostViewModel PostVM, BindingResult bindingResult) {
    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
        p = p == null ? 1 : (p < 1 ? 1 : p);
        List<PostCmtViewModel> pvms =  PostCmtService.getPCVMByPostid(PostVM.getId());
        httpSession.setAttribute("postVM",PostVM );  
        return View("/post/detail", model, pvms);
    }
   
    @GetMapping("/refresh")
    public String refresh(Model model,HttpSession httpSession, Integer p) {  
    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
        p = p == null ? 1 : (p < 1 ? 1 : p);
        PostViewModel PostVM=(PostViewModel) httpSession.getAttribute("postVM");
        List<PostCmtViewModel> pvms = PostCmtService.getPCVMByPostid(PostVM.getId());
        return View("/post/detail", model, pvms);
    }

    /*======== 增删 ========*/
    @PostMapping("/create")
    public String createAction(Model model, HttpSession httpSession,HttpServletRequest request, @Valid PostCmt PostCmt, BindingResult bindingResult) throws ParseException {
    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
        PostCmt.setUserId(userid);
        PostCmt.setPostid(((PostViewModel)httpSession.getAttribute("postVM")).getId());
        Date time=new Date();
        PostCmt.setTime(time);
        PostCmt.setPostCmtId(0);
        PostCmtService.insert(PostCmt);
        return RedirectTo("/postCmt/refresh");
    }

    @PostMapping("/respond/{id}")
    public String respondAction(Model model, HttpSession httpSession,HttpServletRequest request,@PathVariable("id") Integer id ,@Valid PostCmt PostCmt, BindingResult bindingResult) throws ParseException {
    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
        PostCmt.setUserId(userid);
        PostCmt.setPostid(((PostViewModel)httpSession.getAttribute("postVM")).getId());
        Date time=new Date();
        PostCmt.setTime(time);
        PostCmt.setPostCmtId(id);
        PostCmtService.insert(PostCmt);
        return RedirectTo("/postCmt/refresh");
    }
    
    @GetMapping("/delete/{id}")
    public String deleteAction(@PathVariable("id") Integer id) {
        PostCmtService.deleteById(id);
        return RedirectTo("/postCmt/refresh");
    }

}