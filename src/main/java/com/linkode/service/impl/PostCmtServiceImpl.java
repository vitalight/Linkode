package com.linkode.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.linkode.dao.PostCmtMapper;
import com.linkode.pojo.PostCmt;
import com.linkode.service.PostCmtService;
import com.linkode.util.DataPage;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class PostCmtServiceImpl implements PostCmtService {

    @Autowired
    private PostCmtMapper postCmtMapper;
    
    public int insert(PostCmt postCmt) {
    	return postCmtMapper.insert(postCmt);
    }
    
    public int update(PostCmt postCmt) {
    	return postCmtMapper.updateByPrimaryKey(postCmt);
    }
	public int deleteById(int id) {
		return postCmtMapper.deleteByPrimaryKey(id);
	}
	
	public PostCmt getById(int id) {
		return postCmtMapper.selectByPrimaryKey(id);
	}
	public List<PostCmt> getAll() {
		return postCmtMapper.selectByExample(null);
	}

    public DataPage<PostCmt> selectPage(Integer pageNum, Integer pageSize, Integer indexCount) {
        PageHelper.startPage(pageNum, pageSize);
        List<PostCmt> postCmts = postCmtMapper.selectByExample(null);

        Integer pageCount = ((Page)postCmts).getPages();
        pageNum = pageNum > pageCount ? pageCount : pageNum;

        DataPage<PostCmt> page = new DataPage<PostCmt>();
        page.setData(postCmts);
        page.setIndexCount(indexCount);
        page.setPageCount(pageCount);
        page.setPageSize(pageSize);
        page.setPageNum(pageNum);

        return page;
    }
}