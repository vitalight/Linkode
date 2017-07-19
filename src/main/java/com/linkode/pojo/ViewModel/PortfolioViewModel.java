package com.linkode.pojo.ViewModel;

import com.linkode.pojo.Portfolio;

public class PortfolioViewModel {
	private String username;
	private Integer id;
	private Integer userId;
	private String title;
	private String content;
	private String type;
	private int likes;
	private int comments;

	public PortfolioViewModel(Portfolio portfolio) {
		id = portfolio.getId();
		userId = portfolio.getUserId();
		title = portfolio.getTitle();
		content = portfolio.getContent();
		type = portfolio.getType();
		likes = portfolio.getLikes();
		comments = portfolio.getComments();
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String name) {
		this.username = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public int getLikes(){
		return likes;
	}
	
	public void setLikes(int likes){
		this.likes=likes;
	}
	public int getComments() {
		return comments;
	}
	
	public void setComments(int comments) {
		this.comments = comments;
	}
}