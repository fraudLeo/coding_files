package com.leo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.leo.dao.UserDao;
import com.leo.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ImportSelector;
import org.springframework.stereotype.Service;

@Service
public class UserService  {

    @Autowired
    private UserDao userDao;

    //取数据
    public User getUser(String name, String password) {
        return userDao.getByNameAndPassword(name,password);
    }

    //添加用户
    public void insertUser (User user) {
        userDao.insert(user);
    }

}
