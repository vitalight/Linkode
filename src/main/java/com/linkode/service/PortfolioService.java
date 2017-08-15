package com.linkode.service;

import com.linkode.pojo.Portfolio;
import com.linkode.pojo.ViewModel.PortfolioViewModel;

import java.util.List;

import com.linkode.exception.CustomException;
import com.linkode.util.DataPage;


public interface PortfolioService {
    void insert(Portfolio portfolio);
    void deleteByPrimaryKey(Integer id);
    void updateByPrimaryKey(Portfolio portfolio);
    
    DataPage<Portfolio> selectPageById(Integer pagenum, Integer pageSize, Integer indexCount,Integer id);
    DataPage<PortfolioViewModel> selectPVMPage(Integer pageNum, Integer pageSize, Integer indexCount,String type);
    Portfolio findByPrimaryKey(Integer id);
    
    List<PortfolioViewModel> getAllPVM(String type);
    List<PortfolioViewModel> getByUserId(Integer userid);
	PortfolioViewModel getPVMByPrimaryKey(Integer id);
}