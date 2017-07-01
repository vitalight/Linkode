package com.linkode.dao;

import com.linkode.pojo.Portfolio;
import com.linkode.pojo.PortfolioExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PortfolioMapper {
    long countByExample(PortfolioExample example);

    int deleteByExample(PortfolioExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Portfolio record);

    int insertSelective(Portfolio record);

    List<Portfolio> selectByExample(PortfolioExample example);

    Portfolio selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Portfolio record, @Param("example") PortfolioExample example);

    int updateByExample(@Param("record") Portfolio record, @Param("example") PortfolioExample example);

    int updateByPrimaryKeySelective(Portfolio record);

    int updateByPrimaryKey(Portfolio record);
}