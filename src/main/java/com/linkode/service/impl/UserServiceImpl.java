package com.linkode.service.impl;

import com.linkode.dao.RelationMapper;
import com.linkode.dao.UserMapper;
import com.linkode.pojo.Relation;
import com.linkode.pojo.RelationExample;
import com.linkode.pojo.User;
import com.linkode.pojo.UserExample;
import com.linkode.pojo.ViewModel.LoginViewModel;
import com.linkode.service.UserService;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


public class UserServiceImpl implements UserService {

	@Autowired
	private RelationMapper relationMapper;
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
    	user.setUsername(user.getUsername().replaceAll("</?[^>]+>", ""));
    	userMapper.insert(user);
    	return user.getId();
    }
    
    @Override
    public int insert(LoginViewModel loginViewModel) {
    	User user = new User();
    	user.setEmail(loginViewModel.getEmail());
    	user.setPassword(loginViewModel.getPassword());
    	user.setRole("guest");
    	user.setUsername(loginViewModel.getEmail().split("@")[0]);
    	user.setRatingNumber(0);
    	user.setRatingTotal(0);
    	user.setMoney(0);
    	user.setSex("secret");
    	userMapper.insert(user);
    	return user.getId();
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
    
    @Override
    public int update(User user) {
    	user.setUsername(user.getUsername().replaceAll("</?[^>]+>", ""));
    	return userMapper.updateByPrimaryKey(user);
    }
    
    @Override
	public int deleteById(int id) {
    	return userMapper.deleteByPrimaryKey(id);
    }
	
    @Override
	public User getById(int id) {
    	return userMapper.selectByPrimaryKey(id);
    }
    
    @Override
	public List<User> getAll() {
    	return userMapper.selectByExample(null);
    }

	@Override
	public List<User> search(String string) {
    	UserExample userExample = new UserExample();
    	UserExample.Criteria criteria = userExample.createCriteria();
    	criteria.andUsernameLike("%"+string+"%");
    	
    	List<User> users = userMapper.selectByExample(userExample);
		return users;
	}

	@Override
	public List<User> getByLikerId(int id) {
		RelationExample relationExample = new RelationExample();
		RelationExample.Criteria criteria = relationExample.createCriteria();
		criteria.andSenderIdEqualTo(id);
		criteria.andLikesEqualTo(1);
		List<Relation> relations = relationMapper.selectByExample(relationExample);
		
		if (relations.size()==0) {
			return null;
		}
		List<Integer> userIds = new ArrayList<Integer>();
		for (Relation relation:relations) {
			userIds.add(relation.getReceiverId());
		}
		
    	UserExample userExample = new UserExample();
    	UserExample.Criteria ucriteria = userExample.createCriteria();
    	ucriteria.andIdIn(userIds);
    	List<User> users = userMapper.selectByExample(userExample);
		return users;
	}
}

