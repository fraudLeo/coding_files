package com.leo.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.leo.controller.utils.R;
import com.leo.domain.Book;
import com.leo.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/books")
public class IBookController {

    @Autowired
    private IBookService iBookService;





    //查询所有信息,返回结果就用list
    @GetMapping
    public R getAll() {

        return new R(true,iBookService.list());
    }

@PostMapping
public R save(@RequestBody Book book) throws IOException {

    if (book.getName().equals("123")) throw new IOException();
//        "添加成功^_^"              "添加失败-_-!"
    boolean flag = iBookService.save(book);

    return new R(flag, flag ? "\"添加成功^_^\"" : "\"添加失败-_-!\"");
}



    @PutMapping
    public R update(@RequestBody Book book) {
        return new R(iBookService.updateById(book));
    }

    @DeleteMapping("{id}")
    public R delete(@PathVariable Integer id) {
        return new R(iBookService.removeById(id));
    }

    @GetMapping("{id}")
    public R getById(@PathVariable Integer id) {
        System.out.println("asdasda");
        System.out.println("asdasda");

        return new R(true,iBookService.getById(id));
    }

//    @GetMapping("{currentPage}/{pageSize}")
//    public R getPage(@PathVariable int currentPage,@PathVariable int pageSize) {
//        IPage<Book> page = iBookService.getPage(currentPage, pageSize);
//        //如果当前页码值大于总页码值,那么重新执行查询操作,使用最大页码值当作当前的页码值
//        if(currentPage >page.getPages()) {
//            page = iBookService.getPage((int)page.getPages(), pageSize);
//        }
//
//        return new R(true,page);
//    }



    @GetMapping("{currentPage}/{pageSize}")
    public R getPage(@PathVariable int currentPage,@PathVariable int pageSize,Book book) {

        IPage<Book> page = iBookService.getPage(currentPage, pageSize,book);
        //如果当前页码值大于总页码值,那么重新执行查询操作,使用最大页码值当作当前的页码值
        if(currentPage >page.getPages()) {
            page = iBookService.getPage((int)page.getPages(), pageSize,book);
        }

        return new R(true,page);
    }
}



















