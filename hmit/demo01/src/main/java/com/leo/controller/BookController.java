package com.leo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BookController {

    @RequestMapping("/first")
    public String getById() {
        System.out.println("Running");
        return "SpringBoot is running";
    }
}
