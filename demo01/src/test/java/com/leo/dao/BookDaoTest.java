//package com.leo.dao;
//
//
//import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
//import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
//import com.baomidou.mybatisplus.core.metadata.IPage;
//import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
//import com.leo.domain.Book;
//import org.apache.logging.log4j.util.Strings;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import java.text.SimpleDateFormat;
//import java.util.Date;
//
//@SpringBootTest
//public class BookDaoTest {
//
//    @Autowired
//    private BookDao bookDao;
//
//    @Test
//    void testGetById() {
//        System.out.println(bookDao.selectById(1));
//    }
//
//    @Test
//    void testSave(){
//
////        Date date = new Date();
////        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
////
////        Book book = new Book();
//////        book.setId(20);
////        book.setUsername("lv");
////        book.setSource("England");
////        book.setAmount("large");
////        book.setUpdtime(simpleDateFormat.format(date));
////        bookDao.insert(book);

//    }
//
//    @Test
//    void testUpdate(){
////
////        Date date = new Date();
////        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
////
////        Book book = new Book();
////        book.setId(20);
////        book.setUsername("lv");
////        book.setSource("England");
////        book.setAmount("large");
////        book.setUpdtime(simpleDateFormat.format(date));
////        bookDao.updateById(book);
//
//    }
//
//    @Test
//    void testDelete() {
//        bookDao.deleteById(2);
//
//    }
//
//    @Test
//    void testGetAll(){
//        System.out.println(bookDao.selectList(null));
//    }
//
//    @Test
//    void
//    testGetPage() {
//
//        IPage page = new Page(1,5);
//        bookDao.selectPage(page,null);
//
//    }
//
//    @Test
//    void testGetBy() {
//        QueryWrapper<Book> qw = new QueryWrapper<>();
//        qw.like("username","2");
//        bookDao.selectList(qw);
//
//    }
//
//    @Test
//    void testGetBy2() {
//
//        String name = "2";
//
//        LambdaQueryWrapper<Book> lqw = new LambdaQueryWrapper<>();
//        lqw.like(name!=null,Book::getUsername,name);
//        bookDao.selectList(lqw);
//    }
////上下同理
//    @Test
//    void testGetByCondition(){
//
//        String name="3";
//        IPage page = new Page(1,10);
//        LambdaQueryWrapper<Book> lqw = new LambdaQueryWrapper<>();
//        lqw.like(Strings.isNotEmpty(name),Book::getUsername,"3");
//
//
//    }
//
//}
