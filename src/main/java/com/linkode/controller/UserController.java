package com.linkode.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
import com.linkode.service.ProjectService;
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
	
	/*======== 根据ID查看用户信息 ========*/
	
	// 默认进入个人信息
	@GetMapping("/{id}")
	public String checkUser() {
		return RedirectTo("/user/{id}/info");
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
			List<ChatLog> chatLogs = chatLogService.findTo(id);
			
			Map<Integer, Integer> map = new HashMap<Integer, Integer>();
			Map<Integer, Integer> map2 = new HashMap<Integer, Integer>();
			for (int i = chatLogs.size() - 1; i >= 0; i--) {
				Integer uid = chatLogs.get(i).getSenderId();
				Integer cid = chatLogs.get(i).getId();
				if (map.get(uid) == null) {
					map.put(uid, cid);
					map2.put(cid, uid);
				}
			}
			
			chatLogs = chatLogService.findFrom(id);
			for (int i = chatLogs.size() - 1; i >= 0; i--) {
				Integer uid = chatLogs.get(i).getReceiverId();
				Integer cid = chatLogs.get(i).getId();
				if (map.get(uid) == null) {
					map.put(uid, cid);
					map2.put(cid, uid);
				} else if (map.get(uid).compareTo(cid) < 0) {
					map2.remove(map.get(uid));
					map2.put(cid, uid);
				}
			}
			
			List<ChatLog> chats = new ArrayList<ChatLog>();
			
			for (Entry<Integer, Integer> item : map2.entrySet()){
			    Integer key = item.getKey();
			    Integer val = item.getValue();
			    System.out.println("key: "+key+"; value: "+val);
			    chats.add(chatLogService.findByPrimaryKey(key));
			}
			List<ChatViewModel> chatlogs = chatLogService.transform(chats);
			
			return View("/user/chatlog", model, chatlogs);
		} else {
	        return View("/user/project", model, projectService.getPVMByPosterId(user.getId()));
		}
	}
	
	/*======== 编辑个人信息 ========*/
	@GetMapping("/{id}/info/edit")
	public String editInfo(Model model, @PathVariable("id") Integer id) {
		User user = userService.findById(id);
		String name = user.getUsername();
		model.addAttribute("username", name);
		return View("/user/edit", model, user);
	}
	
	@PostMapping("/{id}/info/edit")
	public String submitEdit(Model model, HttpServletRequest request, @Valid User user, @PathVariable("id") Integer id) throws ParseException {
		User old = userService.findById(user.getId());
		String birthdayString = (String)request.getParameter("date");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday = sdf.parse(birthdayString);
		old.setBirthday(birthday);
		old.setSex(user.getSex());
		old.setUsername(user.getUsername());
		old.setIntro(user.getIntro());
		String pwd = user.getPassword();
		if (pwd != null) {
			old.setPassword(MD5.GetMD5Code(pwd));
		}
		userService.update(old);
		return RedirectTo("/user/{id}/info");
	}
	
	/*======== 删除私信 ========*/
	@GetMapping("/{id1}/chatlog/delete/{id2}")
	public String deleteAllChat(@PathVariable("id1") Integer id1, @PathVariable("id2") Integer id2) {
		List<ChatLog> chats = chatLogService.findBetween(id1, id2);
		for (int i = 0; i < chats.size(); i++) {
			ChatLog chat = chats.get(i);
			if (chat.getReceiverId() == id1) {
				chat.setReceiverId(-id1);
			} else {
				chat.setSenderId(-id1);
			}
			chatLogService.update(chat);
		}
		return RedirectTo("/user/{id1}/chatlog");
	}
}