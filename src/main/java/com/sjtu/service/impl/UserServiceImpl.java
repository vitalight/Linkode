package com.sjtu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sjtu.dao.UserDao;
import com.sjtu.entity.User;
import com.sjtu.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Resource
	private  UserDao userDao;
	
	public User getUserById(int userId) {
		// TODO Auto-generated method stub
		return this.userDao.selectByPrimaryKey(userId);
	}

}