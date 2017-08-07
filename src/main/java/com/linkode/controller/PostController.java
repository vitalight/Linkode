package com.linkode.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import com.linkode.pojo.ViewModel.PostViewModel;
import com.linkode.exception.CustomException;
import com.linkode.pojo.Post;
import com.linkode.pojo.PostCmt;
import com.linkode.service.PostCmtService;
import com.linkode.service.PostService;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/post")
public class PostController extends BaseController {
	@Autowired
	private PostService postService;
	@Autowired
	private PostCmtService postCmtService;

	/* ======== 查 ======== */
	@GetMapping("")
	public String exploreView(Model model) {
		return View("/post/all", model, postService.getAllPVM());
	}

	@GetMapping("/mine")
	public String myPostView(Model model) {
		Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
		model.addAttribute("type", "mine");
		return View("/post/all", model, postService.getPVMByPosterid(userid));
	}

	@GetMapping("/myComment")
	public String myCommentView(Model model) {
		Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
		model.addAttribute("type", "myComment");
		return View("/post/all", model, postService.getPVMByCommentUserid(userid));
	}
	
	@GetMapping("/create")
	public String createView() {
		return View("/post/create");
	}

	@GetMapping("/{id}")
	public String detailView(Model model, @PathVariable("id") Integer id) throws CustomException {
		model.addAttribute("cmtCmts",postCmtService.getMapByPostid(id));
		model.addAttribute("cmts",postCmtService.getFloorByPostid(id));
		return View("/post/detail", model, postService.getPVMById(id));
	}

	@GetMapping("/update/{id}")
	public String updateView(Model model, @PathVariable("id") Integer id) throws CustomException {
		Post post = postService.getById(id);
		return View("/post/update", model, post);
	}

	/* ======== 改 ======== */
	@PostMapping("/update")
	public String updateAction(Model model, HttpServletRequest req, @Validated Post newPost,
			BindingResult bindingResult) throws CustomException, ParseException {
		Post post = postService.getById(newPost.getId());
		post.setContent(newPost.getContent());
		post.setType(newPost.getType());
		post.setTitle(newPost.getTitle());
		postService.update(post);
		return RedirectTo("/post");
	}

	/* ======== 增删 ======== */
	@PostMapping("/{id}/comment")
    public String createAction(Model model, @PathVariable("id") Integer id, PostCmt postCmt) {
    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
        postCmt.setUserId(userid);
        postCmt.setPostid(id);
        postCmt.setTime(new Date());
        postCmtService.insert(postCmt);
        return RedirectTo("/post/"+id);
    }
	@PostMapping("/comment/{id}/comment")
	public String commentCommentAction(Model model, @PathVariable("id") Integer id, PostCmt postCmt) {
    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
    	Integer postid = postCmtService.getById(id).getPostid();
        postCmt.setUserId(userid);
        postCmt.setPostCmtId(id);
        postCmt.setTime(new Date());
        postCmt.setPostid(postid);
        postCmtService.insert(postCmt);
        return RedirectTo("/post/"+postid);
	}
	@GetMapping("/comment/delete/{id}")
	public String commentDeleteAction(Model model, @PathVariable("id") Integer id) {
    	Integer postid = postCmtService.getById(id).getPostid();
    	postCmtService.deleteById(id);
		return RedirectTo("/post/"+postid);
	}
	
	@PostMapping("/create")
	public String createAction(Model model, HttpServletRequest request, @Valid Post post, BindingResult bindingResult)
			throws CustomException, ParseException {
		Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
		post.setUserId(userid);
		Date date = new Date();
		post.setTime(date);
		postService.insert(post);
		return RedirectTo("/post");
	}

	@GetMapping("/delete/{id}")
	public String deleteAction(@PathVariable("id") Integer id) {
		postService.deleteById(id);
		return RedirectTo("/post/all");
	}
}
