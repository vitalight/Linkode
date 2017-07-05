package com.linkode.service.impl;

import com.linkode.dao.UserMapper;
import com.linkode.pojo.User;
import com.linkode.pojo.UserExample;
import com.linkode.pojo.ViewModel.LoginViewModel;
import com.linkode.service.UserService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User findByEmail(String email) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andEmailEqualTo(email);
        List<User> users = userMapper.selectByExample(userExample);
        if (users.isEmpty()) {
        	return null;
        }
        User user = users.get(0);
        return user;
    }
    
    @Override
    public int insert(User user) {
    	return userMapper.insert(user);
    }
    
    @Override
    public int insert(LoginViewModel loginViewModel) {
    	User user = new User();
    	user.setEmail(loginViewModel.getEmail());
    	user.setPassword(loginViewModel.getPassword());
    	user.setRole("guest");
    	user.setUsername(loginViewModel.getEmail().split("@")[0]);
    	
    	return userMapper.insert(user);
    }
    
    @Override
    public User findById(Integer id) {
    	UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andIdEqualTo(id);
        List<User> users = userMapper.selectByExample(userExample);
        if (users.isEmpty()) {
        	return null;
        }
        User user = users.get(0);
        return user;
    }
}

