package com.linkode.service;

import java.util.List;

import com.linkode.pojo.ProjectApp;
import com.linkode.pojo.ViewModel.ProjectAppViewModel;
import com.linkode.util.DataPage;

public interface ProjectAppService {
	int insert(ProjectApp projectApp);
	int update(ProjectApp projectApp);
	int deleteById(int id);
	
	ProjectApp getById(int id);
	int hasApplied(int id, Integer userid);
	List<ProjectApp> getAll();
	ProjectAppViewModel getPAVMById(int id);
	List<ProjectAppViewModel> getPAVMByProjectId(int id);
	List<ProjectApp> getByProjectId(int id);
	
	DataPage<ProjectApp> selectPage(Integer pageNum, Integer pageSize, Integer indexCount);
}
