package com.leo.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.leo.dao.BookDao;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Service;

import com.leo.domain.*;

@SpringBootTest
public class BookServiceRsetCase {

    @Autowired
    private BookService bookService;

    @Test
    void testGetById(){

        System.out.println(bookService.getById(4));

    }

    @Test
    void testSave() {
        Book book = new Book();
        book.setType("测试数据444");
        book.setName("测试数据444");
        book.setDescription("测试数据444");
        bookService.save(book);

    }

    @Test
    void testUpDate() {

        Book book = new Book();
        book.setId(9);
        book.setType("哲学的书");
        bookService.update(book);
    }

    @Test
    void testDelete(){
        bookService.delete(21);
    }
    @Test
    void testGetAll() {
        bookService.getAll();
    }

    @Test
    void testGetPage() {
//        IPage page = new Page(2,5);
        IPage page = bookService.getPage(2,5);
        System.out.println(page.getCurrent());

    }

}
