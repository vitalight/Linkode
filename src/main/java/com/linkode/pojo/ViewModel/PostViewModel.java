package com.linkode.pojo.ViewModel;

import java.util.Date;
import com.linkode.pojo.Post;

public class PostViewModel {
	private Integer id;
	private String type;
	private String title;
	private String content;
	private Date time;
	private Integer userId;
	private String username;
	private Integer cmtNum;

	public PostViewModel(Post post) {
		id = post.getId();
		userId = post.getUserId();
		title = post.getTitle();
		content = post.getContent();
		type = post.getType();
		time = post.getTime();

	}

	public PostViewModel() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsername() {
		return username;
	}

	public void setCmtNum(Integer cmtNum) {
		this.cmtNum = cmtNum;
	}

	public Integer getCmtNum() {
		return cmtNum;
	}
}