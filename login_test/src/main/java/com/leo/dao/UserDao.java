package com.leo.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.leo.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserDao extends BaseMapper<User> {


    public User getByNameAndPassword( String username,String password);

}
