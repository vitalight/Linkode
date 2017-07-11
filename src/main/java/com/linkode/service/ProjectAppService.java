package com.linkode.service;

import java.util.List;

import com.linkode.pojo.ProjectApp;
import com.linkode.util.DataPage;

public interface ProjectAppService {
	int insert(ProjectApp projectApp);
	int update(ProjectApp projectApp);
	int deleteById(int id);
	
	ProjectApp getById(int id);
	List<ProjectApp> getAll();
	DataPage<ProjectApp> selectPage(Integer pageNum, Integer pageSize, Integer indexCount);
}
