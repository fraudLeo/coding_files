package com.leo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class Demo05Application {

    public static void main(String[] args) {
       SpringApplication.run(Demo05Application.class, args);

    }

}
//
//public class Demo01Application {
//
//    public static void main(String[] args) {
//        ConfigurableApplicationContext ctx = SpringApplication.run(Demo01Application.class, args);
//        BookController bean = ctx.getBean(BookController.class);
//        System.out.println("==========>" + bean);