package com.linkode.pojo.ViewModel;

import java.util.Date;

public class ProjectViewModel {
	private String username;
	private Integer id;
	private Integer posterId;
	private String title;
	private String requirement;
	private Integer money;
	private String status;
	private Date startDate;
	private Date endDate;
	private String type;


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

	public Integer getPosterId() {
		return posterId;
	}

	public void setPosterId(Integer id) {
		this.posterId = id;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRequirement() {
		return requirement;
	}

	public void setRequirement(String req) {
		this.requirement = req;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String st) {
		this.status = st;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}