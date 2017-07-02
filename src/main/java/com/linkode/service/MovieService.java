package com.linkode.service;

import com.linkode.exception.CustomException;
import com.linkode.pojo.Movie;
import com.linkode.util.DataPage;

public interface MovieService {
    DataPage<Movie> selectPage(Integer pageNum, Integer pageSize, Integer indexCount);
    Movie findByPrimaryKey(Integer id) throws CustomException;
    void insert(Movie movie);
    void deleteByPrimaryKey(Integer id);
    void updateByPrimaryKey(Integer id, Movie movie);
}