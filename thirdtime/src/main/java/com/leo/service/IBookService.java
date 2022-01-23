package com.leo.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.leo.domain.*;

public interface IBookService extends IService<Book> {
    //如果想自定义方法,那么久下面自行添加,然后再在IMPL里面override
    //倘若不知道IService里面有没有,则可以在这里面@Override一下看看

    IPage<Book> getPage(int currentPage, int pageSize);
    IPage<Book> getPage(int currentPage, int pageSize, Book book);
}
