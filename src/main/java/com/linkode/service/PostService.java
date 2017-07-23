package com.linkode.service;

import java.util.List;
import com.linkode.pojo.Post;
import com.linkode.pojo.ViewModel.PostViewModel;
import com.linkode.util.DataPage;

public interface PostService {
	int insert(Post post);
	int update(Post post);
	int deleteById(int id);
	Post getById(int id);
	PostViewModel getPVMById(int id);
	List<Post> getAll();
	List<PostViewModel> getAllPVM();
	
	List<PostViewModel> transfer(List<Post> posts);
	List<PostViewModel> getPVMByPosterid(int id);
	List<PostViewModel> getPVMByCommentUserid(int id);
	DataPage<Post> selectPage(Integer pageNum, Integer pageSize, Integer indexCount);
	DataPage<PostViewModel> selectPVMPage(Integer pageNum, Integer pageSize, Integer indexCount,String type);
}
