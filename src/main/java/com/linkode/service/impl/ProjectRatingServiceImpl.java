package com.linkode.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.linkode.dao.ProjectRatingMapper;
import com.linkode.pojo.ProjectRating;
import com.linkode.pojo.ProjectRatingExample;
import com.linkode.service.ProjectRatingService;

public class ProjectRatingServiceImpl implements ProjectRatingService {
	@Autowired
    private ProjectRatingMapper projectRatingMapper;
	
	public int insert(ProjectRating projectProjectRating) {
		projectRatingMapper.insert(projectProjectRating);
		return projectProjectRating.getId();
	}
	
	public int update(ProjectRating projectProjectRating) {
		return projectRatingMapper.updateByPrimaryKey(projectProjectRating);
	}
	
	public int deleteById(int id) {
		return projectRatingMapper.deleteByPrimaryKey(id);
	}
	
	public ProjectRating getById(int id) {
		return projectRatingMapper.selectByPrimaryKey(id);
	}
	
	public List<ProjectRating> getAll() {
		return projectRatingMapper.selectByExample(null);
	}

	@Override
	public ProjectRating getByProjectId(int id) {
		ProjectRatingExample projectRatingExample = new ProjectRatingExample();
	    ProjectRatingExample.Criteria criteria = projectRatingExample.createCriteria();
	    criteria.andProjectIdEqualTo(id);
	    List<ProjectRating> projectRatings = projectRatingMapper.selectByExample(projectRatingExample);
	    if (projectRatings.size()==0) {
	    	return null;
	    }
	    return projectRatings.get(0);
	}
}
