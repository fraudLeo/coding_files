package com.leo.dao;

import com.leo.domain.Book;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
@Mapper
public interface BookDao {
    @Select("Select * from account where id = 2")
    public Book getById(Integer id);
}
