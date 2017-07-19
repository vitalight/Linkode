package com.linkode.service;

import java.util.List;

import com.linkode.pojo.ProjectCommit;

public interface ProjectCommitService {
	int insert(ProjectCommit pc);
	int update(ProjectCommit pc);
	int deleteById(int id);
	
	ProjectCommit getById(int id);
	List<ProjectCommit> getAll();
	List<ProjectCommit> getByProjectId(int projectId);
}
