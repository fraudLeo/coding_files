package com.sybinal.shop.controller.api;

import java.lang.reflect.InvocationTargetException;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sybinal.shop.common.ApiResponseEnum;
import com.sybinal.shop.common.ApiResponseObject;
import com.sybinal.shop.mapper.OrderMapper;
import com.sybinal.shop.model.Account;
import com.sybinal.shop.model.Order;
import com.sybinal.shop.model.OrderItem;
import com.sybinal.shop.model.Product;
import com.sybinal.shop.model.Sku;
import com.sybinal.shop.service.account.AccountService;
import com.sybinal.shop.service.catalog.ProductService;
import com.sybinal.shop.service.catalog.SkuService;
import com.sybinal.shop.service.option.OptionService;
import com.sybinal.shop.service.order.OrderService;

@RestController
@RequestMapping("api/v1")
public class OrderApiController extends AbstractApiController {

	@Autowired
	OrderService orderService;

	@Autowired
	ProductService productService;

	@Autowired
	SkuService skuService;

	@Autowired
	OptionService optionService;

	@Autowired
	AccountService accountService;
	
	@Autowired
	OrderMapper orderMapper;
	
	/**
	 * 添加订单
	 */
	@RequestMapping(value = "/cart/checkout/addPayMent", method = RequestMethod.POST, headers = "Accept=application/json")
	public ApiResponseObject changeOrder(@RequestBody Order order)
			throws IllegalAccessException, InvocationTargetException {
		if (order.getUserId() == null) {
			return this.reponseJSON(ApiResponseEnum.FAIL.getCode(), ApiResponseEnum.FAIL.getName(), null);
		} else if (order.getOrderItemList() == null && order.getOrderItemList().size() == 0) {
			return this.reponseJSON(ApiResponseEnum.ERROR_PARAM.getCode(), ApiResponseEnum.ERROR_PARAM.getName(), null);
		}
		String orderNum = orderService.changeOrder(order);
		if (orderNum == null) {
			return this.reponseJSON(ApiResponseEnum.ERROR_PARAM.getCode(), ApiResponseEnum.ERROR_PARAM.getName(), null);
		}
		return reponseJSON(ApiResponseEnum.SUCCESS.getCode(), ApiResponseEnum.SUCCESS.getName(), orderNum);
	}

	/**
	 * 修改订单
	 */
	@RequestMapping(value = "/order/items/update", method = RequestMethod.POST, headers = "Accept=application/json")
	public ApiResponseObject modOrder(@RequestBody Order order)
			throws IllegalAccessException, InvocationTargetException {
		if (StringUtils.isEmpty(order.getUserId())) {
			return reponseJSON(ApiResponseEnum.FAIL.getCode(), ApiResponseEnum.FAIL.getName(), null);
		}
		// orderService.modOrder(reqMap);
		return reponseJSON(ApiResponseEnum.SUCCESS.getCode(), ApiResponseEnum.SUCCESS.getName(), 1);
	}

	@RequestMapping("/test")
	@ResponseBody
	public Map<String, Object> test(String un, String pwd) {
		Map<String, Object> map = new HashMap<>();
		map.put("data", "这是数据对象");
		return map;
	}

	/**
	 * 获取订单详细列表
	 */
	@RequestMapping(value = "/user/orders/detail", method = RequestMethod.POST, headers = "Accept=application/json")
	public ApiResponseObject getOrderItemList(Order order) throws IllegalAccessException, InvocationTargetException {
		if (StringUtils.isEmpty(order.getUserId())) {
			return this.reponseJSON(ApiResponseEnum.FAIL.getCode(), ApiResponseEnum.FAIL.getName(), null);
		}
		return reponseJSON(ApiResponseEnum.SUCCESS.getCode(), ApiResponseEnum.SUCCESS.getName(),
				orderService.getOrderItemData(order));
	}

