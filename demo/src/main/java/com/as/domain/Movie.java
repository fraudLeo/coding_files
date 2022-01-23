package com.as.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("movie2")
public class Movie {

    private Integer id;
    private String name;
    private String type;
    private double score;
    private String img;
    private String actor;
    private String url;
    private String time;
}
