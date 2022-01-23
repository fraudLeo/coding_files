package com.leo.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.leo.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.leo.domain.*;

import java.util.List;

//@RestController
//@RequestMapping("/books")
public class BookController {

    @Autowired
    private IBookService iBookService;

    //查询所有信息,返回结果就用list
    @GetMapping
    public List<Book> getAll() {
        return iBookService.list();
    }

    @PostMapping
    public Boolean save(@RequestBody Book book) {
        return iBookService.save(book);
    }

    @PutMapping
    public Boolean update(@RequestBody Book book) {
        return iBookService.updateById(book);
    }

    @DeleteMapping("{id}")
    public Boolean delete(@PathVariable Integer id) {
        return iBookService.removeById(id);
    }

    @GetMapping("{id}")
    public Book getById(@PathVariable Integer id) {
        return iBookService.getById(id);
    }

    @GetMapping("{currentPage}/{pageSize}")
    public IPage getPage(@PathVariable int currentPage,@PathVariable int pageSize) {
        return iBookService.getPage(currentPage,pageSize, null);
    }

}
