package com.linkode.service;

import java.util.List;

import com.linkode.pojo.Ad;
import com.linkode.util.DataPage;

public interface AdService {
	int insert(Ad ad);
	int update(Ad ad);
	int deleteById(int id);
	
	Ad getById(int id);
	List<Ad> getAll();
	List<Ad> getRandom();
	DataPage<Ad> selectPage(Integer pageNum, Integer pageSize, Integer indexCount);
}
