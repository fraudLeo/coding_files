package com.leo.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.leo.domain.*;
import org.springframework.stereotype.Service;

import java.util.List;

public interface BookService {
    /**
     *这里的方法名可以自定义
     */
    Boolean save(Book book);
    Boolean update(Book book);
    Boolean delete(Integer id);
    Book getById(Integer id);
    List<Book> getAll();
    IPage getPage(int currentPage,int pageSize);


}
