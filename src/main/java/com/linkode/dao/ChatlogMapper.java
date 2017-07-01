package com.linkode.dao;

import com.linkode.pojo.Chatlog;
import com.linkode.pojo.ChatlogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ChatlogMapper {
    long countByExample(ChatlogExample example);

    int deleteByExample(ChatlogExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Chatlog record);

    int insertSelective(Chatlog record);

    List<Chatlog> selectByExample(ChatlogExample example);

    Chatlog selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Chatlog record, @Param("example") ChatlogExample example);

    int updateByExample(@Param("record") Chatlog record, @Param("example") ChatlogExample example);

    int updateByPrimaryKeySelective(Chatlog record);

    int updateByPrimaryKey(Chatlog record);
}