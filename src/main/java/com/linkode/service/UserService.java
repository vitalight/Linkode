package com.linkode.service;


import com.linkode.pojo.User;
import com.linkode.pojo.ViewModel.LoginViewModel;


public interface UserService {
    User findByEmail(String email);
    int insert(User user);
    public int insert(LoginViewModel loginViewModel);
    User findById(Integer id);
}
