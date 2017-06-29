package com.linkode.pojo.ViewModel;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;


public class LoginViewModel {
    @NotEmpty(message="{loginviewmodel.email.length.error}")
    @Email(message="{loginviewmodel.email.pattern.error}")
    private String email;
    @NotEmpty(message="{loginviewmodel.password.length.error}")
    private String password;
    private Boolean remember;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getRemember() {
        return remember == null ? false : true;
    }

    public void setRemember(Boolean remember) {
        this.remember = remember;
    }
}
