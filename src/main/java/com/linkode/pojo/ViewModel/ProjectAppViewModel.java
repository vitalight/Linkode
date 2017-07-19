package com.linkode.pojo.ViewModel;

import java.util.Date;

import com.linkode.pojo.ProjectApp;

public class ProjectAppViewModel {
    private Integer id;

    private Integer projectId;

    private Integer applicantId;

    private String content;

    private Date time;
    
    private String username;
    
    private Integer result;

    public ProjectAppViewModel(ProjectApp projectApp) {
    	this.id = projectApp.getId();
    	this.projectId = projectApp.getProjectId();
    	this.applicantId = projectApp.getApplicantId();
    	this.content = projectApp.getContent();
    	this.time = projectApp.getTime();
    	this.result = projectApp.getResult();
    }
    
    public Integer getResult() {
    	return result;
    }
    
    public void setResult(int result) {
    	this.result = result;
    }
    
    public String getUsername() {
    	return username;
    }
    
    public void setUsername(String username) {
    	this.username = username;
    }
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getApplicantId() {
        return applicantId;
    }

    public void setApplicantId(Integer applicantId) {
        this.applicantId = applicantId;
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
}