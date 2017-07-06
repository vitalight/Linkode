package com.linkode.test; 

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.linkode.service.ProjectService;
import com.linkode.service.UserService;
import com.linkode.util.DataPage;
import com.linkode.exception.CustomException;
import com.linkode.pojo.Project;
import com.linkode.pojo.ViewModel.ProjectViewModel;



@RunWith(SpringJUnit4ClassRunner.class)       
@ContextConfiguration(locations = {"file:src/main/resources/spring/applicationContext-service.xml","classpath:spring/applicationContext-dao.xml"})
public class ProjectTest {
    @Autowired
    private ProjectService projectService;
    private UserService userService;
    
    private void insert(){
    	Project project=new Project();
    	project.setMoney(111);
    	project.setRequirement("我是测试");
    	project.setTitle("测试");
    	project.setPosterId(1);
    	projectService.insert(project); 	
    }

    private void findByPrimaryKey() throws CustomException{
    	Project project=new Project();
    	project=projectService.findByPrimaryKey(1);
    	System.out.println("=============="+project.getRequirement()+"===============");
    }
    
    private void selectPVMpage(){
    	DataPage<ProjectViewModel> page = projectService.selectPVMPage(1, 10, 6);
    	List<ProjectViewModel> pvms= page.getData();
    	System.out.println("============"+pvms.get(0).getUsername()+"==============");
    }
    
    private void updateByPrimaryKey(){
    	Project project=new Project();
    	project.setMoney(111);
    	project.setId(4);
    	project.setRequirement("我不是测试");
    	project.setTitle("测试");
    	project.setPosterId(1);
    	projectService.updateByPrimaryKey(3, project);
    }
    
    private void selectpage(){
    	DataPage<Project> page=projectService.selectPage(1, 10, 6);
    	List<Project> projects=page.getData();
    	System.out.println("==============="+projects.get(0).getTitle()+"===================");
    }
    private void deleteByPrimaryKey(){
    	projectService.deleteByPrimaryKey(2);
    }
    @Test
    public void test() throws CustomException{
    	insert();
    	findByPrimaryKey();
    	selectpage();
    	selectPVMpage();
    	updateByPrimaryKey();
    	deleteByPrimaryKey();
    }
}