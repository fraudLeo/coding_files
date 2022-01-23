package com.leo.domain;

import lombok.Data;
import lombok.Getter;

import java.util.Date;

//使用lombok就只需要直接Getter&Setter了,或者直接一口气Data
//如果使用构造方法,还需要加上@AllArgsConstructor
@Data
public class Book {

    private Integer id;
    private String username;
    private String amount;
    private String source;
    private Date updtime;

}
/*
    *     这个是一个实体类
*/