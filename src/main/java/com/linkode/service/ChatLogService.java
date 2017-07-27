package com.linkode.service;

import java.util.List;

import com.linkode.pojo.ChatLog;
import com.linkode.pojo.ViewModel.ChatViewModel;

public interface ChatLogService {
	ChatLog findByPrimaryKey(Integer id);
	List<ChatLog> findFrom(Integer id);
	List<ChatLog> findTo(Integer id);
	List<ChatLog> findFromTo(Integer fromId, Integer toId);
	List<ChatLog> findBetween(Integer id1, Integer id2);
	void insert(ChatLog chatLog);
	void update(ChatLog chatLog);
	List<ChatViewModel> transform(List<ChatLog> chatLogs);
}