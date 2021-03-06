package com.linkode.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.linkode.pojo.ChatLog;
import com.linkode.pojo.ViewModel.ChatViewModel;
import com.linkode.service.ChatLogService;
import com.linkode.service.RelationService;
import com.linkode.service.UserService;

@Controller
@RequestMapping("/chat")
public class ChatLogController extends BaseController {
	
	@Autowired
	private ChatLogService chatLogService;
	@Autowired
	private UserService userService;
	@Autowired
	private RelationService relationService;
	
	/*======== 用户id1查看自己和id2的对话 ========*/
	// 聊天框
	@GetMapping("/{id1}/{id2}")
	public String chatView(Model model, @PathVariable("id1") Integer id1, @PathVariable("id2") Integer id2) {
		model.addAttribute("user", userService.getById(id2));
		relationService.clearMessage(id2, id1);
		return View("/chatlog/chat");
	}
	
	// 聊天历史内容
	@GetMapping("/content/{id1}/{id2}")
	public String checkChat(Model model, @PathVariable("id1") Integer id1, @PathVariable("id2") Integer id2) {
		model.addAttribute("user", userService.getById(id2));
		List<ChatLog> chatLogs = chatLogService.findBetween(id1, id2);
		List<ChatViewModel> chats = chatLogService.transform(chatLogs);
		return View("/chatlog/content", model, chats);
	}
	
	@PostMapping("/{id1}/{id2}")
	public String replyChat(HttpServletRequest request, @PathVariable("id1") Integer id1, @PathVariable("id2") Integer id2) {
		String message = (String)request.getParameter("message");
		ChatLog chatLog = new ChatLog();
		chatLog.setContent(message);
		chatLog.setSenderId(id1);
		chatLog.setReceiverId(id2);
		chatLog.setTime(new java.util.Date());
		chatLogService.insert(chatLog);
		return RedirectTo("/chat/{id1}/{id2}");
	}
}