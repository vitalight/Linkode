package com.linkode.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.Page;
import com.linkode.dao.ProjectAppMapper;
import com.linkode.dao.UserMapper;
import com.linkode.pojo.ProjectApp;
import com.linkode.pojo.ProjectAppExample;
import com.linkode.pojo.ViewModel.ProjectAppViewModel;
import com.linkode.service.ProjectAppService;
import com.linkode.util.DataPage;

public class ProjectAppServiceImpl implements ProjectAppService {

	@Autowired
	ProjectAppMapper projectAppMapper;
	@Autowired
	UserMapper userMapper;
	
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
	@Override
	public int hasApplied(int id, Integer userid) {
		if (userid==null) {
			return 0;
		}
		ProjectAppExample projectAppExample = new ProjectAppExample();
        ProjectAppExample.Criteria criteria = projectAppExample.createCriteria();
        criteria.andProjectIdEqualTo(id);
        criteria.andApplicantIdEqualTo(userid);
        List<ProjectApp> projectApps = projectAppMapper.selectByExample(projectAppExample);
        if (projectApps.isEmpty()) {
        	return 0;
        }
        return 1;
	}
	@Override
	public ProjectAppViewModel getPAVMById(int id) {
		ProjectAppViewModel pavm = new ProjectAppViewModel(getById(id));
		pavm.setUsername(userMapper.selectByPrimaryKey(pavm.getApplicantId()).getUsername());
		return pavm;
	}
	@Override
	public List<ProjectAppViewModel> getPAVMByProjectId(int id) {
		List<ProjectAppViewModel> ret = new ArrayList<ProjectAppViewModel>();
		List<ProjectApp> projectApps = getByProjectId(id);
		for (ProjectApp projectApp:projectApps) {
			ProjectAppViewModel pavm = new ProjectAppViewModel(projectApp);
			pavm.setUsername(userMapper.selectByPrimaryKey(pavm.getApplicantId()).getUsername());
			ret.add(pavm);
		}
		return ret;
	}
	@Override
	public List<ProjectApp> getByProjectId(int id) {
		ProjectAppExample projectAppExample = new ProjectAppExample();
        ProjectAppExample.Criteria criteria = projectAppExample.createCriteria();
        criteria.andProjectIdEqualTo(id);
        List<ProjectApp> projectApps = projectAppMapper.selectByExample(projectAppExample);
        return projectApps;
	}
}
