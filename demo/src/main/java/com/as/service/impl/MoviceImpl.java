package com.as.service.impl;

import com.as.dao.MovieDao;
import com.as.domain.Movie;
import com.as.service.MovieService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MoviceImpl extends ServiceImpl<MovieDao, Movie> implements MovieService {
    @Autowired
    private MovieDao movieDao;

    @Override
    public IPage<Movie> getPage(int currentPage, int pageSize) {
        IPage<Movie> page = new Page(currentPage,pageSize);
        movieDao.selectPage(page,null);
        return page;
    }

    @Override
    public IPage<Movie> getPage(int currentPage, int pageSize, Movie movie) {
        LambdaQueryWrapper<Movie> lqw = new LambdaQueryWrapper();
        lqw.like(Strings.isNotEmpty(movie.getName()),Movie::getName,movie.getName());
        IPage<Movie> page = new Page(currentPage,pageSize);
        movieDao.selectPage(page,lqw);
        return page;
    }

    @Override
    public List<Movie> orderInUp(String queryColumnName, int Val, String ColumnName) {
        QueryWrapper<Movie> qw = new QueryWrapper<>();
        qw.le(queryColumnName,10);
        qw.orderByAsc(ColumnName);
        List<Movie> movies = movieDao.selectList(qw);
        return movies;
    }

    @Override
    public List<Movie> orderInDown(String queryColumnName, int Val, String ColumnName) {
        return null;
    }
}
