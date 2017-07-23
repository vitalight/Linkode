package com.linkode.pojo;

import java.util.Date;

public class PostCmt {
    private Integer id;

    private Integer postid;

    private String content;

    private Date time;

    private Integer userId;

    private Integer postCmtId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPostid() {
        return postid;
    }

    public void setPostid(Integer postid) {
        this.postid = postid;
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

    public Integer getPostCmtId() {
        return postCmtId;
    }

    public void setPostCmtId(Integer postCmtId) {
        this.postCmtId = postCmtId;
    }
}