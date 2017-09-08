package com.linkode.service;

import java.util.List;

import com.linkode.pojo.ProjectRating;
import com.linkode.pojo.ViewModel.ProjectRatingViewModel;

public interface ProjectRatingService {
	int insert(ProjectRating projectRating);
	int update(ProjectRating projectRating);
	int deleteById(int id);
	
	ProjectRating getById(int id);
	ProjectRating getByProjectId(int id);
	List<ProjectRatingViewModel> getByContractorId(int id);
	List<ProjectRating> getAll();
}
