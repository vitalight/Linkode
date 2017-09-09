package com.linkode.service;

import com.linkode.pojo.Report;
import java.util.List;


public interface ReportService {
	void insert(Report report);
	void delete(Integer id);
	void update(Report report);

	Report getById(Integer id);
	List<Report> getAll();
	List<Report> getNew();
	
	void pass(int id);
	void fail(int id);
	
	List<Report> getByUserId(int id);
	List<Report> getByPortfolioId(int id);
	String toString(Report report);
	
	/*
	void changeResult(Report report,String result);
	List<Report> decide(String Status,Integer id,Integer id1);
	*/
}