package com.leo;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.leo.dao.BookDao;
import com.leo.domain.Book;
import lombok.Data;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.SimpleDateFormat;
import java.util.Date;

@SpringBootTest
class Demo09ApplicationTests {
    @Autowired
    private BookDao bookDao;

    @Test
    void contextLoads() {
        System.out.println(bookDao.selectById(1));
    }


    @Test
    void testSave(){

        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Book book = new Book();
        for (int i = 0; i < 10; i++) {
            book.setUsername("测试数据1");
            book.setAmount("测试数据1");
            book.setSource("测试数据1");
            book.setUpdtime(simpleDateFormat.format(date));
            bookDao.insert(book);

        }




    }

    @Test
    void testUpdate(){
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");

        Book book = new Book();
        book.setId(13);

        book.setUsername("测试2");
        book.setAmount("删除");
        book.setSource("哇哇哇哇哇");
        book.setUpdtime(simpleDateFormat.format(date));
        bookDao.updateById(book);

    }

    @Test
    void testDelete(){
        bookDao.deleteById(13);

    }
    @Test
    void testGetAll(){
        System.out.println(bookDao.selectList(null));

    }

    @Test
    void testGetpage(){
        IPage page = new Page(1,5);

//        会打印出来第一页的五条数据
        bookDao.selectPage(page,null);
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

    @Test
    void testGetby(){
        QueryWrapper<Book> qw = new QueryWrapper<>();
        qw.like("username","2");
        bookDao.selectList(qw);
    }
    @Test
    void testGetby2(){
        String name = "1";
        LambdaQueryWrapper<Book> lqw = new LambdaQueryWrapper<Book>();
        lqw.like(name!=null,Book::getUsername,"2");
        bookDao.selectList(lqw);
    }
}
