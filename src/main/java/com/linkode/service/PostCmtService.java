package com.linkode.service;

import java.util.List;

import com.linkode.pojo.PostCmt;
import com.linkode.util.DataPage;

public interface PostCmtService {
	int insert(PostCmt postCmt);
	int update(PostCmt postCmt);
	int deleteById(int id);
	
	PostCmt getById(int id);
	List<PostCmt> getAll();
	DataPage<PostCmt> selectPage(Integer pageNum, Integer pageSize, Integer indexCount);
}
