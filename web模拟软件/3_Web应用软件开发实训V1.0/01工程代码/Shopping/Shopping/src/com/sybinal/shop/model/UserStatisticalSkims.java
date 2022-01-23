package com.sybinal.shop.model;

public class UserStatisticalSkims {
private int product_id;
private int user_id;
private int count;
public int getProduct_id() {
	return product_id;
}
public void setProduct_id(int product_id) {
	this.product_id = product_id;
}
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
@Override
public String toString() {
	return "UserStatisticalSkims [product_id=" + product_id + ", user_id=" + user_id + ", count=" + count + "]";
}

}
