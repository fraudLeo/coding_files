package com.leo.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;
@Data
@TableName("tbl_book")
public class Book {
//
//
//    private Integer id;
//    private String username;
//    private String amount;
//    private String source;
//    private String updtime;

    private Integer id;
    private String type;
    private String name;
    private String description;
}
