package com.sybinal.shop.auth;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sybinal.shop.auth.exception.AuthorizeException;
import com.sybinal.shop.auth.exception.BgAuthorizeException;
import com.sybinal.shop.auth.exception.BgIpInvalidException;
import com.sybinal.shop.auth.exception.IpInvalidException;
import com.sybinal.shop.common.ApiResponseObject;



@ControllerAdvice
public class AuthExceptionHandler {
	
	@ExceptionHandler(IpInvalidException.class)
	@ResponseBody
	public ApiResponseObject handleIpInvalidException() {
		String ERR_CODE = "-4";
		String ERR_MESSAGE = "Ip地址非法，请联系管理员！";
		ApiResponseObject apiResponseObject = new ApiResponseObject();
		apiResponseObject.setErrorCode(ERR_CODE);
		apiResponseObject.setErrorMsg(ERR_MESSAGE);
		return apiResponseObject;
	}

	@ExceptionHandler(AuthorizeException.class)
	@ResponseBody
	public ApiResponseObject handleAuthorizeException() {
		String ERR_CODE = "-5";
		String ERR_MESSAGE = "未通过加密狗认证.";
		ApiResponseObject apiResponseObject = new ApiResponseObject();
		apiResponseObject.setErrorCode(ERR_CODE);
		apiResponseObject.setErrorMsg(ERR_MESSAGE);
		return apiResponseObject;
	}
	
	@ExceptionHandler(BgAuthorizeException.class)
	public ModelAndView handleBgAuthorizeException() {
		ModelAndView model = new ModelAndView();
		model.addObject("type", 1);
		model.setViewName("admin/authrize_fail");
		return model;
	}
	
	@ExceptionHandler(BgIpInvalidException.class)
	public ModelAndView handleBgIpInvalidException() {
		ModelAndView model = new ModelAndView();
		model.addObject("type", 2);
		model.setViewName("admin/authrize_fail");
		return model;
	}
	
	/*@ExceptionHandler(Exception.class)
	public ModelAndView handleException() {
		ModelAndView model = new ModelAndView();
		model.setViewName("admin/authrize_fail");
		return model;
	}*/
	
}
