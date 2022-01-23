package com.sybinal.shop.mapper;

import com.sybinal.shop.model.CommentaryPraise;

public interface CommentaryPraiseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CommentaryPraise record);

    int insertSelective(CommentaryPraise record);

    CommentaryPraise selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CommentaryPraise record);

    int updateByPrimaryKey(CommentaryPraise record);
}