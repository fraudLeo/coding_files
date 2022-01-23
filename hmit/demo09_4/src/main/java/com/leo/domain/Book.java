package com.leo.domain;

import lombok.Data;

import java.util.Date;
@Data
public class Book {
    private Integer id;
    private String username;
    private String amount;
    private String source;
    private Date updtime;
}
//                           实体类