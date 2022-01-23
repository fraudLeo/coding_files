package com.as.service;

import com.as.dao.MovieDao;
import com.as.domain.Movie;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface MovieService extends IService<Movie> {

    IPage<Movie> getPage (int currentPage,int pageSize);
    IPage<Movie> getPage (int currentPage,int pageSize,Movie movie);
    List<Movie> orderInUp(String queryColumnName,int Val,String ColumnName);
    List<Movie> orderInDown(String queryColumnName,int Val,String ColumnName);



}
