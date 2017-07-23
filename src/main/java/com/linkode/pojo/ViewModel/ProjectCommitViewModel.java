package com.linkode.pojo.ViewModel;

import java.util.Date;

import com.linkode.pojo.ProjectCommit;

public class ProjectCommitViewModel {

    private Integer id;

    private Date time;

    private String content;

    private String result;

    private Integer projectId;

    private String username;
    
    public ProjectCommitViewModel(ProjectCommit projectCommit) {
    	this.id=projectCommit.getId();
    	this.time = projectCommit.getTime();
    	this.content = projectCommit.getContent();
    	this.result = projectCommit.getResult();
    	this.projectId = projectCommit.getProjectId();
    }
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}
