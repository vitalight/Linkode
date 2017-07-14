package com.linkode.service;

import com.linkode.pojo.Tutorial;
import java.util.List;
import com.linkode.exception.CustomException;


public interface TutorialService {
	Tutorial findByPrimaryKey(Integer id) throws CustomException;
	int insert(Tutorial tutorial);
	void updateByPrimaryKey(Tutorial tutorial);
	void deleteByPrimaryKey(Integer id);
	List<Tutorial> selectAllTutorial();
	void swapTutorial(Integer id1, Integer id2);
}