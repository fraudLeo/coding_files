package com.leo;

import com.leo.dao.BookDao;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootTest
class Demo05ApplicationTests {
    @Autowired
    private BookDao BookDao;
    @Test
    void contextLoads() {
        System.out.println(BookDao.getById(1));
    }

}
