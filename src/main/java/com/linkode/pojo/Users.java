package com.linkode.pojo;

import java.util.Date;

public class Users {
    private Integer id;

    private String username;

    private String password;

    private String email;

    private Integer ratingnumber;

    private Integer ratingtotal;

    private String sex;

    private Date birthday;

    private String role;

    private Integer money;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getRatingnumber() {
        return ratingnumber;
    }

    public void setRatingnumber(Integer ratingnumber) {
        this.ratingnumber = ratingnumber;
    }

    public Integer getRatingtotal() {
        return ratingtotal;
    }

    public void setRatingtotal(Integer ratingtotal) {
        this.ratingtotal = ratingtotal;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }
}