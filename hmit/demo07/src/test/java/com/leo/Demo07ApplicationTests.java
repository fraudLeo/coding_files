package com.leo;

import com.leo.dao.BookDao;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class Demo07ApplicationTests {
    @Autowired
    private BookDao bookdao;
    @Test
    void contextLoads() {
        System.out.println(bookdao.selectById(1));
    }

}
