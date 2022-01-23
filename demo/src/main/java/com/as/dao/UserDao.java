package com.as.dao;

import com.as.domain.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserDao extends BaseMapper<User> {
    @Select("select * from users where username = #{username} and password=#{password}")
    User getUserNameAndPassword(User user);
}
