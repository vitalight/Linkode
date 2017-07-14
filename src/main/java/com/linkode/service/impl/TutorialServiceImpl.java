package com.linkode.service.impl;

import com.linkode.pojo.ViewModel.ProjectViewModel;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.linkode.dao.TutorialMapper;
import com.linkode.exception.CustomException;
import com.linkode.pojo.Tutorial;
import com.linkode.pojo.TutorialExample.Criteria;
import com.linkode.service.TutorialService;
import com.linkode.service.UserService;
import com.linkode.util.DataPage;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class TutorialServiceImpl implements TutorialService {
	
	@Autowired
	private TutorialMapper tutorialMapper;
	
	@Override
	public Tutorial findByPrimaryKey(Integer id) throws CustomException {
		Tutorial tutorial = tutorialMapper.selectByPrimaryKey(id);
		if (tutorial == null) {
			throw new CustomException("记录不存在！");
		}
		return tutorial;
	}
	
	@Override
	public int insert(Tutorial tutorial) {
		tutorialMapper.insert(tutorial);
		return tutorial.getId();
	}
	
	@Override
	public void updateByPrimaryKey(Tutorial tutorial) {
		tutorialMapper.updateByPrimaryKeySelective(tutorial);
	}
	
	@Override
	public void deleteByPrimaryKey(Integer id) {
		tutorialMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	public List<Tutorial> selectAllTutorial() {
		List<Tutorial> tutorials = tutorialMapper.selectByExampleWithBLOBs(null);
		return tutorials;
	}
	
	@Override
	public void swapTutorial(Integer id1, Integer id2) {
		if (id1 == id2) {
			return;
		}
		Tutorial tut1 = tutorialMapper.selectByPrimaryKey(id1), tut2 = tutorialMapper.selectByPrimaryKey(id2);
		String content1 = tut1.getContent(), content2 = tut2.getContent();
		String type1 = tut1.getType(), type2 = tut2.getType();
		tut1.setContent(content2);
		tut2.setContent(content1);
		tut1.setType(type2);
		tut2.setType(type1);
		tutorialMapper.updateByPrimaryKeyWithBLOBs(tut1);
		tutorialMapper.updateByPrimaryKeyWithBLOBs(tut2);
	}
}