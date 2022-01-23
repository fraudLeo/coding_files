package com.leo;

import com.leo.controller.BookController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class Demo01Application {

    public static void main(String[] args) {
        ConfigurableApplicationContext ctx = SpringApplication.run(Demo01Application.class, args);
        BookController bean = ctx.getBean(BookController.class);
        System.out.println("==========>" + bean);
    }

}

class Demo01Appllication extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(Demo01Appllication.class);
    }
}
