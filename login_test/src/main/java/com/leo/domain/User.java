package com.leo.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.context.annotation.Configuration;

@Data
@AllArgsConstructor
@TableName("users")
public class User{

    private Integer id;
    private String userName;
    private String realName;
    private String password;

}
