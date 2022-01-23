package com.sybinal.shop.model;

public class ProductStatisticalSkims {
private int product_id;
private int count;
public int getProduct_id() {
	return product_id;
}
public void setProduct_id(int product_id) {
	this.product_id = product_id;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
@Override
public String toString() {
	return "ProductStatisticalSkims [product_id=" + product_id + ", count=" + count + "]";
}

}
