package com.sybinal.shop.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CrossFilter implements Filter {

	 private boolean isCross = false;

	    @Override
	    public void destroy() {
	        isCross = false;
	    }

	    @Override
	    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	            throws IOException, ServletException {
	    	HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
	        if (isCross) {
	            
	            System.out.println("拦截请求: " + req.getHeader("Origin"));
/*	            res.setHeader("Access-Control-Allow-Origin", req.getHeader("Origin"));
	            res.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
	            res.setHeader("Access-Control-Max-Age", "3600");
	            res.setHeader("Access-Control-Allow-Headers",
	                    "Origin, No-Cache, X-Requested-With, If-Modified-Since, Pragma, Last-Modified, Cache-Control, Expires, Content-Type, X-E4M-With,userId,token");
	            res.setHeader("Access-Control-Allow-Credentials", "true");
	            res.setHeader("XDomainRequestAllowed", "1");*/
	            res.setHeader("Access-Control-Allow-Origin",req.getHeader("Origin"));
	            res.setHeader("Access-Control-Allow-Credentials", "true");
	            res.setHeader("Access-Control-Allow-Headers", 
	       			 "Accept,Accept-Encoding,Accept-Language,Connection,Content-Length,Content-Type, Cookie,Host,Origin,Referer,User-Agent, Authorization,X-Requested-With,OsType");
	            res.setHeader("Access-Control-Allow-Methods", "POST,GET, HEAD,PUT, DELETE, TRACE, OPTIONS");
	        }
	        if("OPTIONS".equalsIgnoreCase(req.getMethod())){
	        	response.getOutputStream().close();
	        }else{
	         
	    		chain.doFilter(req, res);
	    		}
	    }

	    @Override
	    public void init(FilterConfig filterConfig) throws ServletException {
	        String isCrossStr = filterConfig.getInitParameter("IsCross");
	        isCross = isCrossStr.equals("true") ? true : false;
	    }

}
