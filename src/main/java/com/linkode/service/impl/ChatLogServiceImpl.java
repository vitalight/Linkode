package com.linkode.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.linkode.dao.ChatLogMapper;
import com.linkode.dao.UserMapper;
import com.linkode.pojo.ChatLog;
import com.linkode.pojo.ChatLogExample;
import com.linkode.pojo.ViewModel.ChatViewModel;
import com.linkode.service.ChatLogService;
import com.linkode.service.UserService;

public class ChatLogServiceImpl implements ChatLogService {
	
	@Autowired
	private ChatLogMapper chatLogMapper;
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public ChatLog findByPrimaryKey(Integer id) {
		ChatLog chatLog = chatLogMapper.selectByPrimaryKey(id);
		return chatLog;
	}
	
	@Override
	public List<ChatLog> findFrom(Integer id) {
		ChatLogExample chatLogExample = new ChatLogExample();
		ChatLogExample.Criteria criteria = chatLogExample.createCriteria();
		criteria.andSenderIdEqualTo(id);
		List<ChatLog> chatLogs = chatLogMapper.selectByExample(chatLogExample);
		return chatLogs;
	}
	
	@Override
	public List<ChatLog> findTo(Integer id) {
		ChatLogExample chatLogExample = new ChatLogExample();
		ChatLogExample.Criteria criteria = chatLogExample.createCriteria();
		criteria.andReceiverIdEqualTo(id);
		List<ChatLog> chatLogs = chatLogMapper.selectByExample(chatLogExample);
		return chatLogs;
	}
	
	@Override
	public List<ChatLog> findFromTo(Integer fromId, Integer toId) {
		ChatLogExample chatLogExample = new ChatLogExample();
		ChatLogExample.Criteria criteria = chatLogExample.createCriteria();
		criteria.andSenderIdEqualTo(fromId);
		criteria.andReceiverIdEqualTo(toId);
		List<ChatLog> chatLogs = chatLogMapper.selectByExample(chatLogExample);
		return chatLogs;
	}
	
	@Override
	public List<ChatLog> findBetween(Integer id1, Integer id2) {
		ChatLogExample chatLogExample1 = new ChatLogExample();
		ChatLogExample.Criteria criteria1 = chatLogExample1.createCriteria();
		criteria1.andSenderIdEqualTo(id1);
		criteria1.andReceiverIdEqualTo(id2);
		List<ChatLog> chatLogs1 = chatLogMapper.selectByExample(chatLogExample1);
		
		ChatLogExample chatLogExample2 = new ChatLogExample();
		ChatLogExample.Criteria criteria2 = chatLogExample2.createCriteria();
		criteria2.andSenderIdEqualTo(id2);
		criteria2.andReceiverIdEqualTo(id1);
		List<ChatLog> chatLogs2 = chatLogMapper.selectByExample(chatLogExample2);
		
		int i = chatLogs1.size() - 1, j = chatLogs2.size() - 1;
		List<ChatLog> chatLogs = new ArrayList<ChatLog>();
		while(i >= 0 || j >= 0) {
			if (i < 0) {
				chatLogs.add(chatLogs2.get(j--));
			} else if (j < 0) {
				chatLogs.add(chatLogs1.get(i--));
			} else {
				ChatLog chat1 = chatLogs1.get(i), chat2 = chatLogs2.get(j);
				if (chat1.getId() > chat2.getId()) {
					chatLogs.add(chat1);
					i--;
				} else {
					chatLogs.add(chat2);
					j--;
				}
			}
		}
		
		for (int k = 0; k < chatLogs.size(); k++) {
			System.out.println("chat "+k+": "+chatLogs.get(k).getId());
			System.out.println("   content: "+chatLogs.get(k).getContent());
		}
		return chatLogs;
	}
	
	@Override
	public void insert(ChatLog chatLog) {
		chatLogMapper.insert(chatLog);
	}
	
	@Override
	public List<ChatViewModel> transform(List<ChatLog> chatLogs) {
		List<ChatViewModel> chats = new ArrayList<ChatViewModel>();
		for (int i = 0; i < chatLogs.size(); i++) {
			ChatViewModel chat = new ChatViewModel();
			ChatLog chatLog = chatLogs.get(i);
			chat.setContent(chatLog.getContent());
			chat.setSenderId(Math.abs(chatLog.getSenderId()));
			chat.setReceiverId(Math.abs(chatLog.getReceiverId()));
			chat.setTime(chatLog.getTime());
			chat.setId(chatLog.getId());
			String senderName = userMapper.selectByPrimaryKey(Math.abs(chatLog.getSenderId())).getUsername();
			String receiverName = userMapper.selectByPrimaryKey(Math.abs(chatLog.getReceiverId())).getUsername();
			chat.setSenderName(senderName);
			chat.setReceiverName(receiverName);
			chats.add(chat);
		}
		return chats;
	}
	
	@Override
	public void update(ChatLog chatLog) {
		chatLogMapper.updateByPrimaryKey(chatLog);
	}
}