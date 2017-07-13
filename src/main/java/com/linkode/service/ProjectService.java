package com.linkode.service;

import com.linkode.pojo.Project;
import com.linkode.pojo.ViewModel.ProjectViewModel;

import java.util.List;

import com.linkode.exception.CustomException;
import com.linkode.util.DataPage;


public interface ProjectService {
    int insert(Project project);
    void deleteByPrimaryKey(Integer id);
    void updateByPrimaryKey(Project project);
    DataPage<Project> selectPage(Integer pagenum, Integer pageSize, Integer indexCount);
    DataPage<ProjectViewModel> selectPVMPage(Integer pageNum, Integer pageSize, Integer indexCount);
    Project findByPrimaryKey(Integer id) throws CustomException;
    
	int update(Project project);
	int deleteById(int id);
	
	Project getById(int id);
	List<Project> getAll();
}