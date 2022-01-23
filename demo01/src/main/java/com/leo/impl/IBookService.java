package com.leo.impl;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.leo.domain.Book;

public interface IBookService extends IService<Book> {
    boolean saveBook(Book book);
    boolean modify(Book book);
    boolean delete(Integer id);

    IPage<Book> getPage(int currentPage, int pageSize);
}
