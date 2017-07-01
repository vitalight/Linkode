package com.linkode.dao;

import com.linkode.pojo.PortfolioCmt;
import com.linkode.pojo.PortfolioCmtExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PortfolioCmtMapper {
    long countByExample(PortfolioCmtExample example);

    int deleteByExample(PortfolioCmtExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(PortfolioCmt record);

    int insertSelective(PortfolioCmt record);

    List<PortfolioCmt> selectByExample(PortfolioCmtExample example);

    PortfolioCmt selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") PortfolioCmt record, @Param("example") PortfolioCmtExample example);

    int updateByExample(@Param("record") PortfolioCmt record, @Param("example") PortfolioCmtExample example);

    int updateByPrimaryKeySelective(PortfolioCmt record);

    int updateByPrimaryKey(PortfolioCmt record);
}