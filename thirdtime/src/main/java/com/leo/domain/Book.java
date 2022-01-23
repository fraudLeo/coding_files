package com.leo.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import jdk.nashorn.internal.objects.annotations.Constructor;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data


public class Book {
    private Integer id;
    private String name;
    private String type;
    private String description;

}
