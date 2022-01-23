package com.leo.dao;

import com.leo.domain.Book;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface BookDao {
    @Select("select * from account where id=#{id}")
    Book getById(Integer id);
}
