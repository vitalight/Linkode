package com.linkode.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.linkode.dao.PortfolioLikeMapper;
import com.linkode.pojo.PortfolioLike;
import com.linkode.pojo.PortfolioLikeExample;
import com.linkode.service.PortfolioLikeService;

public class PortfolioLikeServiceImpl implements PortfolioLikeService{

	@Autowired
	private PortfolioLikeMapper portfolioLikeMapper;
	
	@Override
	public int insert(PortfolioLike portfolioLike) {
		portfolioLikeMapper.insert(portfolioLike);
		return portfolioLike.getId();
	}

	@Override
	public int update(PortfolioLike portfolioLike) {
		return portfolioLikeMapper.updateByPrimaryKey(portfolioLike);
	}

	@Override
	public int delete(int id) {
		return portfolioLikeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public PortfolioLike getById(int id) {
		return portfolioLikeMapper.selectByPrimaryKey(id);
	}

	@Override
	public boolean getByUidPid(int userId, int portfolioId) {
		PortfolioLikeExample portfolioLikeExample = new PortfolioLikeExample();
		PortfolioLikeExample.Criteria criteria = portfolioLikeExample.createCriteria();
		criteria.andUserIdEqualTo(userId);
		criteria.andPortfolioIdEqualTo(portfolioId);
		List<PortfolioLike> portfolioLikes = portfolioLikeMapper.selectByExample(portfolioLikeExample);
		if (portfolioLikes.size()==0) {
			return false;
		}
		return true;
	}

	@Override
	public int deleteByUidPid(int userId, int portfolioId) {
		PortfolioLikeExample portfolioLikeExample = new PortfolioLikeExample();
		PortfolioLikeExample.Criteria criteria = portfolioLikeExample.createCriteria();
		criteria.andUserIdEqualTo(userId);
		criteria.andPortfolioIdEqualTo(portfolioId);
		return portfolioLikeMapper.deleteByExample(portfolioLikeExample);
	}
	

}
