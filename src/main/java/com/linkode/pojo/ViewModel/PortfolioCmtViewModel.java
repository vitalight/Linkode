package com.linkode.pojo.ViewModel;

import java.util.Date;

import com.linkode.pojo.PortfolioCmt;

public class PortfolioCmtViewModel {
	private String username;
	private Integer id;
	private Integer portfolioId;
	private String content;
	private Integer userId;
	private Date time;
	
	public PortfolioCmtViewModel(PortfolioCmt portfolioCmt) {
		id = portfolioCmt.getId();
		portfolioId = portfolioCmt.getPortfolioId();
		content = portfolioCmt.getContent();
		userId = portfolioCmt.getUserId();
		time = portfolioCmt.getTime();
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

	public Integer PortfolioId() {
		return portfolioId;
	}

	public void setPortfolioId(Integer portfolioId) {
		this.portfolioId = portfolioId;
	}


	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	public int getUserId(){
		return userId;
	}
	
	public void setUserId(int userId){
		this.userId=userId;
	}
	
	public Date getTime(){
		return time;
	}
	
	public void setTime(Date time){
		this.time=time;
	}
}