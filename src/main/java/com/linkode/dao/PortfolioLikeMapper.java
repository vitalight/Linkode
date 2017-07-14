package com.linkode.dao;

import com.linkode.pojo.PortfolioLike;
import com.linkode.pojo.PortfolioLikeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PortfolioLikeMapper {
    long countByExample(PortfolioLikeExample example);

    int deleteByExample(PortfolioLikeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(PortfolioLike record);

    int insertSelective(PortfolioLike record);

    List<PortfolioLike> selectByExample(PortfolioLikeExample example);

    PortfolioLike selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") PortfolioLike record, @Param("example") PortfolioLikeExample example);

    int updateByExample(@Param("record") PortfolioLike record, @Param("example") PortfolioLikeExample example);

    int updateByPrimaryKeySelective(PortfolioLike record);

    int updateByPrimaryKey(PortfolioLike record);
}