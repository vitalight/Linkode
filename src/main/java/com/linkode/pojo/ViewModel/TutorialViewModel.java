package com.linkode.pojo.ViewModel;

import java.util.List;
import com.linkode.pojo.Tutorial;

public class TutorialViewModel {
	private int size;
	private int lastId;
	private int nextId;
	private Tutorial tutorial;
	private List<Tutorial> tutorials;
	
	public void setSize(Integer size) {
		this.size = size;
	}
	
	public Integer getSize() {
		return size;
	}
	
	public void setLastId(int id) {
		this.lastId = id;
	}
	
	public int getLastId() {
		return lastId;
	}
	
	public void setNextId(int id) {
		this.nextId = id;
	}
	
	public int getNextId() {
		return nextId;
	}
	
	public void setTutorials(List<Tutorial> tutorials) {
		this.tutorials = tutorials;
	}
	
	public List<Tutorial> getTutorials() {
		return tutorials;
	}
	
	public void setTutorial(Tutorial tutorial) {
		this.tutorial = tutorial;
	}
	
	public Tutorial getTutorial() {
		return tutorial;
	}
}