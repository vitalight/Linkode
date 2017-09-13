package com.linkode.service.impl;

import com.linkode.pojo.ViewModel.ProjectViewModel;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.linkode.dao.ProjectAppMapper;
import com.linkode.dao.ProjectMapper;
import com.linkode.dao.UserMapper;
import com.linkode.exception.CustomException;
import com.linkode.pojo.Project;
import com.linkode.pojo.ProjectApp;
import com.linkode.pojo.ProjectAppExample;
import com.linkode.pojo.ProjectExample;
import com.linkode.service.ProjectService;
import com.linkode.util.DataPage;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectMapper projectMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private ProjectAppMapper projectAppMapper;

    @Override
    public Project findByPrimaryKey(Integer id) throws CustomException {

        Project project = projectMapper.selectByPrimaryKey(id);
        if(project == null) {
            throw new CustomException("记录不存在！");
        }
        return project;
    }

    @Override
    public int insert(Project project) {
    	project.setTitle(project.getTitle().replaceAll("</?[^>]+>", ""));
        projectMapper.insert(project);
        return project.getId();
    }

    @Override
    public void deleteByPrimaryKey(Integer id) {
        projectMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateByPrimaryKey(Project project) {
    	project.setTitle(project.getTitle().replaceAll("</?[^>]+>", ""));
        projectMapper.updateByPrimaryKey(project);
    }

    @Override
    public DataPage<Project> selectPage(Integer pageNum, Integer pageSize, Integer indexCount) {
        PageHelper.startPage(pageNum, pageSize);
        List<Project> projects = projectMapper.selectByExample(null);

        Integer pageCount = ((Page)projects).getPages();
        pageNum = pageNum > pageCount ? pageCount : pageNum;

        DataPage<Project> page = new DataPage<Project>();
        page.setData(projects);
        page.setIndexCount(indexCount);
        page.setPageCount(pageCount);
        page.setPageSize(pageSize);
        page.setPageNum(pageNum);

        return page;
    }

    @Override
    public DataPage<ProjectViewModel> selectPVMPage(Integer pageNum, Integer pageSize, Integer indexCount) {
        PageHelper.startPage(pageNum, pageSize);
        List<Project> projects = projectMapper.selectByExample(null);
        List<ProjectViewModel> pvms = transfer(projects);
        Integer pageCount = ((Page)projects).getPages();
        pageNum = pageNum > pageCount ? pageCount : pageNum;

        DataPage<ProjectViewModel> page = new DataPage<ProjectViewModel>();
        page.setData(pvms);
        page.setIndexCount(indexCount);
        page.setPageCount(pageCount);
        page.setPageSize(pageSize);
        page.setPageNum(pageNum);

        return page;
    }
    
    public int update(Project project) {
    	return projectMapper.updateByPrimaryKey(project);
    }
	public int deleteById(int id) {
		return projectMapper.deleteByPrimaryKey(id);
	}
	
	public Project getById(int id) {
		return projectMapper.selectByPrimaryKey(id);
	}
	public List<Project> getAll() {
		ProjectExample projectExample = new ProjectExample();
        projectExample.setOrderByClause("id desc");
		return projectMapper.selectByExample(projectExample);
	}
	public List<Project> getByPosterId(int id) {
        ProjectExample projectExample = new ProjectExample();
        ProjectExample.Criteria criteria = projectExample.createCriteria();
        criteria.andPosterIdEqualTo(id);
        projectExample.setOrderByClause("id desc");
        List<Project> projects = projectMapper.selectByExample(projectExample);
        if (projects.isEmpty()) {
        	return null;
        }
        return projects;
	}
	public List<Project> getByContractorId(int id) {
        ProjectExample projectExample = new ProjectExample();
        ProjectExample.Criteria criteria = projectExample.createCriteria();
        criteria.andContractorIdEqualTo(id);
        projectExample.setOrderByClause("id desc");
        List<Project> projects = projectMapper.selectByExample(projectExample);
        if (projects.isEmpty()) {
        	return null;
        }
        return projects;
	}

	@Override
	public List<Project> getByApplicantId(int id) {
		// to optimize
		ProjectAppExample projectAppExample = new ProjectAppExample();
		ProjectAppExample.Criteria criteria = projectAppExample.createCriteria();
		criteria.andApplicantIdEqualTo(id);
		criteria.andResultIsNull();
		List<ProjectApp> projectApps = projectAppMapper.selectByExample(projectAppExample);
		if (projectApps.isEmpty()) {
			return null;
		}
		Set<Integer> set = new HashSet<Integer>();
		List<Integer> list = new ArrayList<Integer>();
		for (ProjectApp projectApp:projectApps) {
			set.add(projectApp.getProjectId());
		}
		
		ProjectExample projectExample = new ProjectExample();
		ProjectExample.Criteria pCriteria = projectExample.createCriteria();
		list.addAll(set);
		pCriteria.andIdIn(list);
        projectExample.setOrderByClause("id desc");
        return projectMapper.selectByExample(projectExample);
	}
	
	public List<ProjectViewModel> transfer(List<Project> projects) {
		if(projects == null) {
			return null;
		}
		List<ProjectViewModel> pvms = new ArrayList<ProjectViewModel>();
		for (Project project:projects) {
            ProjectViewModel pvm = new ProjectViewModel(project);
            pvm.setUsername(userMapper.selectByPrimaryKey(project.getPosterId()).getUsername());
            pvms.add(pvm);
        }
		return pvms;
	}
	
	public ProjectViewModel findPVMByPrimaryKey(int id) throws CustomException {
		Project project = findByPrimaryKey(id);
		ProjectViewModel pvm = new ProjectViewModel(project);
		pvm.setUsername(userMapper.selectByPrimaryKey(project.getPosterId()).getUsername());
		return pvm;
	}
	
	public List<ProjectViewModel> getUncontractedPVM() {
		List<ProjectViewModel> pvms = getAllPVM();
		List<ProjectViewModel> ret = new ArrayList<ProjectViewModel>();
		for (ProjectViewModel pvm:pvms) {
			if (pvm.getStatus().equals("post") && pvm.getEndDate().after(new java.util.Date())) {
				ret.add(pvm);
			}
		}
		return ret;
	}

	public List<ProjectViewModel> getPVMByPosterId(int id) {
		return transfer(getByPosterId(id));
	}
	
	public List<ProjectViewModel> getPVMByContractorId(int id) {
		return transfer(getByContractorId(id));
	}

	public List<ProjectViewModel> getAllPVM() {
		return transfer(getAll());
	}

	@Override
	public List<ProjectViewModel> getPVMByApplicantId(int id) {
		return transfer(getByApplicantId(id));
	}
	/*
	 * 
	 */
	@Override
	public List<ProjectViewModel> search(String string) {
    	ProjectExample projectExample = new ProjectExample();
    	ProjectExample.Criteria criteria = projectExample.createCriteria(), criteria2 = projectExample.createCriteria();
    	criteria.andTitleLike("%"+string+"%");
    	criteria2.andRequirementLike("%" + string + "%");
    	projectExample.or(criteria2);
    	
    	List<Project> projects = projectMapper.selectByExample(projectExample);
		return transfer(projects);
	}

}