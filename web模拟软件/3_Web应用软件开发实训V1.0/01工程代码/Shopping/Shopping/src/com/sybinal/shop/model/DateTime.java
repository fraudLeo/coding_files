package com.sybinal.shop.model;

public class DateTime {
private String endDate;
private String beginDate;
public String getEndDate() {
	endDate=endDate.substring(0,7)+"-01";
	return endDate;
}
public void setEndDate(String endDate) {
	this.endDate = endDate;
}
public String getBeginDate() {
	beginDate=beginDate.substring(0,7)+"-01";
	return beginDate;
}
public void setBeginDate(String beginDate) {
	this.beginDate = beginDate;
}
@Override
public String toString() {
	return "DateTime [endDate=" + endDate + ", beginDate=" + beginDate + "]";
}


}
