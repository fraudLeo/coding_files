package com.leo.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.leo.domain.Book;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class BookServiceRsetCase2 {

    @Autowired
    private IBookService bookService;

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
        bookService.updateById(book);
    }

    @Test
    void testDelete(){
        bookService.removeById(22);
    }
    @Test
    void testGetAll() {
        bookService.list();
    }

    @Test
    void testGetPage() {
        IPage page = new Page(2,5);
        bookService.page(page);
//        IPage page = bookService.getPage(2,5);
        System.out.println(page.getCurrent());

    }

}
