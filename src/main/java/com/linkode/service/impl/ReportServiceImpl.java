package com.linkode.service.impl;

import com.linkode.dao.ReportMapper;
import com.linkode.pojo.Report;
import com.linkode.pojo.ReportExample;
import com.linkode.service.ChatLogService;
import com.linkode.service.PortfolioService;
import com.linkode.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ReportServiceImpl implements ReportService {

    @Autowired
    private ReportMapper reportMapper;
    @Autowired
    private ChatLogService chatLogService;
    @Autowired
    private PortfolioService portfolioService;
    
    @Override
    public Report getById(Integer id) {
        return reportMapper.selectByPrimaryKey(id);
    }

    @Override
    public String toString(Report report) {
    	return "作品id：<a target='_blank' href='../../portfolio/"+report.getPortfolioId() + "'>" + report.getPortfolioId()+"</a>;<br/>"
				+ "举报类型：" + report.getType()+";<br/>"
				+ "举报理由：" + report.getContent();
    }
    
    @Override
    public void insert(Report report) {
        reportMapper.insert(report);
        chatLogService.systemMessage(report.getUserId(),"您的举报正在审核中，请稍候。<br/>"+toString(report));
    }

    @Override
    public void delete(Integer id) {
        reportMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Report report) {
        reportMapper.updateByPrimaryKey(report);
    }
    
    @Override
    public List<Report> getAll() {
    	return reportMapper.selectByExample(null);
    }
    
    @Override
    public List<Report> getNew() {
    	ReportExample reportExample = new ReportExample();
    	ReportExample.Criteria criteria = reportExample.createCriteria();
    	criteria.andResultIsNull();
    	List<Report> reports = reportMapper.selectByExample(reportExample);
    	return reports;
    }
    
    @Override
    public void pass(int id) {
    	Report report = getById(id);
    	portfolioService.ban(report.getPortfolioId());
    	
    	List<Report> reports = getByPortfolioId(report.getPortfolioId());
    	Set<Integer> set = new HashSet<Integer>();
    	for (Report r:reports) {
    		if (r.getResult()==null) {
    			r.setResult("pass");
    			reportMapper.updateByPrimaryKey(r);
    			if (!set.contains(r.getUserId())) {
	    			chatLogService.systemMessage(r.getUserId(),"您的举报通过了审核，被举报作品已被删除，感谢您的支持。<br/>"+toString(report));
	    			set.add(r.getUserId());
    			}
    		}
    	}
    }
    
    @Override
    public void fail(int id) {
    	Report report = getById(id);
    	report.setResult("fail");
    	reportMapper.updateByPrimaryKey(report);

    	List<Report> reports = getByPortfolioId(report.getPortfolioId());
    	Set<Integer> set = new HashSet<Integer>();
    	for (Report r:reports) {
    		if (!set.contains(r.getUserId())){
		        chatLogService.systemMessage(r.getUserId(),"您的举报未通过审核。<br/>"+toString(report));
		        set.add(r.getUserId());
    		}
    	}
    }
    
    public List<Report> getByPortfolioId(int id) {
    	ReportExample reportExample = new ReportExample();
    	ReportExample.Criteria criteria = reportExample.createCriteria();
    	criteria.andPortfolioIdEqualTo(id);
    	return reportMapper.selectByExample(reportExample);
    }

	
    public List<Report> getByUserId(int id) {
    	ReportExample reportExample = new ReportExample();
    	ReportExample.Criteria criteria = reportExample.createCriteria();
    	criteria.andUserIdEqualTo(id);
    	return reportMapper.selectByExample(reportExample);
    }
   
}