package com.leo.config;

import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MPConfig {
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor(){
        /**
         * 1,创建拦截器 ``
         */
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        /**
         * 2,这个拦截器是用来做分页
         */
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor());

        return interceptor;
    }

}
