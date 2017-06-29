package com.linkode.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.linkode.dao.MovieMapper;
import com.linkode.exception.CustomException;
import com.linkode.pojo.Movie;
import com.linkode.service.MovieService;
import com.linkode.util.DataPage;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class MovieServiceImpl implements MovieService {

    @Autowired
    private MovieMapper movieMapper;

    @Override
    public Movie findByPrimaryKey(Integer id) throws CustomException {

        Movie movie = movieMapper.selectByPrimaryKey(id);
        if(movie==null){
            throw new CustomException("记录不存在！");
        }
        return movie;
    }

    @Override
    public void insert(Movie movie) {
        movieMapper.insert(movie);
    }

    @Override
    public void deleteByPrimaryKey(Integer id) {
        movieMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateByPrimaryKey(Integer id, Movie movie) {
        movie.setId(id);
        movieMapper.updateByPrimaryKey(movie);
    }

    @Override
    public DataPage<Movie> selectPage(Integer pageNum, Integer pageSize, Integer indexCount) {
        PageHelper.startPage(pageNum,pageSize);
        List<Movie> movies = movieMapper.selectByExample(null);

        Integer pageCount = ((Page) movies).getPages();
        pageNum = pageNum > pageCount ? pageCount : pageNum;

        DataPage<Movie> page = new DataPage<Movie>();
        page.setData(movies);
        page.setIndexCount(indexCount);
        page.setPageCount(pageCount);
        page.setPageSize(pageSize);
        page.setPageNum(pageNum);

        return page;
    }

}
