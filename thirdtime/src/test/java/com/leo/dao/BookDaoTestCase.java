package com.leo.dao;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.leo.domain.Book;

@SpringBootTest
public class BookDaoTestCase {
    @Autowired
    private BookDao bookDao;

    @Test
    void testGetById(){
        System.out.println(bookDao.selectById(1));
    }

    /**
     * 1. 因为要有一个保存的对象,所以必须自己new 一个对象,指定了实体类里面的Book..............................................
     * 2. 这里出现一个问题,book.后面的东西出不来,发现是我自己没有导对包......................................................................
     */
    @Test
    void testSave(){
        Book book = new Book();

        book.setType("测试数据123");
        book.setName("测试数据123");
        book.setDescription("测试数据123");
        bookDao.insert(book);
    }

    @Test
    void testUpDate(){
        Book book = new Book();

        book.setId(22);
        book.setType("测试数据321");
        book.setName("测试数据321");
        book.setDescription("测试数据321");
        bookDao.updateById(book);

    }
    @Test
    void testDelete() {
        bookDao.deleteById(19);
    }

    @Test
    void testGetAll(){

        System.out.println(bookDao.selectList(null));

    }
    @Test
    void testGetPage(){

        IPage page = new Page(1,5);

        bookDao.selectPage(page,null);

        System.out.println(page.getCurrent());
        System.out.println(page.getPages());
        System.out.println(page.getRecords());
        System.out.println(page.getTotal());
        System.out.println(page.getSize());


    }
    @Test
    void testGetBy(){
        String name = null;
/**
 * 这里做了语法级的提示,防止colum写错
 */
        LambdaQueryWrapper<Book> lqw = new LambdaQueryWrapper<>();

        lqw.like(name!=null,Book::getName,"Spring");
        bookDao.selectList(lqw);

    }
}
