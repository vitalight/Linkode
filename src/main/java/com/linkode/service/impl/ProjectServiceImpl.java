package com.linkode.service.impl;

import com.linkode.pojo.ViewModel.ProjectViewModel;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.linkode.dao.ProjectMapper;
import com.linkode.exception.CustomException;
import com.linkode.pojo.Project;
import com.linkode.service.ProjectService;
import com.linkode.service.UserService;
import com.linkode.util.DataPage;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectMapper projectMapper;
    @Autowired
    private UserService userService;

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
        projectMapper.insert(project);
        return project.getId();
    }

    @Override
    public void deleteByPrimaryKey(Integer id) {
        projectMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateByPrimaryKey(Project project) {
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
        List<ProjectViewModel> pvms = new ArrayList<ProjectViewModel>();

        // 初始化
        for (int i = 0; i < projects.size(); i++) {
            Project project = projects.get(i);
            ProjectViewModel pvm = new ProjectViewModel();
            pvm.setId(project.getId());
            pvm.setPosterId(project.getPosterId());
            pvm.setTitle(project.getTitle());
            pvm.setRequirement(project.getRequirement());
            pvm.setMoney(project.getMoney());
            pvm.setStatus(project.getStatus());
            pvm.setUsername(userService.findById(project.getPosterId()).getUsername());
            pvm.setStartDate(project.getStartDate());
            pvm.setEndDate(project.getEndDate());
            pvm.setType(project.getType());
            pvms.add(pvm);
        }

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
}