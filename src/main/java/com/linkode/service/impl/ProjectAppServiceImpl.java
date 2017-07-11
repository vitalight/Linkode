package com.linkode.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.Page;
import com.linkode.dao.ProjectAppMapper;
import com.linkode.pojo.ProjectApp;
import com.linkode.service.ProjectAppService;
import com.linkode.util.DataPage;

public class ProjectAppServiceImpl implements ProjectAppService {

	@Autowired
	ProjectAppMapper projectAppMapper;
	
	public int insert(ProjectApp projectApp) {
		projectAppMapper.insert(projectApp);
		return projectApp.getId();
	}
	public int update(ProjectApp projectApp) {
		return projectAppMapper.updateByPrimaryKey(projectApp);
	}
	public int deleteById(int id) {
		return projectAppMapper.deleteByPrimaryKey(id);
	}
	
	public ProjectApp getById(int id) {
		return projectAppMapper.selectByPrimaryKey(id);
	}
	public List<ProjectApp> getAll() {
		return projectAppMapper.selectByExample(null);
	}
	public DataPage<ProjectApp> selectPage(Integer pageNum, Integer pageSize, Integer indexCount) {
		List<ProjectApp> projectApps = projectAppMapper.selectByExample(null);
		
		Integer pageCount = ((Page)projectApps).getPages();
		DataPage<ProjectApp> page = new DataPage<ProjectApp>();
		
		page.setData(projectApps);
        page.setIndexCount(indexCount);
        page.setPageCount(pageCount);
        page.setPageSize(pageSize);
        page.setPageNum(pageNum);
        return page;
	}
}
