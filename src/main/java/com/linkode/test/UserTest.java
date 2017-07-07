package com.linkode.test; 

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.linkode.service.UserService;
import com.linkode.pojo.User;



@RunWith(SpringJUnit4ClassRunner.class)       
@ContextConfiguration(locations = {"file:src/main/resources/spring/applicationContext-service.xml","classpath:spring/applicationContext-dao.xml"})
public class UserTest {
    @Autowired
    private UserService userService;
    
    
    private void findByEmail(){
    	String email ="admin@sjtu.edu.cn";
        User user = userService.findByEmail(email);
        System.out.println("=========="+user.getSex()+"==========");
    }
   
    private void register(){
    	User user=new User();
    	user.setEmail("111@qq.com");
    	user.setPassword("111");
    	user.setUsername("我是测试品");
    	System.out.println("=========="+userService.insert(user)+"===========");
    }
   
    private void findById(){
    	User user=new User();
    	user=userService.findById(1);
    	System.out.println("==========="+user.getSex()+"===========");
    }
   @Test
   public void test(){
	   findByEmail();
	   register();
	   findById();
   }
}