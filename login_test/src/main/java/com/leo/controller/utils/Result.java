package com.leo.controller.utils;

import lombok.Data;

@Data
public class Result {
    //返回信息
    private String msg;
    //数据是否请求征程
    private Boolean flag;
    //具体返回的数据
    private Object data;


    public Result(Boolean flag) {

        this.flag = flag;
    }
    public Result(Boolean flag, String msg) {
        this.flag = flag;
        this.msg = msg;
    }
    public Result(Boolean flag, Object data) {
        this.flag = flag;
        this.data = data;
    }

}
