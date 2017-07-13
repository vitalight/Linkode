package com.linkode.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.Page;
import com.linkode.dao.PostMapper;
import com.linkode.pojo.Post;
import com.linkode.service.PostService;
import com.linkode.util.DataPage;

public class PostServiceImpl implements PostService {
	@Autowired
    private PostMapper postMapper;
	
	public int insert(Post post) {
		postMapper.insert(post);
		return post.getId();
	}
	
	public int update(Post post) {
		return postMapper.updateByPrimaryKey(post);
	}
	
	public int deleteById(int id) {
		return postMapper.deleteByPrimaryKey(id);
	}
	
	public Post getById(int id) {
		return postMapper.selectByPrimaryKey(id);
	}
	
	public List<Post> getAll() {
		return postMapper.selectByExample(null);
	}
	
	public DataPage<Post> selectPage(Integer pageNum, Integer pageSize, Integer indexCount) {

        List<Post> posts = postMapper.selectByExample(null);

        Integer pageCount = ((Page)posts).getPages();
        pageNum = pageNum > pageCount ? pageCount : pageNum;

        DataPage<Post> page = new DataPage<Post>();
        page.setData(posts);
        page.setIndexCount(indexCount);
        page.setPageCount(pageCount);
        page.setPageSize(pageSize);
        page.setPageNum(pageNum);
		return page;
	}
}
