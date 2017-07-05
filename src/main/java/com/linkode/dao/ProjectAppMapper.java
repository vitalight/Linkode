package com.linkode.dao;

import com.linkode.pojo.ProjectApp;
import com.linkode.pojo.ProjectAppExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProjectAppMapper {
    long countByExample(ProjectAppExample example);

    int deleteByExample(ProjectAppExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ProjectApp record);

    int insertSelective(ProjectApp record);

    List<ProjectApp> selectByExample(ProjectAppExample example);

    ProjectApp selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ProjectApp record, @Param("example") ProjectAppExample example);

    int updateByExample(@Param("record") ProjectApp record, @Param("example") ProjectAppExample example);

    int updateByPrimaryKeySelective(ProjectApp record);

    int updateByPrimaryKey(ProjectApp record);
}