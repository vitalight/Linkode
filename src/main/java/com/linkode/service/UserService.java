package com.linkode.service;

import com.linkode.pojo.User;


public interface UserService {
    User findByEmail(String email);
}
