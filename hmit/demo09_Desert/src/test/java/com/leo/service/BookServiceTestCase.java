package com.leo.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.leo.domain.Book;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.SimpleDateFormat;
import java.util.Date;

@SpringBootTest
public class BookServiceTestCase {

    @Autowired
    private IBookService bookService;

    @Test
    void testGetById(){
        System.out.println(bookService.getById(4));
    }


    @Test
    void testSave(){

        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Book book = new Book();
        book.setUsername("--");
        book.setAmount("--");
        book.setSource("--");
        book.setUpdtime(simpleDateFormat.format(date));
        bookService.save(book);

        }


    @Test
    void testUpdate(){
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");

        Book book = new Book();
        book.setId(7);

        book.setUsername("testadsa");
        book.setAmount("删除");
        book.setSource("哇哇哇哇哇");
        book.setUpdtime(simpleDateFormat.format(date));
        bookService.updateById(book);

    }

    @Test
    void testDelete(){
        bookService.removeById(9);
    }


    @Test
    void testGetAll(){
        System.out.println(bookService.list());
    }

    @Test
    void testGetPage(){
//        IPage page = new Page(1,5);
        IPage<Book> page = new Page<Book> ();
        bookService.page(page);
//        会打印出来第一页的五条数据
//        IPage<Book> page = bookService.(2, 5);
//        输出全部的页数
        System.out.println(page.getPages());
//        输出当前所在的页数
        System.out.println(page.getCurrent());
//        输出当前页的记录
        System.out.println(page.getRecords());
//        输出这页的步长
        System.out.println(page.getSize());
//        输出总条数
        System.out.println(page.getTotal());


    }
//
//    @Test
//    void testGetby(){
//        QueryWrapper<Book> qw = new QueryWrapper<>();
//        qw.like("username","2");
//        bookDao.selectList(qw);
//    }
//    @Test
//    void testGetby2(){
//        String name = "1";
//        LambdaQueryWrapper<Book> lqw = new LambdaQueryWrapper<Book>();
//        lqw.like(name!=null,Book::getUsername,"2");
//        bookDao.selectList(lqw);
//    }

}



















