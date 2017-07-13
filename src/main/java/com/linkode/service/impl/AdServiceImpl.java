package com.linkode.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.Page;
import com.linkode.dao.AdMapper;
import com.linkode.pojo.Ad;
import com.linkode.service.AdService;
import com.linkode.util.DataPage;

public class AdServiceImpl implements AdService {
	@Autowired
    private AdMapper adMapper;
	
	public int insert(Ad ad) {
		adMapper.insert(ad);
		return ad.getId();
	}
	
	public int update(Ad ad) {
		return adMapper.updateByPrimaryKey(ad);
	}
	
	public int deleteById(int id) {
		return adMapper.deleteByPrimaryKey(id);
	}
	
	public Ad getById(int id) {
		return adMapper.selectByPrimaryKey(id);
	}
	
	public List<Ad> getAll() {
		return adMapper.selectByExample(null);
	}
	
	public DataPage<Ad> selectPage(Integer pageNum, Integer pageSize, Integer indexCount) {
        List<Ad> ads = adMapper.selectByExample(null);

        Integer pageCount = ((Page)ads).getPages();
        pageNum = pageNum > pageCount ? pageCount : pageNum;

        DataPage<Ad> page = new DataPage<Ad>();
        page.setData(ads);
        page.setIndexCount(indexCount);
        page.setPageCount(pageCount);
        page.setPageSize(pageSize);
        page.setPageNum(pageNum);
		return page;
	}
}
