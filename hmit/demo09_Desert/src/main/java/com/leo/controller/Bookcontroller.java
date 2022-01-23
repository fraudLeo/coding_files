package com.leo.controller;

import com.leo.domain.Book;
import com.leo.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/books")
public class Bookcontroller {

    @Autowired
    private IBookService bookService;


    @GetMapping
    public List<Book> getAll(){
        return bookService.list();
    }

//    传,接受,json数据要加 @requestbody
    @PostMapping
    public Boolean save(@RequestBody Book book){
        return bookService.save(book);
    }

    @PutMapping
    public Boolean update(@RequestBody Book book){
        return bookService.updateById(book);
    }



//要写{id} 也要写 参数来源 @PathVariable
    @DeleteMapping("/{id}")
    public Boolean delete(@PathVariable Integer id){
        return bookService.removeById(id);
    }

    @GetMapping("/{id}")
    public Book getById(@PathVariable int id){
        return bookService.getById(id);
    }
}
