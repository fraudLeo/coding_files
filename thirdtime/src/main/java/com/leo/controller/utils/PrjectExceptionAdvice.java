package com.leo.controller.utils;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

//作为springMVC的异常处理器
@ControllerAdvice
@RestControllerAdvice
public class PrjectExceptionAdvice {

    //拦截所有的异常信息
    @ExceptionHandler
    public R doException (Exception ex) {

        /**
         * 记录日志,通知运维,通知开发
         */
        //下面一行是报红色错误的.让你知道是哪里出了问题
        ex.printStackTrace();
        return new R(false,"服务器故障,请稍后再试");

    }
}
