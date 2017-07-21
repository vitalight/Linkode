package com.linkode.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.linkode.dao.PostMapper;
import com.linkode.pojo.Portfolio;
import com.linkode.pojo.Post;
import com.linkode.pojo.PostCmt;
import com.linkode.pojo.PostCmtExample;
import com.linkode.pojo.PostExample;
import com.linkode.pojo.ViewModel.PortfolioViewModel;
import com.linkode.pojo.ViewModel.PostViewModel;
import com.linkode.service.PostCmtService;
import com.linkode.service.PostService;
import com.linkode.service.UserService;
import com.linkode.util.DataPage;

public class PostServiceImpl implements PostService {
	@Autowired
	private PostMapper postMapper;
	@Autowired
	private UserService userService;
	@Autowired
	private PostCmtService postCmtService;

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

	public PostViewModel getPVMById(int id) {
		PostViewModel pvm = new PostViewModel(getById(id));
		pvm.setUsername(userService.getById(pvm.getUserId()).getUsername());
		return pvm;
	}

	public List<Post> getAll() {
		return postMapper.selectByExample(null);
	}

	public List<PostViewModel> getAllPVM() {
		List<PostViewModel> ret = new ArrayList<PostViewModel>();
		for (Post post : getAll()) {
			PostViewModel pvm = new PostViewModel(post);
			pvm.setUsername(userService.findById(post.getUserId()).getUsername());
			ret.add(pvm);
		}
		return ret;
	}

	public DataPage<Post> selectPage(Integer pageNum, Integer pageSize, Integer indexCount) {

		List<Post> posts = postMapper.selectByExample(null);

		Integer pageCount = ((Page) posts).getPages();
		pageNum = pageNum > pageCount ? pageCount : pageNum;

		DataPage<Post> page = new DataPage<Post>();
		page.setData(posts);
		page.setIndexCount(indexCount);
		page.setPageCount(pageCount);
		page.setPageSize(pageSize);
		page.setPageNum(pageNum);
		return page;
	}

	@Override
	public DataPage<PostViewModel> selectPVMPage(Integer pageNum, Integer pageSize, Integer indexCount, String type) {
		PageHelper.startPage(pageNum, pageSize);
		List<Post> posts = postMapper.selectByExample(null);
		List<PostViewModel> pvms = new ArrayList<PostViewModel>();
		// 初始化

		for (int i = 0; i < posts.size(); i++) {
			Post post = posts.get(i);
			if ((type.equals(post.getType())) || (type.equals("null"))) {
				PostViewModel pvm = new PostViewModel(post);
				pvm.setUsername(userService.findById(post.getUserId()).getUsername());
				List<PostCmt> postCmts = postCmtService.getByPostid(post.getId());
				if (postCmts == null)
					pvm.setCmtNum(0);
				else
					pvm.setCmtNum(postCmts.size());
				pvms.add(pvm);
			}
		}

		Integer pageCount = ((Page) posts).getPages();
		pageNum = pageNum > pageCount ? pageCount : pageNum;

		DataPage<PostViewModel> page = new DataPage<PostViewModel>();
		page.setData(pvms);
		page.setIndexCount(indexCount);
		page.setPageCount(pageCount);
		page.setPageSize(pageSize);
		page.setPageNum(pageNum);

		return page;
	}
	
	public List<PostViewModel> transfer(List<Post> posts) {
		List<PostViewModel> pvms = new ArrayList<PostViewModel>();
		for (Post post:posts) {
			PostViewModel pvm = new PostViewModel(post);
			pvm.setUsername(userService.getById(pvm.getUserId()).getUsername());
			pvms.add(pvm);
		}
		return pvms;
	}
	

	@Override
	public List<PostViewModel> getPVMByPosterid(int id) {
		PostExample postExample = new PostExample();
		PostExample.Criteria criteria = postExample.createCriteria();
		criteria.andUserIdEqualTo(id);
		List<Post> posts = postMapper.selectByExample(postExample);
		return transfer(posts);
	}

	@Override
	public List<PostViewModel> getPVMByCommentUserid(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
