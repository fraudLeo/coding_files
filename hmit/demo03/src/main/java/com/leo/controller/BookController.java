package com.leo.controller;

import com.leo.MyDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class BookController {
//    读取yml数据中的单一数据

    @Value("${country}")
    private String country1;

    @Value("${user.name}")
    private String name;

    @Value("${likes[2]}")
    private String likes;

    @Value("${tempDir}")
    private String tempDir;

    //    获取全部yml里面的数据
    @Autowired
    private Environment env;

    @Autowired
    private MyDataSource myDataSource;

    @GetMapping
    public String getById() {

        System.out.println("Running......3");
        System.out.println("name====>" + name);
        System.out.println("likes===>" + likes);
        System.out.println("tempDir===>" + tempDir);
        System.out.println("country1:===>" + country1);
        System.out.println("--------------------------------------");
        System.out.println(env.getProperty("server.port"));
        System.out.println(env.getProperty("user.name"));
        System.out.println("--------------------------------------");
        System.out.println("myDataSource=====>" + myDataSource);
        return "SpringBoot is running....3";
    }
}
