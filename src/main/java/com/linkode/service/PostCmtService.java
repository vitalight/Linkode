package com.linkode.service;

import java.util.List;
import java.util.Map;

import com.linkode.pojo.PostCmt;
import com.linkode.pojo.ViewModel.PostCmtViewModel;
import com.linkode.util.DataPage;

public interface PostCmtService {
	int insert(PostCmt postCmt);
	int update(PostCmt postCmt);
	int deleteById(int id);
	List<PostCmt> getByPostid(int id);
	PostCmt getById(int id);
	List<PostCmtViewModel> transfer(List<PostCmt> pcs);
	List<PostCmt> getAll();
	List<PostCmtViewModel> getPCVMByPostid(int postid);
	List<PostCmtViewModel> getFloorByPostid(int postid);
	Map<Integer, List<PostCmtViewModel>> getMapByPostid(int id);
	DataPage<PostCmt> selectPage(Integer pageNum, Integer pageSize, Integer indexCount);
}
