package com.sybinal.shop.service.account;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sybinal.shop.mapper.AccountMapper;
import com.sybinal.shop.mapper.UserMapper;
import com.sybinal.shop.model.Account;
import com.sybinal.shop.model.User;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountMapper accountMapper;
	
	@Autowired
	UserMapper userMapper;
	
	@Override
	@Transactional
	public Account getAccountByUser(Map<String, Object> reqMap) {
		int userId = Integer.parseInt(reqMap.get("userId").toString());
		Account account = accountMapper.getAccountByUser(userId);
		account.setUserId(userId);
		return account;
	}
	
	
	@Override
	public int rechargeAccount(Account account) {
		int result = accountMapper.rechargeAccount(account);
		return result;
	}
	@Override
	public int payOrderByEwallet(Account account) {
		// TODO Auto-generated method stub
		int result = -1;
		int userId = account.getUserId();
		//获取用户当前账户余额
		double currentAmount = accountMapper.getAccountByUser(userId).getAmount();
		System.out.println("AccountServiceImpl用户当前余额为"+currentAmount/100);
		//获取用户待支付金额
		double payAmount = account.getAmount();
		System.out.println("AccountServiceImpl用户待支付金额为"+(0-payAmount)/100);
		//判断用户余额是否满足当前支付金额
		if(currentAmount >= (0-payAmount)){
		User user = userMapper.selectByPrimaryKey(account.getUserId());
		account.setUsername(user.getUserName());
		result = accountMapper.payOrderByEwallet(account);
		}
		return result;
	}

}
