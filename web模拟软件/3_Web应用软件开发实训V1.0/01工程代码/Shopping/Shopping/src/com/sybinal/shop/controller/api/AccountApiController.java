package com.sybinal.shop.controller.api;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sybinal.shop.common.ApiResponseEnum;
import com.sybinal.shop.common.ApiResponseObject;
import com.sybinal.shop.model.Account;
import com.sybinal.shop.model.User;
import com.sybinal.shop.service.account.AccountService;
import com.sybinal.shop.service.user.UserService;

@RestController
@RequestMapping("api/v1")
public class AccountApiController extends AbstractApiController {

	@Autowired
	private AccountService accountService;
	
	@Autowired 
	private UserService userService;

	@RequestMapping(value = "/account/userAccount", method = RequestMethod.POST, headers = "Accept=application/json")
	public ApiResponseObject getUserBasic(@RequestBody Map<String, Object> reqMap) {
		System.out.println(reqMap.toString());
		Account account = accountService.getAccountByUser(reqMap);
		System.out.println(account.toString());
		return reponseJSON(ApiResponseEnum.SUCCESS.getCode(),ApiResponseEnum.SUCCESS.getName(),accountService.getAccountByUser(reqMap));
	}

	@RequestMapping(value = "/account/recharge", method = RequestMethod.POST, headers = "Accept=application/json")
	public ApiResponseObject rechargeAccount(@RequestBody Account account) {
		System.out.println(account.toString());
		User u = userService.getUserById(account.getUserId());
		ApiResponseObject apiResponseObject = reponseJSON(ApiResponseEnum.FAIL.getCode(),ApiResponseEnum.FAIL.getName(), false);
		if (u!=null) {
			account.setUsername(u.getUserName());
			account.setUpdTime(new Date());
			account.setSource("充值");
			if (accountService.rechargeAccount(account)==1) {
				return reponseJSON(ApiResponseEnum.SUCCESS.getCode(),ApiResponseEnum.SUCCESS.getName(),true);
			}else {
				return apiResponseObject;
			}
		}else{
			return apiResponseObject;
		}
	}
	
	@RequestMapping(value = "/account/payOrder", method = RequestMethod.POST, headers = "Accept=application/json")
	public ApiResponseObject payOrderByEwallet(Account account) {
		account.setUpdTime(new Date());
		account.setSource("商城消费");
		int result = accountService.payOrderByEwallet(account);
		if (result != -1) {
			return reponseJSON(ApiResponseEnum.SUCCESS.getCode(),ApiResponseEnum.SUCCESS.getName(), result);
		} else {
			return reponseJSON(ApiResponseEnum.FAIL.getCode(),ApiResponseEnum.FAIL.getName(), result);
		}
	}

}
