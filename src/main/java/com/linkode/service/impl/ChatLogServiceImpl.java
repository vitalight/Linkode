package com.linkode.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.linkode.dao.ChatLogMapper;
import com.linkode.dao.RelationMapper;
import com.linkode.dao.UserMapper;
import com.linkode.pojo.ChatLog;
import com.linkode.pojo.ChatLogExample;
import com.linkode.pojo.Relation;
import com.linkode.pojo.ViewModel.ChatViewModel;
import com.linkode.service.ChatLogService;
import com.linkode.service.RelationService;
import com.linkode.service.UserService;

public class ChatLogServiceImpl implements ChatLogService {
	
	@Autowired
	private ChatLogMapper chatLogMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RelationService relationService;
	
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
		ChatLogExample chatLogExample = new ChatLogExample();
		ChatLogExample.Criteria criteria1 = chatLogExample.createCriteria();
		criteria1.andSenderIdEqualTo(id2);
		criteria1.andReceiverIdEqualTo(id1);

		ChatLogExample.Criteria criteria2 = chatLogExample.createCriteria();
		criteria2.andSenderIdEqualTo(id1);
		criteria2.andReceiverIdEqualTo(id2);
		chatLogExample.or(criteria2);
		
		List<ChatLog> chatLogs = chatLogMapper.selectByExample(chatLogExample);
		
		return chatLogs;
	}
	
	@Override
	public void insert(ChatLog chatLog) {
		chatLogMapper.insert(chatLog);
		relationService.sendMessage(chatLog.getSenderId(), chatLog.getReceiverId());
	}
	
	@Override
	public List<ChatViewModel> transform(List<ChatLog> chatLogs, int id) {
		List<ChatViewModel> chats = new ArrayList<ChatViewModel>();
		for (int i = 0; i < chatLogs.size(); i++) {
			ChatLog chatLog = chatLogs.get(i);
			ChatViewModel chat = new ChatViewModel(chatLog);
			String senderName = userMapper.selectByPrimaryKey(chatLog.getSenderId()).getUsername();
			String receiverName = userMapper.selectByPrimaryKey(chatLog.getReceiverId()).getUsername();
			
			Relation relation;
			if (chat.getSenderId()==id) {
				relation = relationService.getBy2UserId(chat.getReceiverId(), id);
			} else {
				relation = relationService.getBy2UserId(chat.getSenderId(), id);
			}
			if (relation != null) {
				chat.setMessages(relation.getMessages());
			} else {
				chat.setMessages(0);
			}
			chat.setSenderName(senderName);
			chat.setReceiverName(receiverName);
			chats.add(chat);
		}
		return chats;
	}
	
	public List<ChatViewModel> transform(List<ChatLog> chatLogs) {
		List<ChatViewModel> chats = new ArrayList<ChatViewModel>();
		for (int i = 0; i < chatLogs.size(); i++) {
			ChatLog chatLog = chatLogs.get(i);
			ChatViewModel chat = new ChatViewModel(chatLog);
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

	@Override
	public List<ChatViewModel> getByUserId(int id) {
		ChatLogExample chatLogExample = new ChatLogExample();
		ChatLogExample.Criteria criteria = chatLogExample.createCriteria();
		ChatLogExample.Criteria orCriteria = chatLogExample.createCriteria();
		criteria.andReceiverIdEqualTo(id);
		orCriteria.andSenderIdEqualTo(id);
		chatLogExample.or(orCriteria);
		List<ChatLog> chatLogs = chatLogMapper.selectByExample(chatLogExample);
		
		List<ChatLog> firstChatLogs = new ArrayList<ChatLog>();
		Set<Integer> senderIds = new HashSet<Integer>();
		for (int i=chatLogs.size()-1; i>=0; i--) {
			ChatLog chatLog = chatLogs.get(i);
			if (!senderIds.contains(chatLog.getSenderId()) 
					&& !senderIds.contains(chatLog.getReceiverId())) {
				chatLog.setContent(chatLog.getContent().replaceAll("</?[^>]+>", ""));
				firstChatLogs.add(chatLog);
				if (chatLog.getSenderId()!=id) {
					senderIds.add(chatLog.getSenderId());
				}
				if (chatLog.getReceiverId()!=id) {
					senderIds.add(chatLog.getReceiverId());
				}
			}
		}
		
		return transform(firstChatLogs, id);
	}

	@Override
	public void systemMessage(int id, String message) {
		ChatLog chatlog = new ChatLog();
		chatlog.setSenderId(0);
		chatlog.setReceiverId(id);
		chatlog.setContent(message);
		chatlog.setTime(new java.util.Date());
		chatLogMapper.insert(chatlog);
		relationService.sendMessage(0, id);
	}
}