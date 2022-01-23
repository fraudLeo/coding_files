package com.leo.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.leo.dao.BookDao;
import com.leo.domain.Book;
import com.leo.service.IBookService;
import org.springframework.stereotype.Service;

@Service
public class BookServiceImpl2 extends ServiceImpl<BookDao, Book> implements IBookService {

}
