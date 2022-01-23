package com.leo;

import com.leo.dao.BookDao;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = Demo04Application.class)
class Demo01ApplicationTests {
    //  1.注入你要测试的对象
    @Autowired
    private BookDao bookDao;
//  2.执行要测试的对象对应的方法

    @Test
    void contextLoads() {
        bookDao.save();
    }

}
