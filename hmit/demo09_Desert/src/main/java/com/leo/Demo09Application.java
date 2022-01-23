package com.leo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import javax.swing.*;

@SpringBootApplication
public class Demo09Application {

    public static void main(String[] args) {
        SpringApplication.run(Demo09Application.class, args);
    }

}
//class Demo09Application extends SpringBootServletInitializer{
//    @Override
//    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
//        return builder.sources(Demo09Application.class);
//    }
//}
//



class Demo09Appllication extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(Demo09Appllication.class);
    }
}
