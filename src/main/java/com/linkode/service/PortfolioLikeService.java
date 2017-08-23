package com.linkode.service;

import com.linkode.pojo.PortfolioLike;

public interface PortfolioLikeService {
	int insert(PortfolioLike portfolioLike);
	int update(PortfolioLike portfolioLike);
	int delete(int id);
	
	PortfolioLike getById(int id);
	boolean getByUidPid(int userId, int portfolioId);
	int deleteByUidPid(int userId, int portfolioId);
}
