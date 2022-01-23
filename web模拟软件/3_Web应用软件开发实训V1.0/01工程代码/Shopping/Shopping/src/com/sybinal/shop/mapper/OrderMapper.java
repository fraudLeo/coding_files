package com.sybinal.shop.mapper;

import com.sybinal.shop.model.Order;
import com.sybinal.shop.model.OrderExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface OrderMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order
	 * @mbggenerated  Wed Oct 19 21:07:43 CST 2016
	 */
	int countByExample(OrderExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order
	 * @mbggenerated  Wed Oct 19 21:07:43 CST 2016
	 */
	int deleteByExample(OrderExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order
	 * @mbggenerated  Wed Oct 19 21:07:43 CST 2016
	 */
	int deleteByPrimaryKey(String orderNum);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order
	 * @mbggenerated  Wed Oct 19 21:07:43 CST 2016
	 */
	int insert(Order record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order
	 * @mbggenerated  Wed Oct 19 21:07:43 CST 2016
	 */
	int insertSelective(Order record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order
	 * @mbggenerated  Wed Oct 19 21:07:43 CST 2016
	 */
	List<Order> selectByExample(OrderExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order
	 * @mbggenerated  Wed Oct 19 21:07:43 CST 2016
	 */
	Order selectByPrimaryKey(String orderNum);
	
	
	Integer selectByPriceSum(String orderNum);
	
	
	Order selectByUserId(Integer userId);
	
	
	Order selectByOrderUserId(Integer userId);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order
	 * @mbggenerated  Wed Oct 19 21:07:43 CST 2016
	 */
	int updateByExampleSelective(@Param("record") Order record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order
	 * @mbggenerated  Wed Oct 19 21:07:43 CST 2016
	 */
	int updateByExample(@Param("record") Order record,
			@Param("example") OrderExample example);

	
	int updateByExampleOrder(String orderNum);
	
	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order
	 * @mbggenerated  Wed Oct 19 21:07:43 CST 2016
	 */
	int updateByPrimaryKeySelective(Order record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order
	 * @mbggenerated  Wed Oct 19 21:07:43 CST 2016
	 */
	int updateByPrimaryKey(Order record);
	
	int updateByPrice(Order record);

	List<Map<String, Object>> getOrderDate(@Param("beginDate")String beginDate,@Param("endDate")String endDate);
}