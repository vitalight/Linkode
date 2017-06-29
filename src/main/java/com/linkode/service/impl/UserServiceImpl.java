package com.linkode.service.impl;

import com.linkode.dao.UserMapper;
import com.linkode.pojo.User;
import com.linkode.pojo.UserExample;
import com.linkode.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;


public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User findByEmail(String email) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andEmailEqualTo(email);
        User user = userMapper.selectByExample(userExample).get(0);
        return user;
    }
}

