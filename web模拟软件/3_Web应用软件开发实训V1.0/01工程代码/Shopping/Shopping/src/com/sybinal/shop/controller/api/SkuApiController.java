package com.sybinal.shop.controller.api;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sybinal.shop.common.ApiResponseEnum;
import com.sybinal.shop.common.ApiResponseObject;
import com.sybinal.shop.service.catalog.SkuService;

@RestController
@RequestMapping("api/v1")
public class SkuApiController extends AbstractApiController {

	@Autowired
	SkuService skuService;

	@RequestMapping(value = "catalog/product/sku/list/{productId}", method = RequestMethod.GET, headers = "Accept=application/json")
	public ApiResponseObject getSkuDetailsList(@PathVariable("productId") int productId) {
		Map<String, Object> reqMap = new HashMap<String, Object>();
		reqMap.put("productId", productId);
		return reponseJSON(ApiResponseEnum.SUCCESS.getCode(), ApiResponseEnum.SUCCESS.getName(), skuService.getSkuDetailsList(reqMap));
	}
}
