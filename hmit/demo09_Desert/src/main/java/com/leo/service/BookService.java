package com.leo.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.leo.domain.Book;

import java.util.List;

public interface BookService {
//    选择boolean是为了表返回是否成功
     Boolean save(Book book);
     Boolean update(Book book);
     Boolean delete(Integer id);//也可以传Book book,方便数据校验
     Book getById(int id);
     List<Book> getAll();
     IPage<Book> getPage(int curentPage, int pageSize);
}


















