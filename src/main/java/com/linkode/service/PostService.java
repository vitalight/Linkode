package com.linkode.service;

import java.util.List;

import com.linkode.pojo.Post;
import com.linkode.util.DataPage;

public interface PostService {
	int insert(Post post);
	int update(Post post);
	int deleteById(int id);
	
	Post getById(int id);
	List<Post> getAll();
	DataPage<Post> selectPage(Integer pageNum, Integer pageSize, Integer indexCount);
}
