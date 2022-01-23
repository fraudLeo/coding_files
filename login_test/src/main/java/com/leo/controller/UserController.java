package com.leo.controller;


import com.leo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;


    //当搜索其他页面的时候,跳转到home
    @RequestMapping("/index")
    public String login() {
        return "login";
    }
    @GetMapping("/zhuce")
    public String login1() {
        return "login.html";
    }
}
