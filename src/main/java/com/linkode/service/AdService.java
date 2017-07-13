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
	DataPage<Ad> selectPage(Integer pageNum, Integer pageSize, Integer indexCount);
}
