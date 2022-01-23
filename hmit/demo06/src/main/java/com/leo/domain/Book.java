package com.leo.domain;

import com.baomidou.mybatisplus.annotation.TableName;

@TableName("account")
public class Book {
    private Integer id;
    private String username;
    private String amount;
    private String source;

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", amount='" + amount + '\'' +
                ", description='" + source + '\'' +
                '}'+"\n";
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return username;
    }

    public void setType(String type) {
        this.username = type;
    }

    public String getName() {
        return amount;
    }

    public void setName(String name) {
        this.amount = name;
    }

    public String getDescription() {
        return source;
    }

    public void setDescription(String description) {
        this.source = description;
    }

}
