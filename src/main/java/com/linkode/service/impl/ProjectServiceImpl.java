package com.linkode.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.linkode.dao.ProjectMapper;
import com.linkode.exception.CustomException;
import com.linkode.pojo.Project;
import com.linkode.service.ProjectService;
import com.linkode.util.DataPage;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectMapper projectMapper;

    @Override
    public Project findByPrimaryKey(Integer id) throws CustomException {

        Project project = projectMapper.selectByPrimaryKey(id);
        if(project == null) {
            throw new CustomException("记录不存在！");
        }
        return project;
    }

    @Override
    public void insert(Project project) {
        projectMapper.insert(project);
    }

    @Override
    public void deleteByPrimaryKey(Integer id) {
        projectMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateByPrimaryKey(Integer id, Project project) {
        project.setId(id);
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
}