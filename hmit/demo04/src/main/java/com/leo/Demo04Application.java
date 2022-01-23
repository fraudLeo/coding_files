package com.leo;

import com.leo.controller.BookController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class Demo04Application {

    public static void main(String[] args) {
        ConfigurableApplicationContext ctx = SpringApplication.run(Demo04Application.class, args);
        BookController bean = ctx.getBean(BookController.class);
        System.out.println("==========>" + bean);
    }

}

class Demo04Appllication extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(Demo04Appllication.class);
    }
}
