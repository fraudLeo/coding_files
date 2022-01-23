//package com.leo.service;
//
//
//import com.baomidou.mybatisplus.core.metadata.IPage;
//import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
//import com.leo.domain.Book;
//import com.leo.impl.BookService;
//import com.leo.impl.IBookService;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import javax.xml.crypto.Data;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//
//@SpringBootTest
//public class BookServiceTestCase {
//
//    @Autowired
//    private IBookService bookService;
//
//
//    @Test
//    void testGetbyId () {
//        System.out.println(bookService.getById(4));
//    }
//
//
//    @Test
//    void testSave(){
//        Date date = new Date();
//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
//
//        Book book = new Book();
//        book.setUsername("wtf");
//        book.setAmount("wtf");
//        book.setUpdtime(simpleDateFormat.format(date));
//        book.setSource("wtf");
//        bookService.save(book);
//    }
//
//    @Test
//    void testDelete(){
////        下面是用于BookService的impl的
////        bookService.delete(9);
//
////      下面是用于IBookService的
//        bookService.removeById(10);
//
//    }
//
//
//    @Test
//    void testUpdate(){
//
//        Date date = new Date();
//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//
//        Book book = new Book();
//        book.setId(11);
//        book.setAmount("pp");
//        book.setUpdtime(simpleDateFormat.format(date));
//        book.setSource("oo");
//        book.setUsername("ii");
//    }
//
//
//    @Test
//    void testGetAll() {
//        //        下面是用于BookService的impl的
//
////        bookService.getAll();
//
//        //      下面是用于IBookService的
//        bookService.list();
//
//    }
//
//    @Test
//    void testGetPage(){
////        IPage page = new Page(2,5);
//        //        下面是用于BookService的impl的
//
////        IPage<Book> page = bookService.getPage(3, 5);
//        //      下面是用于IBookService的
//        IPage<Book> page = new Page<Book>(2,5);
//        bookService.page(page);
//
//        System.out.println(page.getCurrent());
//        System.out.println(page.getSize());
//        System.out.println(page.getTotal());
//        System.out.println(page.getPages());
//        System.out.println(page.getRecords());
//    }
//
//
//
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
