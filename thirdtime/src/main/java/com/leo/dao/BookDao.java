package com.leo.dao;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import com.leo.domain.Book;
import org.apache.ibatis.annotations.Select;


@Mapper
public interface BookDao extends BaseMapper<Book> {
//    dao层应该只是CRUD操作，业务层处理数据变化，这样分类更清晰（个人感觉）

}
