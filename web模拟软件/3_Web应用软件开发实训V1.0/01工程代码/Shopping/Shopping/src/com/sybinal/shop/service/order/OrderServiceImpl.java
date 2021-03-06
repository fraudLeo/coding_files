package com.sybinal.shop.service.order;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.sybinal.shop.common.PageInformation;
import com.sybinal.shop.mapper.ContectMapper;
import com.sybinal.shop.mapper.LogisticsMapper;
import com.sybinal.shop.mapper.OrderHistoryMapper;
import com.sybinal.shop.mapper.OrderItemMapper;
import com.sybinal.shop.mapper.OrderMapper;
import com.sybinal.shop.mapper.PaymentHistoryMapper;
import com.sybinal.shop.mapper.ProductMapper;
import com.sybinal.shop.mapper.SkuMapper;
import com.sybinal.shop.mapper.UserMapper;
import com.sybinal.shop.model.Contect;
import com.sybinal.shop.model.Logistics;
import com.sybinal.shop.model.LogisticsExample;
import com.sybinal.shop.model.Order;
import com.sybinal.shop.model.OrderExample;
import com.sybinal.shop.model.OrderExample.Criteria;
import com.sybinal.shop.model.OrderHistory;
import com.sybinal.shop.model.OrderHistoryExample;
import com.sybinal.shop.model.OrderItem;
import com.sybinal.shop.model.OrderItemExample;
import com.sybinal.shop.model.PaymentHistory;
import com.sybinal.shop.model.PaymentHistoryExample;
import com.sybinal.shop.model.Product;
import com.sybinal.shop.model.ProductExample;
import com.sybinal.shop.model.Sku;
import com.sybinal.shop.model.SkuExample;
import com.sybinal.shop.model.User;
import com.sybinal.shop.model.UserExample;
import com.sybinal.shop.service.sequence.SequenceService;
import com.sybinal.shop.service.user.ContectService;
import com.sybinal.shop.utils.Constants;
import com.sybinal.shop.utils.DateUtils;
import com.sybinal.shop.utils.Page;
import com.sybinal.shop.utils.PagingTool;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderMapper orderMapper;

	@Autowired
	OrderItemMapper orderItemMapper;

	@Autowired
	SequenceService sequenceService;

	@Autowired
	PaymentHistoryMapper paymentHistoryMapper;

	@Autowired
	OrderHistoryMapper orderHistoryMapper;

	@Autowired
	LogisticsMapper logisticsMapper;

	@Autowired
	PagingTool pagingTool;

	@Autowired
	ContectService contectService;

	@Autowired
	ContectMapper contectMapper;

	@Autowired
	SkuMapper skuMapper;

	@Autowired
	ProductMapper productMapper;

	@Autowired
	UserMapper userMapper;
	
	// ???????????????
	@Override
	@Transactional
	public void saveOrder(Order order) throws IllegalAccessException, InvocationTargetException {
		// ??????????????? orderOptionMapper
		OrderItem orderItem = null;
		Date orderCreateTime = new Date();
		String orderNum = "";
		Order orderW = orderMapper.selectByUserId(order.getUserId());
		if (orderW == null) {
			orderNum = sequenceService.getSequence(Constants.SEQUENCE_TYPE_O,
					Constants.SEQUENCE_TYPE_O
							+ DateUtils.getFormatDate(orderCreateTime, Constants.SYSTEM_DATE_FOMART_1),
					Constants.SEQUENCE_COUNTER);
			order.setOrderNum(orderNum);
			// ?????????
			order.setPaymentFlag(0);
			// ???????????????
			order.setType(1);
			orderMapper.insert(order);
			orderItem = order.getOrderItem();
		} else {
			OrderItemExample orderItemExample = new OrderItemExample();
			com.sybinal.shop.model.OrderItemExample.Criteria orderItemCriteria = orderItemExample.createCriteria();
			orderItemCriteria.andOrderNumT4EqualTo(orderW.getOrderNum());
			orderItemCriteria.andProductIdEqualTo(order.getOrderItem().getProductId());
			if (!StringUtils.isEmpty(order.getOrderItem().getOptionValueKeyGroup())) {
				orderItemCriteria.andoptionValueKeyGroupEqualTo(order.getOrderItem().getOptionValueKeyGroup());
			}
			List<OrderItem> list = orderItemMapper.selectByExample(orderItemExample);
			if (list != null && list.size() > 0) {
				OrderItem orderItemQ = new OrderItem();
				orderItemQ.setQuantity(list.get(0).getQuantity() + order.getOrderItem().getQuantity());
				orderItemQ.setId(list.get(0).getId());
				orderItemMapper.updateByQuantity(orderItemQ);

				Integer orderPrice = orderMapper.selectByPriceSum(orderW.getOrderNum());
				orderW.setPrice(orderPrice);
				orderMapper.updateByPrice(orderW);
			} else {
				orderItem = new OrderItem();
				orderItem = order.getOrderItem();
				orderNum = orderW.getOrderNum();
			}
		}
		// ?????????????????????
		if (orderItem != null) {
			String orderItemNum = sequenceService.getSequence(Constants.SEQUENCE_TYPE_I,
					Constants.SEQUENCE_TYPE_I
							+ DateUtils.getFormatDate(orderCreateTime, Constants.SYSTEM_DATE_FOMART_1),
					Constants.SEQUENCE_COUNTER);
			orderItem.setOrderNum(orderNum);
			orderItem.setId(orderItemNum);
			if (!StringUtils.isEmpty(order.getOrderItem().getOptionValueKeyGroup())) {
				// ???sku??????????????? ??????sku????????????????????? orderItem???price???
				SkuExample exampleSku = new SkuExample();
				com.sybinal.shop.model.SkuExample.Criteria criteriaSku = exampleSku.createCriteria();
				criteriaSku.andOptionValueKeyGroupEqualTo(order.getOrderItem().getOptionValueKeyGroup());
				criteriaSku.andProductIdEqualTo(order.getOrderItem().getProductId());
				List<Sku> listSku = skuMapper.selectByExample(exampleSku);
				orderItem.setPrice(listSku.get(0).getPrice());
			} else {
				// ??????????????? ??????????????? ??????orderItem???price???
				ProductExample productExample = new ProductExample();
				com.sybinal.shop.model.ProductExample.Criteria productCriteria = productExample.createCriteria();
				productCriteria.andIdEqualTo(orderItem.getProductId());
				List<Product> productList = productMapper.selectByExample(productExample);
				orderItem.setPrice(productList.get(0).getPrice());
			}
			orderItemMapper.insert(orderItem);
			// ????????????????????????
			Integer orderPrice = orderMapper.selectByPriceSum(orderNum);
			order.setOrderNum(orderNum);
			order.setPrice(orderPrice);
			orderMapper.updateByPrice(order);
		}

	}

	/**
	 * ????????????????????????
	 */
	@Override
	@Transactional
	public void modOrder(Order order) throws IllegalAccessException, InvocationTargetException {
		for (int i = 0; i < order.getOrderItemList().size(); i++) {
			orderItemMapper.updateByQuantity(order.getOrderItemList().get(i));
		}
		// ?????????????????????????????? selectByUserId type=1????????????????????????
		Order orderID = orderMapper.selectByUserId(order.getUserId());
		Integer orderPrice = orderMapper.selectByPriceSum(orderID.getOrderNum());
		orderID.setPrice(orderPrice);
		orderMapper.updateByPrice(orderID);
	}

	/**
	 * ??????????????????
	 */
	@Override
	@Transactional
	public void delOrder(Order order) throws IllegalAccessException, InvocationTargetException {
		OrderHistory orderHistory = new OrderHistory();
		OrderItemExample example = new OrderItemExample();
		com.sybinal.shop.model.OrderItemExample.Criteria criteria = example.createCriteria();
		// //???????????? 1???????????? 0?????????
		if (order.getType() == 0) {
			// ????????????
			criteria.andOrderNumEqualTo(order.getOrderNum());

			PaymentHistoryExample exampleHistory = new PaymentHistoryExample();
			com.sybinal.shop.model.PaymentHistoryExample.Criteria criteria1 = exampleHistory.createCriteria();
			criteria1.andOrderNumEqualTo(order.getOrderNum());
			// ?????????????????? ??????????????????????????????????????????
			int count = paymentHistoryMapper.countByExample(exampleHistory);
			if (count == 0) {
				orderHistory.setStatus(4);
				orderHistory.setNote(4);
				orderHistory.setOrderNum(order.getOrderNum());
				orderHistory.setUpdateUserId(order.getUserId());
				orderHistoryMapper.insert(orderHistory);
				orderMapper.deleteByPrimaryKey(order.getOrderNum());
				orderItemMapper.deleteByExample(example);
			}
		} else {
			criteria.andIdEqualTo(order.getOrderItem().getId());
			// ???????????????
			orderItemMapper.deleteByExample(example);
			order = orderMapper.selectByUserId(order.getUserId());
			Integer orderPrice = orderMapper.selectByPriceSum(order.getOrderNum());
			order.setOrderNum(order.getOrderNum());
			order.setPrice(orderPrice);
			orderMapper.updateByPrice(order);
		}
	}

	/**
	 * ????????????
	 * 
	 * @throws ParseException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Map<String, Object> getOrder(Order order) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		OrderExample example = new OrderExample();
		Criteria criteria = example.createCriteria();

		// price >=
		if (!StringUtils.isEmpty(order.getStartPrice())) {
			criteria.andPriceGreaterThanOrEqualTo(Integer.parseInt(order.getStartPrice()));
		}
		// price <=
		if (!StringUtils.isEmpty(order.getEndPrice())) {
			criteria.andPriceLessThanOrEqualTo(Integer.parseInt(order.getEndPrice()));
		}

		// ??????????????????
		if (order.getStatus() != null) {
			criteria.andStatusEqualTo(order.getStatus());
		}
		// ??????????????????
		if (!StringUtils.isEmpty(order.getOrderNum())) {
			criteria.andOrderNumEqualTo(order.getOrderNum());
		}
		// ????????????????????????
		if (!StringUtils.isEmpty(order.getPaymentFlag())) {
			criteria.andPaymentFlagEqualTo(order.getPaymentFlag());
		}
		// ????????????????????????
		if (!StringUtils.isEmpty(order.getStartDate())) {
			criteria.andCreateTimeGreaterThanOrEqualTo(sdf.parse(order.getStartDate() + " 00:00:00"));
		}
		// ????????????????????????
		if (!StringUtils.isEmpty(order.getEndDate())) {
			criteria.andCreateTimeLessThanOrEqualTo(sdf.parse(order.getEndDate() + " 59:59:59"));
		}
		if (!StringUtils.isEmpty(order.getType())) {
			criteria.andTypeEqualTo(order.getType());
		}
		Map mapData = null;
		// ????????????id??????
		if (!StringUtils.isEmpty(order.getUserId())) {
			criteria.andUserIdEqualTo(order.getUserId());
			int pageCount = orderMapper.countByExample(example);
			List<Order> listOrder = pagingTool.PagingData("com.sybinal.shop.mapper.OrderMapper.selectByExample",
					example, order.getNowPage());

			mapData = new HashMap<>();
			mapData.put("orderListData", listOrder);
			// ???????????????
			mapData.put("pageCount", Page.confirmPage(pageCount, Constants.PAGE_NUMBER));
			mapData.put("nowPage", order.getNowPage());
		}
		return mapData;
	}

	// ??????
	@Override
	@Transactional
	public void savePaymentHistory(Map<String,Object> mapReq) {
		PaymentHistory paymentHistory = new PaymentHistory();
		Order order = new Order();
		// ??????????????????????????????
		Contect contect = contectMapper.selectByPrimaryKey(Integer.parseInt(mapReq.get("id").toString()));
		OrderHistory orderHistory = new OrderHistory();
		order.setOrderNum(mapReq.get("orderNum").toString());
		// ?????????
		order.setStatus(1);
		// ?????????
		order.setPaymentFlag(1);
		// ????????????
		order.setType(0);
		// ??????
		if (contect != null) {
			order.setContactAddress(contect.getAddress());
			order.setContactMobile(contect.getMobile());
			order.setContactName(contect.getName());
		}
		orderHistory.setOrderNum(mapReq.get("orderNum").toString());
		orderHistory.setUpdateUserId(Integer.parseInt(mapReq.get("userId").toString()));
		// ???????????? ?????????
		orderHistory.setStatus(1);
		orderHistory.setNote(1);
		paymentHistory.setPaymentType(Integer.parseInt(mapReq.get("paymentType").toString()));
		Integer orderPrice = orderMapper.selectByPriceSum(mapReq.get("orderNum").toString());
		paymentHistory.setProductPrice(orderPrice);
		paymentHistory.setOrderNum(mapReq.get("orderNum").toString());
		paymentHistory.setUserId(Integer.parseInt(mapReq.get("userId").toString()));
		order.setPrice(orderPrice);
		// ???????????????
		orderHistoryMapper.insert(orderHistory);
		paymentHistoryMapper.insert(paymentHistory);
		orderMapper.updateByPrimaryKeySelective(order);
	}


	// ?????????????????????
	@Override
	@Transactional
	public void delAllOrder(Order order) throws IllegalAccessException, InvocationTargetException {
		OrderExample example = new OrderExample();
		Criteria criteria = example.createCriteria();
		if (!StringUtils.isEmpty(order.getUserId())) {
			criteria.andUserIdEqualToRemove(order.getUserId());
			criteria.andTypeEqualTo(1);
			orderItemMapper.deleteByPrimaryKey(order.getUserId());
			orderMapper.deleteByExample(example);
		}
	}

	// ?????????????????????
	@SuppressWarnings("unchecked")
	@Override
	public Order getOrderItem(Order order) throws IllegalAccessException, InvocationTargetException {
		List<OrderItem> listOrderItem = null;
		OrderItemExample example = new OrderItemExample();
		com.sybinal.shop.model.OrderItemExample.Criteria criteria = example.createCriteria();
		if (!StringUtils.isEmpty(order.getUserId())) {
			order = orderMapper.selectByUserId(order.getUserId());
			if (order == null) {
				return order;
			}
			criteria.andUserI1dTEqualTo(order.getUserId());
			criteria.andTypeEqualTo(order.getType());
			listOrderItem = new ArrayList<>();
			listOrderItem = orderItemMapper.selectByExample(example);
			order.setOrderItemList(listOrderItem);

			Contect contect = new Contect();
			contect.setUserId(order.getUserId());
			Map<String, Object> map = contectService.getContect(contect);
			if (map != null && map.get("data") != null) {
				List<Contect> contectList = (List<Contect>) map.get("data");
				order.setContectList(contectList);
			}

			if (order.getType() == 0) {
				LogisticsExample exampleL = new LogisticsExample();
				com.sybinal.shop.model.LogisticsExample.Criteria criteriaL = exampleL.createCriteria();
				criteriaL.andOrderNumEqualTo(order.getOrderNum());
				List<Logistics> logisticsList = logisticsMapper.selectByExample(exampleL);
				order.setLogisticsList(logisticsList);
			}
		}
		return order;
	}

	// ?????????????????????
	@Override
	public Integer getOrderCount(User user) throws IllegalAccessException, InvocationTargetException {
		Integer count = null;
		if (!StringUtils.isEmpty(user.getId())) {
			count = orderItemMapper.countByExample(user.getId());
		}
		return count;
	}

	/**
	 * ????????????????????? //???????????????orderNum
	 */
	@Override
	@Transactional
	public String changeOrder(Order order) throws IllegalAccessException, InvocationTargetException {
		OrderHistory orderHistory = new OrderHistory();
		// ?????????????????????
		for (int i = 0; i < order.getOrderItemList().size(); i++) {
			orderItemMapper.updateByQuantity(order.getOrderItemList().get(i));
		}
		// ?????????????????????????????? selectByUserId type=1????????????????????????
		Order orderID = orderMapper.selectByUserId(order.getUserId());
		Integer orderPrice = orderMapper.selectByPriceSum(orderID.getOrderNum());
		orderID.setPrice(orderPrice);
		orderMapper.updateByPrice(orderID);
		// ?????????????????????????????? ??????orderMapper.updateByPrice(orderID);?????????
		orderMapper.updateByExampleOrder(orderID.getOrderNum());

		orderHistory.setOrderNum(orderID.getOrderNum());
		orderHistory.setUpdateUserId(order.getUserId());
		// ???????????? ?????????
		orderHistory.setStatus(1);
		orderHistory.setNote(1);
		orderHistoryMapper.insert(orderHistory);
		return orderID.getOrderNum();
	}

	/**
	 * ??????????????????????????????
	 * 
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> getOrderHistoryManage(PageInformation pageInfo) throws Exception {
		OrderHistory example = new OrderHistory();
		int pageCount = orderHistoryMapper.selectByHistoryCount();
		List<Order> listOrder = pagingTool.PagingData("com.sybinal.shop.mapper.OrderHistoryMapper.selectByHistoryList",
				example,
				(Integer.parseInt(pageInfo.getiDisplayStart()) / Integer.parseInt(pageInfo.getiDisplayLength()) + 1),
				Integer.parseInt(pageInfo.getiDisplayLength()));
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("sEcho", pageInfo.getsEcho());
		datas.put("iTotalRecords", pageCount);
		datas.put("iTotalDisplayRecords", pageCount);
		datas.put("aaData", listOrder);
		return datas;
	}

	/**
	 * ??????????????????????????????
	 * 
	 * @throws Exception
	 */
	@Override
	public List<OrderHistory> getOrderHistoryManage(Order order) {
		OrderHistoryExample example = new OrderHistoryExample();
		com.sybinal.shop.model.OrderHistoryExample.Criteria criteria = example.createCriteria();
		criteria.andOrderNumEqualTo(order.getOrderNum());
		return orderHistoryMapper.selectByExample(example);
	}

	/**
	 * ????????????????????????
	 * 
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> getOrderManage(PageInformation pageInfo, Order order) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		OrderExample example = new OrderExample();
		Criteria criteria = example.createCriteria();

		// price >=
		if (!StringUtils.isEmpty(order.getStartPrice())) {
			criteria.andPriceGreaterThanOrEqualTo(Integer.parseInt(order.getStartPrice()));
		}
		// price <=
		if (!StringUtils.isEmpty(order.getEndPrice())) {
			criteria.andPriceLessThanOrEqualTo(Integer.parseInt(order.getEndPrice()));
		}

		// ??????????????????
		if (order.getStatus() != null) {
			criteria.andStatusEqualTo(order.getStatus());
		}
		// ??????????????????
		if (!StringUtils.isEmpty(order.getOrderNum())) {
			criteria.andOrderNumEqualTo(order.getOrderNum());
		}
		// ????????????????????????
		if (!StringUtils.isEmpty(order.getPaymentFlag())) {
			criteria.andPaymentFlagEqualTo(order.getPaymentFlag());
		}
		// ????????????????????????
		if (!StringUtils.isEmpty(order.getStartDate())) {
			criteria.andCreateTimeGreaterThanOrEqualTo(sdf.parse(order.getStartDate() + " 00:00:00"));
		}
		// ????????????????????????
		if (!StringUtils.isEmpty(order.getEndDate())) {
			criteria.andCreateTimeLessThanOrEqualTo(sdf.parse(order.getEndDate() + " 23:59:59"));
		}
		// ????????????id??????
		// if (!StringUtils.isEmpty(order.getUserId()) &&
		// !StringUtils.isEmpty(order.getType())) {
		criteria.andTypeEqualTo(0);
		example.setDistinct(true);
		int pageCount = orderMapper.countByExample(example);
		List<Order> listOrder = pagingTool.PagingData("com.sybinal.shop.mapper.OrderMapper.selectByExample", example,
				(Integer.parseInt(pageInfo.getiDisplayStart()) / Integer.parseInt(pageInfo.getiDisplayLength()) + 1),
				Integer.parseInt(pageInfo.getiDisplayLength()));

		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("sEcho", pageInfo.getsEcho());
		datas.put("iTotalRecords", pageCount);
		datas.put("iTotalDisplayRecords", pageCount);
		datas.put("aaData", listOrder);

		return datas;
	}

	@Override
	public Order getOrderByUserId(Integer userId) throws Exception {
		OrderItemExample example = new OrderItemExample();
		Order order = new Order();
		com.sybinal.shop.model.OrderItemExample.Criteria criteria = example.createCriteria();
		criteria.andUserI1dTEqualTo(userId);
		criteria.andTypeEqualTo(1);
		List<OrderItem> listOrderItem = orderItemMapper.selectByExample(example);
		order.setOrderItemList(listOrderItem);
		return order;
	}

	// ?????????????????????
	@Override
	public Order getOrderItemData(Order order) {
		List<OrderItem> listOrderItem = null;
		OrderItemExample example = new OrderItemExample();
		com.sybinal.shop.model.OrderItemExample.Criteria criteria = example.createCriteria();
		if (!StringUtils.isEmpty(order.getUserId())) {
			order = orderMapper.selectByPrimaryKey(order.getOrderNum());
			if (order == null) {
				return order;
			}
			criteria.andUserI1dTEqualTo(order.getUserId());
			criteria.andOrderNumT1EqualTo(order.getOrderNum());
			criteria.andTypeEqualTo(order.getType());
			listOrderItem = new ArrayList<>();
			listOrderItem = orderItemMapper.selectByExample(example);
			order.setOrderItemList(listOrderItem);
			LogisticsExample exampleL = new LogisticsExample();
			com.sybinal.shop.model.LogisticsExample.Criteria criteriaL = exampleL.createCriteria();
			criteriaL.andOrderNumEqualTo(order.getOrderNum());
			List<Logistics> logisticsList = logisticsMapper.selectByExample(exampleL);
			order.setLogisticsList(logisticsList);

		}
		return order;
	}

	@Override
	@Transactional
	public void saveLogistics(Logistics logistics) {
		OrderHistory orderHistory = new OrderHistory();
		LogisticsExample example = new LogisticsExample();
		com.sybinal.shop.model.LogisticsExample.Criteria criteriaL = example.createCriteria();
		criteriaL.andOrderNumEqualTo(logistics.getOrderNum());
		Order order = orderMapper.selectByPrimaryKey(logistics.getOrderNum());
		// ??????????????????
		orderHistory.setOrderNum(order.getOrderNum());
		orderHistory.setStatus(logistics.getState());
		orderHistory.setNote(logistics.getState());
		// ??????userid
		UserExample userExample = new UserExample();
		com.sybinal.shop.model.UserExample.Criteria criteriaUser = userExample.createCriteria();
		criteriaUser.andUserNameEqualTo(logistics.getUserName());
		List<User> userList = userMapper.selectByExample(userExample);
		orderHistory.setUpdateUserId(userList.get(0).getId());
		// ??????????????????
		order.setStatus(logistics.getState());
		// ??????????????????????????????
		logistics.setContactAddress(order.getContactAddress());
		logistics.setContactMobile(order.getContactMobile());
		logistics.setContactName(order.getContactName());
		logistics.setLogisticsNum(UUID.randomUUID().toString().replace("-", ""));
		logistics.setState(logistics.getState());
		if (logistics.getState() == 2) {
			logisticsMapper.insert(logistics);
		} else {
			logisticsMapper.updateByPrimaryOrderNum(logistics);
		}
		orderMapper.updateByPrimaryKeySelective(order);
		orderHistoryMapper.insert(orderHistory);
	}

	@Override
	public Map<String, List<String>> getOrderDate(Map<String, Object> reqMap) {
		String beginDate = reqMap.get("beginDate").toString();
		beginDate=beginDate.substring(0, 7)+"-01";
		String endDate = reqMap.get("endDate").toString();
		endDate=endDate.substring(0, 7)+"-01";
		List<String> listCount = new ArrayList<>();
		List<String> listDate = new ArrayList<>();
		List<String> listPrice = new ArrayList<>();
		List<Map<String, Object>> orderData = orderMapper.getOrderDate(beginDate, endDate);
		if (orderData != null) {
			for (Map<String, Object> map : orderData) {
				listDate.add(map.get("date").toString());
				listCount.add(map.get("count").toString());
				listPrice.add(map.get("price").toString());
			}
		}
		Map<String, List<String>> resultMap = new HashMap<>();
		resultMap.put("count", listCount);
		resultMap.put("date", listDate);
		resultMap.put("price", listPrice);
		return resultMap;
	}

	@Override
	public int checkOrderIsPayed(String orderNum) {
		OrderExample example=new OrderExample();
		Criteria criteria=example.createCriteria();
		criteria.andOrderNumEqualTo(orderNum);
		List<Order> orderList = orderMapper.selectByExample(example);
		return orderList.get(0).getPaymentFlag();
	}

}