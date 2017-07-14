package com.linkode.dao;

import com.linkode.pojo.ProjectCommit;
import com.linkode.pojo.ProjectCommitExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProjectCommitMapper {
    long countByExample(ProjectCommitExample example);

    int deleteByExample(ProjectCommitExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ProjectCommit record);

    int insertSelective(ProjectCommit record);

    List<ProjectCommit> selectByExample(ProjectCommitExample example);

    ProjectCommit selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ProjectCommit record, @Param("example") ProjectCommitExample example);

    int updateByExample(@Param("record") ProjectCommit record, @Param("example") ProjectCommitExample example);

    int updateByPrimaryKeySelective(ProjectCommit record);

    int updateByPrimaryKey(ProjectCommit record);
}