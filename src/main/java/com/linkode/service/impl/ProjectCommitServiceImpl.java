package com.linkode.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.linkode.dao.ProjectCommitMapper;
import com.linkode.pojo.ProjectCommit;
import com.linkode.pojo.ProjectCommitExample;
import com.linkode.pojo.ViewModel.ProjectCommitViewModel;
import com.linkode.service.ProjectCommitService;

public class ProjectCommitServiceImpl implements ProjectCommitService{

	@Autowired
	ProjectCommitMapper pcm;
	
	@Override
	public int insert(ProjectCommit pc) {
		pcm.insert(pc);
		return pc.getId();
	}

	@Override
	public int update(ProjectCommit pc) {
		return pcm.updateByPrimaryKey(pc);
		
	}

	@Override
	public int deleteById(int id) {
		return pcm.deleteByPrimaryKey(id);
	}

	@Override
	public ProjectCommit getById(int id) {
		return pcm.selectByPrimaryKey(id);
	}

	@Override
	public List<ProjectCommit> getAll() {
		return pcm.selectByExample(null);
	}

	@Override
	public List<ProjectCommit> getByProjectId(int projectId) {
		ProjectCommitExample projectCommitExample = new ProjectCommitExample();
        ProjectCommitExample.Criteria criteria = projectCommitExample.createCriteria();
        criteria.andProjectIdEqualTo(projectId);
        List<ProjectCommit> projectCommits = pcm.selectByExample(projectCommitExample);
		return projectCommits;
	}
/*
	@Override
	public List<ProjectCommitViewModel> getPCVMByProjectId(int projectId) {
		List<ProjectCommitViewModel> ret = new ArrayList<ProjectCommitViewModel>();
		for (ProjectCommit projectCommit:getByProjectId(projectId)) {
			ProjectCommitViewModel pcvm = new ProjectCommitViewModel(projectCommit);
			pcvm.setUsername(userMapper.selectByPrimaryKey(pcvm.get));
		}
		return null;
	}*/
}
