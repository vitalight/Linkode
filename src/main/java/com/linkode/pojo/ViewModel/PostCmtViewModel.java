package com.linkode.pojo.ViewModel;

import java.util.Date;
import com.linkode.pojo.PostCmt;

public class PostCmtViewModel {
    private Integer id;
    private Integer postid;
    private String content;
    private Date time;
    private Integer userId;   
    private String username;
    private Integer postCmtId;
    private String respondName;
    
    public PostCmtViewModel(PostCmt postCmt) {
		this.id = postCmt.getId();
		this.userId = postCmt.getUserId();
		this.postid = postCmt.getPostid();
		this.content = postCmt.getContent();
		this.postCmtId = postCmt.getPostCmtId();
		this.time=postCmt.getTime();
		
	}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPostCmtId(){
    	return postCmtId;
    }
    
    public void setRespondName(String respondName){
    	this.respondName=respondName;
    }
    
    public String getRespondName(){
    	return respondName;
    }
    
    public void setPostCmtId(Integer postCmtId){
    	this.postCmtId=postCmtId;
    }
    
    public void setPostId(Integer postId){
    	this.postid=postId;
    }
    
    public Integer getPostId(){
    	return postid;
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
    
    public void setUsername(String username){
    	this.username=username;
    }
    
    public String getUsername(){
    	return username;
    }
    
}