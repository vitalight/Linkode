package com.linkode.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.linkode.dao.PortfolioCmtMapper;
import com.linkode.pojo.PortfolioCmt;
import com.linkode.pojo.PortfolioCmtExample;
import com.linkode.service.UserService;
import com.linkode.service.PortfolioCmtService;
import com.linkode.pojo.ViewModel.PortfolioCmtViewModel;
import com.linkode.util.DataPage;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class PortfolioCmtServiceImpl implements PortfolioCmtService {

    @Autowired
    private PortfolioCmtMapper PortfolioCmtMapper;
    @Autowired
    private UserService userService;

    @Override
    public void insert(PortfolioCmt PortfolioCmt) {
        PortfolioCmtMapper.insert(PortfolioCmt);
    }

    @Override
    public void deleteByPrimaryKey(Integer id) {
        PortfolioCmtMapper.deleteByPrimaryKey(id);
    }

    public List<PortfolioCmt> findByPortfolioId(Integer id){
    	 PortfolioCmtExample portfolioCmtExample = new PortfolioCmtExample();
         PortfolioCmtExample.Criteria criteria = portfolioCmtExample.createCriteria();
         criteria.andPortfolioIdEqualTo(id);
         List<PortfolioCmt> portfolioCmts = PortfolioCmtMapper.selectByExample(portfolioCmtExample);
         return portfolioCmts;
    }

    @Override
    public DataPage<PortfolioCmtViewModel> selectPCVMPageById(Integer pageNum, Integer pageSize, Integer indexCount,Integer id) {
        PageHelper.startPage(pageNum, pageSize);
        List<PortfolioCmt> PortfolioCmts = findByPortfolioId(id);
        List<PortfolioCmtViewModel> pcvms = new ArrayList<PortfolioCmtViewModel>();
        // 初始化
       
       for (int i = 0; i < PortfolioCmts.size(); i++) {
            PortfolioCmt portfolioCmt = PortfolioCmts.get(i);
        	if(portfolioCmt.getPortfolioId().equals(id)){
	            PortfolioCmtViewModel pcvm = new PortfolioCmtViewModel(portfolioCmt);
	            pcvm.setUsername(userService.findById(pcvm.getUserId()).getUsername());
	            pcvms.add(pcvm);
        	}
         }
        Integer pageCount = ((Page)PortfolioCmts).getPages();
        pageNum = pageNum > pageCount ? pageCount : pageNum;

        DataPage<PortfolioCmtViewModel> page = new DataPage<PortfolioCmtViewModel>();
        page.setData(pcvms);
        page.setIndexCount(indexCount);
        page.setPageCount(pageCount);
        page.setPageSize(pageSize);
        page.setPageNum(pageNum);

        return page;
    }
    
    public List<PortfolioCmtViewModel> getAllPCVMById(Integer id) {
        List<PortfolioCmt> portfolioCmts = findByPortfolioId(id);
        List<PortfolioCmtViewModel> ret = new ArrayList<PortfolioCmtViewModel>();
        for (PortfolioCmt portfolioCmt:portfolioCmts) {
        	PortfolioCmtViewModel pcvm = new PortfolioCmtViewModel(portfolioCmt);
        	pcvm.setUsername(userService.findById(pcvm.getUserId()).getUsername());
        	ret.add(pcvm);
        }
        return ret;
    }
    
  
}