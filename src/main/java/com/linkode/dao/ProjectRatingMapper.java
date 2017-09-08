package com.linkode.dao;

import com.linkode.pojo.ProjectRating;
import com.linkode.pojo.ProjectRatingExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProjectRatingMapper {
    long countByExample(ProjectRatingExample example);

    int deleteByExample(ProjectRatingExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ProjectRating record);

    int insertSelective(ProjectRating record);

    List<ProjectRating> selectByExample(ProjectRatingExample example);

    ProjectRating selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ProjectRating record, @Param("example") ProjectRatingExample example);

    int updateByExample(@Param("record") ProjectRating record, @Param("example") ProjectRatingExample example);

    int updateByPrimaryKeySelective(ProjectRating record);

    int updateByPrimaryKey(ProjectRating record);
}