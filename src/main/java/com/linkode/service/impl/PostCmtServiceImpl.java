package com.linkode.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.linkode.dao.PostCmtMapper;
import com.linkode.pojo.Portfolio;
import com.linkode.pojo.PostCmt;
import com.linkode.pojo.PostCmtExample;
import com.linkode.pojo.User;
import com.linkode.pojo.UserExample;
import com.linkode.pojo.ViewModel.PortfolioViewModel;
import com.linkode.pojo.ViewModel.PostCmtViewModel;
import com.linkode.service.PostCmtService;
import com.linkode.service.UserService;
import com.linkode.util.DataPage;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PostCmtServiceImpl implements PostCmtService {

	@Autowired
	private PostCmtMapper postCmtMapper;
	@Autowired
	private UserService userService;

	public int insert(PostCmt postCmt) {
		return postCmtMapper.insert(postCmt);
	}

	public int update(PostCmt postCmt) {
		return postCmtMapper.updateByPrimaryKey(postCmt);
	}

	public int deleteById(int id) {
		PostCmtExample postCmtExample = new PostCmtExample();
		PostCmtExample.Criteria criteria = postCmtExample.createCriteria();
		criteria.andPostCmtIdEqualTo(id);
		postCmtMapper.deleteByExample(postCmtExample);
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

		Integer pageCount = ((Page) postCmts).getPages();
		pageNum = pageNum > pageCount ? pageCount : pageNum;

		DataPage<PostCmt> page = new DataPage<PostCmt>();
		page.setData(postCmts);
		page.setIndexCount(indexCount);
		page.setPageCount(pageCount);
		page.setPageSize(pageSize);
		page.setPageNum(pageNum);

		return page;
	}

	@Override
	public List<PostCmt> getByPostid(int id) {
		PostCmtExample postCmtExample = new PostCmtExample();
		PostCmtExample.Criteria criteria = postCmtExample.createCriteria();
		criteria.andPostidEqualTo(id);
		List<PostCmt> postCmts = postCmtMapper.selectByExample(postCmtExample);
		return postCmts;
	}
	@Override
	public List<PostCmtViewModel> getFloorByPostid(int id) {
		PostCmtExample postCmtExample = new PostCmtExample();
		PostCmtExample.Criteria criteria = postCmtExample.createCriteria();
		criteria.andPostidEqualTo(id);
		criteria.andPostCmtIdIsNull();
		List<PostCmt> postCmts = postCmtMapper.selectByExample(postCmtExample);
		return transfer(postCmts);
	}
	
	@Override
	public Map<Integer, List<PostCmtViewModel>> getMapByPostid(int id) {
		Map<Integer, List<PostCmtViewModel>> ret = new HashMap<Integer, List<PostCmtViewModel>>();
		List<PostCmtViewModel> pcvms = getPCVMByPostid(id);
		for (PostCmtViewModel pcvm:pcvms) {
			if (pcvm.getPostCmtId()==null) {
				ret.put(pcvm.getId(), new ArrayList<PostCmtViewModel>());
			}
		}
		for (PostCmtViewModel pcvm:pcvms) {
			if (pcvm.getPostCmtId()!=null && ret.containsKey(pcvm.getPostCmtId())) {
				ret.get(pcvm.getPostCmtId()).add(pcvm);
			}
		}
		return ret;
	}

	@Override
	public List<PostCmtViewModel> transfer(List<PostCmt> pcs) {
		List<PostCmtViewModel> ret = new ArrayList<PostCmtViewModel>();
		for (PostCmt postCmt : pcs) {
			PostCmtViewModel pvm = new PostCmtViewModel(postCmt);
			pvm.setUsername(userService.getById(pvm.getUserId()).getUsername());
			ret.add(pvm);
		}
		return ret;
	}
	
	@Override
	public List<PostCmtViewModel> getPCVMByPostid(int postid) {
		return transfer(getByPostid(postid));
	}
}