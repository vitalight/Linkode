package com.linkode.pojo.ViewModel;

import java.util.Date;

import com.linkode.pojo.ChatLog;

public class ChatViewModel {
	private Integer id;
	private Integer senderId;
	private Integer receiverId;
	private String senderName;
	private String receiverName;
	private String content;
	private Date time;
	private int messages;
	
	public ChatViewModel(ChatLog chatLog){
		this.id = chatLog.getId();
		this.senderId = chatLog.getSenderId();
		this.receiverId = chatLog.getReceiverId();
		this.content = chatLog.getContent();
		this.time = chatLog.getTime();
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public void setSenderId(Integer id) {
		this.senderId = id;
	}
	
	public void setReceiverId(Integer id) {
		this.receiverId = id;
	}
	
	public void setTime(Date date) {
		this.time = date;
	}
	
	public void setSenderName(String name) {
		this.senderName = name;
	}
	
	public void setReceiverName(String name) {
		this.receiverName = name;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public Integer getId() {
		return id;
	}
	
	public Integer getSenderId() {
		return senderId;
	}
	
	public Integer getReceiverId() {
		return receiverId;
	}
	
	public String getSenderName() {
		return senderName;
	}
	
	public String getReceiverName() {
		return receiverName;
	}
	
	public String getContent() {
		return content;
	}
	
	public Date getTime() {
		return time;
	}

	public int getMessages() {
		return messages;
	}

	public void setMessages(int messages) {
		this.messages = messages;
	}
}