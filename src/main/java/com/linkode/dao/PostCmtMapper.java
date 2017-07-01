package com.linkode.dao;

import com.linkode.pojo.PostCmt;
import com.linkode.pojo.PostCmtExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PostCmtMapper {
    long countByExample(PostCmtExample example);

    int deleteByExample(PostCmtExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(PostCmt record);

    int insertSelective(PostCmt record);

    List<PostCmt> selectByExampleWithBLOBs(PostCmtExample example);

    List<PostCmt> selectByExample(PostCmtExample example);

    PostCmt selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") PostCmt record, @Param("example") PostCmtExample example);

    int updateByExampleWithBLOBs(@Param("record") PostCmt record, @Param("example") PostCmtExample example);

    int updateByExample(@Param("record") PostCmt record, @Param("example") PostCmtExample example);

    int updateByPrimaryKeySelective(PostCmt record);

    int updateByPrimaryKeyWithBLOBs(PostCmt record);

    int updateByPrimaryKey(PostCmt record);
}