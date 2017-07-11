package com.linkode.service;


import java.util.List;

import com.linkode.pojo.User;
import com.linkode.pojo.ViewModel.LoginViewModel;
import com.linkode.util.DataPage;


public interface UserService {
    User findByEmail(String email);
    int insert(User user);
    public int insert(LoginViewModel loginViewModel);
    User findById(Integer id);
    
	int update(User user);
	int deleteById(int id);
	
	User getById(int id);
	List<User> getAll();
}
