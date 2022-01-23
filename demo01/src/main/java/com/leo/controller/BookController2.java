package com.leo.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.leo.controller.utils.R;
import com.leo.domain.Book;
import com.leo.impl.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/books")
public class BookController2 {

    @Autowired
    private IBookService iBookService;

    @GetMapping
    public R getAll(){

        return new R(true,iBookService.list());
    }


    @PostMapping
    public R save(@RequestBody Book book) {

//        R r = new R();
//        Boolean flag = iBookService.save(book);
//        r.setFlag(flag);
//        r.setData(null);

        return new R(iBookService.save(book));
    }

    @PutMapping
    public R update(@RequestBody Book book){
        return new R(iBookService.modify(book));
    }

    @DeleteMapping("{id}")
    public R delete(@PathVariable Integer id){
        return new R(iBookService.delete(id));
    }

    @GetMapping("{id}")
    public R getById(@PathVariable Integer id) {

        return new R(true,iBookService.getById(id));
    }

    @GetMapping("{currentPage}/{pageSize}")
    public R getPage(@PathVariable int currentPage ,@PathVariable int pageSize){

        return new R(true,iBookService.getPage(currentPage,pageSize));
    }
}
