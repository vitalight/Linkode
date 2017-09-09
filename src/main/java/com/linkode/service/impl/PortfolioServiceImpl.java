package com.linkode.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.linkode.dao.PortfolioMapper;
import com.linkode.exception.CustomException;
import com.linkode.pojo.Portfolio;
import com.linkode.pojo.PortfolioExample;
import com.linkode.service.UserService;
import com.linkode.service.PortfolioService;
import com.linkode.pojo.ViewModel.PortfolioViewModel;
import com.linkode.util.DataPage;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class PortfolioServiceImpl implements PortfolioService {

    @Autowired
    private PortfolioMapper portfolioMapper;
    @Autowired
    private UserService userService;
    @Override
    public Portfolio findByPrimaryKey(Integer id) {

        return portfolioMapper.selectByPrimaryKey(id);
        
    }

    @Override
    public void insert(Portfolio Portfolio) {
        portfolioMapper.insert(Portfolio);
    }

    @Override
    public void deleteByPrimaryKey(Integer id) {
        portfolioMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateByPrimaryKey(Portfolio Portfolio) {
        portfolioMapper.updateByPrimaryKey(Portfolio);
    }

    @Override
    public DataPage<Portfolio> selectPageById(Integer pageNum, Integer pageSize, Integer indexCount,Integer id) {
        PageHelper.startPage(pageNum, pageSize);
        List<Portfolio> Portfolios = portfolioMapper.selectByExample(null);
        List<Portfolio> pvms = new ArrayList<Portfolio>();
        // 初始化
       
       for (int i = 0; i < Portfolios.size(); i++) {
            Portfolio Portfolio = Portfolios.get(i);
        	if(Portfolio.getUserId().equals(id)){
	            Portfolio portfolio = new Portfolio();
	            portfolio.setId(Portfolio.getId());
	            portfolio.setUserId(Portfolio.getUserId());
	            portfolio.setTitle(Portfolio.getTitle());
	            portfolio.setContent(Portfolio.getContent());
	            portfolio.setType(Portfolio.getType());
	            portfolio.setLikes(Portfolio.getLikes());
	            pvms.add(portfolio);
        	}
         }
        Integer pageCount = ((Page)Portfolios).getPages();
        pageNum = pageNum > pageCount ? pageCount : pageNum;

        DataPage<Portfolio> page = new DataPage<Portfolio>();
        page.setData(pvms);
        page.setIndexCount(indexCount);
        page.setPageCount(pageCount);
        page.setPageSize(pageSize);
        page.setPageNum(pageNum);

        return page;
    }
    
    @Override
    public DataPage<PortfolioViewModel> selectPVMPage(Integer pageNum, Integer pageSize, Integer indexCount,String type) {
        PageHelper.startPage(pageNum, pageSize);
        List<Portfolio> Portfolios = portfolioMapper.selectByExample(null);
        List<PortfolioViewModel> pvms = new ArrayList<PortfolioViewModel>();
        // 初始化
       
       for (int i = 0; i < Portfolios.size(); i++) {
            Portfolio portfolio = Portfolios.get(i);
        	if((type.equals(portfolio.getType()))||(type.equals("null"))){
	            PortfolioViewModel pvm = new PortfolioViewModel(portfolio);
	            pvm.setUsername(userService.findById(portfolio.getUserId()).getUsername());
	            pvms.add(pvm);
        	}
         }
        
        Integer pageCount = ((Page)Portfolios).getPages();
        pageNum = pageNum > pageCount ? pageCount : pageNum;

        DataPage<PortfolioViewModel> page = new DataPage<PortfolioViewModel>();
        page.setData(pvms);
        page.setIndexCount(indexCount);
        page.setPageCount(pageCount);
        page.setPageSize(pageSize);
        page.setPageNum(pageNum);

        return page;
    }
    
    public List<PortfolioViewModel> getAllPVM(String type) {
    	PortfolioExample pe = new PortfolioExample();
    	PortfolioExample.Criteria criteria = pe.createCriteria();
    	if (type!=null) {
    		criteria.andTypeEqualTo(type);
    	}
    	pe.setOrderByClause("id desc");
    	
    	List<Portfolio> portfolios = portfolioMapper.selectByExample(pe);
    	return transform(portfolios);
    }
    
    public List<PortfolioViewModel> getByUserId(Integer userid) {
    	PortfolioExample pe = new PortfolioExample();
    	PortfolioExample.Criteria criteria = pe.createCriteria();
    	criteria.andUserIdEqualTo(userid);
    	List<Portfolio> portfolios = portfolioMapper.selectByExample(pe);
    	return transform(portfolios);
    }

	@Override
	public PortfolioViewModel getPVMByPrimaryKey(Integer id) {
		PortfolioViewModel pvm = new PortfolioViewModel(findByPrimaryKey(id));
		pvm.setUsername(userService.getById(pvm.getUserId()).getUsername());
		return pvm;
	}

	@Override
	public List<PortfolioViewModel> search(String string) {
    	PortfolioExample pe = new PortfolioExample();
    	PortfolioExample.Criteria criteria = pe.createCriteria(), criteria2 = pe.createCriteria();
    	criteria.andTitleLike("%"+string+"%");
    	criteria2.andContentLike("%" + string + "%");
    	pe.or(criteria2);
    	
    	List<Portfolio> portfolios = portfolioMapper.selectByExample(pe);
		return transform(portfolios);
	}

	@Override
	public List<PortfolioViewModel> transform(List<Portfolio> portfolios) {
		List<PortfolioViewModel> ret = new ArrayList<PortfolioViewModel>();
    	for (Portfolio portfolio:portfolios) {
    		if (portfolio.getStatus()!=null && portfolio.getStatus()==0) {
    			continue;
    		}
			PortfolioViewModel pvm = new PortfolioViewModel(portfolio);
			pvm.setUsername(userService.getById(pvm.getUserId()).getUsername());
			ret.add(pvm);
    	}
    	return ret;
	}
  

	@Override
	public void ban(int id) {
		Portfolio portfolio = findByPrimaryKey(id);
		if (portfolio!=null) {
			portfolio.setStatus(0);
			updateByPrimaryKey(portfolio);
		}
	}
}