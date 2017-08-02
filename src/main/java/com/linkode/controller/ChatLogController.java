package com.linkode.controller;

import java.util.ArrayList;
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
import com.linkode.service.UserService;

@Controller
@RequestMapping("/chat")
public class ChatLogController extends BaseController {
	
	@Autowired
	private ChatLogService chatLogService;
	@Autowired
	private UserService userService;
	
	/*======== 用户id1查看自己和id2的对话 ========*/
	@GetMapping("/{id1}/{id2}")
	public String checkChat(Model model, @PathVariable("id1") Integer id1, @PathVariable("id2") Integer id2) {
		List<ChatLog> chatLogs1 = chatLogService.findBetween(id1, id2);
		List<ChatLog> chatLogs2 = chatLogService.findBetween(id1, -1*id2);
		List<ChatLog> chatLogs = new ArrayList<ChatLog>();
		
		int i = 0, j = 0;
		while(i < chatLogs1.size() || j < chatLogs2.size()) {
			if (i >= chatLogs1.size()) {
				chatLogs.add(chatLogs2.get(j++));
			} else if (j >= chatLogs2.size()) {
				chatLogs.add(chatLogs1.get(i++));
			} else {
				ChatLog chat1 = chatLogs1.get(i), chat2 = chatLogs2.get(j);
				if (chat1.getId() > chat2.getId()) {
					chatLogs.add(chat1);
					i++;
				} else {
					chatLogs.add(chat2);
					j++;
				}
			}
		}
		model.addAttribute("user", userService.getById(id2));
		List<ChatViewModel> chats = chatLogService.transform(chatLogs);
		return View("/chatlog/chat", model, chats);
	}
	
	@PostMapping("/{id1}/{id2}")
	public String replyChat(HttpServletRequest request, @PathVariable("id1") Integer id1, @PathVariable("id2") Integer id2) {
		String message = (String)request.getParameter("message");
		String content = "";
		for (int i = 0; i < message.length(); i++) {
			if (message.charAt(i) == ' ') {
				content += "&nbsp;";
			} else {
				content += message.charAt(i);
			}
		}
		ChatLog chatLog = new ChatLog();
		chatLog.setContent(content);
		chatLog.setSenderId(id1);
		chatLog.setReceiverId(id2);
		chatLog.setTime(new java.util.Date());
		chatLogService.insert(chatLog);
		return RedirectTo("/chat/{id1}/{id2}");
	}
	
	/*======== 删除对话 ========*/
	@GetMapping("/delete/{id1}/{id2}")	// 用户id1删除对话id2
	public String deleteChat(@PathVariable("id1") Integer id1, @PathVariable("id2") Integer id2) {
		ChatLog chatLog = chatLogService.findByPrimaryKey(id2);
		Integer id = 0;
		if (chatLog.getSenderId() == id1) {
			chatLog.setSenderId(-id1);
			id = chatLog.getReceiverId();
		} else {
			chatLog.setReceiverId(-id1);
			id = Math.abs(chatLog.getSenderId());
		}
		chatLogService.update(chatLog);
		return RedirectTo("/chat/{id1}/"+id);
	}
	
	@GetMapping("/view/{id1}/{id2}")
	public String viewChat(Model model, @PathVariable("id1") Integer id1, @PathVariable("id2") Integer id2) {
		ChatLog chatLog = chatLogService.findByPrimaryKey(id2);
		Integer id = 0;
		if (chatLog.getReceiverId().equals(id1)) {
			id = chatLog.getSenderId();
		} else {
			id = chatLog.getReceiverId();
		}
		ChatViewModel chat = new ChatViewModel();
		chat.setId(chatLog.getId());
		chat.setReceiverId(chatLog.getReceiverId());
		chat.setSenderId(chatLog.getSenderId());
		chat.setContent(chatLog.getContent());
		chat.setTime(chatLog.getTime());
		chat.setReceiverName(userService.findById(chatLog.getReceiverId()).getUsername());
		chat.setSenderName(userService.findById(chatLog.getSenderId()).getUsername());
		model.addAttribute("id", id);
		return View("/chatlog/view", model, chat);
	}
}