	/**
	 * 获取订单列表
	 * 
	 * @throws ParseException
	 */
	@RequestMapping(value = "user/orders/list", method = RequestMethod.POST, headers = "Accept=application/json")
	public ApiResponseObject getOrder(@RequestBody Order order) throws ParseException {
		if (order.getUserId() == null) {
			return this.reponseJSON(ApiResponseEnum.FAIL.getCode(), ApiResponseEnum.FAIL.getName(), null);
		}
		Map<String, Object> map = orderService.getOrder(order);
		if (map == null) {
			return this.reponseJSON(ApiResponseEnum.ERROR_PARAM.getCode(), ApiResponseEnum.ERROR_PARAM.getName(), null);
		}
		return reponseJSON(ApiResponseEnum.SUCCESS.getCode(), ApiResponseEnum.SUCCESS.getName(), map);
	}

	
	/**
	 * 支付订单
	 * @throws Exception 
	 * */
	@RequestMapping(value = "/order/PayMent", method = RequestMethod.POST, headers = "Accept=application/json")
	public ApiResponseObject addPayMent(@RequestBody Map<String,Object> mapReq) throws Exception{
		if(StringUtils.isEmpty(mapReq.get("userId"))){
			return reponseJSON(ApiResponseEnum.ERROR_PARAM.getCode(), ApiResponseEnum.ERROR_PARAM.getName(), null);
		}
		if(StringUtils.isEmpty(mapReq.get("id"))){
			return reponseJSON(ApiResponseEnum.ERROR_PARAM.getCode(), ApiResponseEnum.ERROR_PARAM.getName(), null);
		}
		if(StringUtils.isEmpty(mapReq.get("paymentType"))){
			return reponseJSON(ApiResponseEnum.ERROR_PARAM.getCode(), ApiResponseEnum.ERROR_PARAM.getName(), null);
		}
		if(StringUtils.isEmpty(mapReq.get("orderNum"))){
			return reponseJSON(ApiResponseEnum.ERROR_PARAM.getCode(), ApiResponseEnum.ERROR_PARAM.getName(), null);
		}
		//使用order的userid 获取用户的购物车
		Order orderData = orderService.getOrderByUserId(Integer.parseInt(mapReq.get("userId").toString()));
		if(orderData==null){
			return reponseJSON(ApiResponseEnum.FAIL.getCode(), ApiResponseEnum.FAIL.getName(), null);
		}
		for (OrderItem orderItem : orderData.getOrderItemList()) {
			Product product = productService.getProductByid(orderItem.getProductId());
			if(product == null) {
				return reponseJSON(ApiResponseEnum.FAIL.getCode(), ApiResponseEnum.FAIL.getName(), null);
			}
			//需要计算库存
			if(product.getInventoryFlag() == 0) {
				if (!StringUtils.isEmpty(orderItem.getOptionValueKeyGroup())) {
					Sku sku = skuService.getSkyById(orderItem.getSkuId());
					if (sku != null) {
						if (orderItem.getQuantity() > sku.getQuantity()) {
							return reponseJSON(ApiResponseEnum.FAIL.getCode(), "库存不足", sku);
						}
					}
				} else {
					if (orderItem.getQuantity() > product.getQuantity()) {
						return reponseJSON(ApiResponseEnum.FAIL.getCode(), "库存不足", product);
					}
				}
			}
		}
		orderService.savePaymentHistory(mapReq);
		optionService.setQuantity(orderData.getOrderItemList());
		Account account = accountService.getAccountByUser(mapReq);
		Integer orderPrice = orderMapper.selectByPriceSum(mapReq.get("orderNum").toString());
		account.setSource("商城消费");
		account.setAmount(orderPrice * (-1));
		account.setUpdTime(new Date());
		if (accountService.payOrderByEwallet(account) == -1) {
			return reponseJSON(ApiResponseEnum.FAIL.getCode(), ApiResponseEnum.FAIL.getName(), "余额不足");
		}
		return reponseJSON(ApiResponseEnum.SUCCESS.getCode(), ApiResponseEnum.SUCCESS.getName(), "支付成功");
	}
	/**
	 * 图表数据来源
	 * 
	 * @param dateTime
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "/order/data", method = RequestMethod.POST, headers = "Accept=application/json")
	public ApiResponseObject getOrderData(@RequestBody Map<String,Object>rmap) throws ParseException {
		DateFormat dateFormat = DateFormat.getDateInstance();
		Date beginDate = dateFormat.parse(rmap.get("beginDate").toString());
		Date endDate = dateFormat.parse(rmap.get("endDate").toString());
		if (beginDate.compareTo(endDate) == 1) {
			return reponseJSON(ApiResponseEnum.FAIL.getCode(), ApiResponseEnum.FAIL.getName(), "开始日期不能大于结束日期");
		}
		return reponseJSON(ApiResponseEnum.SUCCESS.getCode(), ApiResponseEnum.SUCCESS.getName(),
				orderService.getOrderDate(rmap));
	}

	
	/**
	 * 监测订单支付状态
	 * @param orderNum
	 * @return
	 */
	@RequestMapping(value="/order/check",method =RequestMethod.POST, headers = "Accept=application/json")
	public ApiResponseObject checkPaymentStatus(@RequestBody Map<String,Object> mapReq) {
		String orderNum = mapReq.get("orderNum").toString();
		return reponseJSON(ApiResponseEnum.SUCCESS.getCode(), ApiResponseEnum.SUCCESS.getName(), orderService.checkOrderIsPayed(orderNum));
	}
}
