package com.linkode.service;
import com.linkode.pojo.PortfolioCmt;
import com.linkode.pojo.ViewModel.PortfolioCmtViewModel;

import java.util.List;
import com.linkode.util.DataPage;


public interface PortfolioCmtService {
    void insert(PortfolioCmt cmt);
    void deleteByPrimaryKey(Integer id);
    List<PortfolioCmt> findByPortfolioId(Integer id);
    DataPage<PortfolioCmtViewModel> selectPCVMPageById(Integer pagenum, Integer pageSize, Integer indexCount,Integer id);
    List<PortfolioCmtViewModel> getAllPCVMById(Integer id);
}