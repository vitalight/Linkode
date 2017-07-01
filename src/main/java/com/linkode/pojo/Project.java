package com.linkode.pojo;

import java.util.Date;

public class Project {
    private Integer id;

    private Integer posterid;

    private Integer contractorid;

    private String title;

    private String requirement;

    private String type;

    private Date startdate;

    private Date enddate;

    private String status;

    private Integer money;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPosterid() {
        return posterid;
    }

    public void setPosterid(Integer posterid) {
        this.posterid = posterid;
    }

    public Integer getContractorid() {
        return contractorid;
    }

    public void setContractorid(Integer contractorid) {
        this.contractorid = contractorid;
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

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }
}