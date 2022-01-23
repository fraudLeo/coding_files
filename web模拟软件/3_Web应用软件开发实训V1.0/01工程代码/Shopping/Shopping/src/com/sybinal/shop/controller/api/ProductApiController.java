package com.sybinal.shop.controller.api;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sybinal.shop.common.AjaxResult;
import com.sybinal.shop.common.ApiResponseEnum;
import com.sybinal.shop.common.ApiResponseObject;
import com.sybinal.shop.model.Comments;
import com.sybinal.shop.service.catalog.CommentsService;
import com.sybinal.shop.service.catalog.ProductService;

@RestController
@RequestMapping("api/v1")
public class ProductApiController extends AbstractApiController {

	@Autowired
	ProductService productService;
	
	@Autowired
	CommentsService commentsService;

	/**
	 * 获取分类商品
	 * 
	 * @return
	 */
	@RequestMapping(value = "catalog/product/{categoryId}", method = RequestMethod.GET, headers = "Accept=application/json")
	public ApiResponseObject searchProductByCategoryJSON(@PathVariable("categoryId") int categoryId ) {
		Map<String,Object> reqMap = new HashMap<String, Object>();
		reqMap.put("categoryId", categoryId);
		return this.reponseJSON(ApiResponseEnum.SUCCESS.getCode(), ApiResponseEnum.SUCCESS.getName(), productService.getProductByCategory(reqMap));
	}

	/**
	 * 查询商品
	 * 
	 * @return
	 */
	@RequestMapping(value = "catalog/search/product/{productName}/page/{currentPage}", method = RequestMethod.GET, headers = "Accept=application/json")
	public ApiResponseObject searchProductJSON(@PathVariable("productName") String productName,@PathVariable("currentPage") int currentPage) {
		Map<String,Object> reqMap = new HashMap<String,Object>();
		reqMap.put("productName", productName.trim());
		reqMap.put("currentPage", currentPage);
		return this.reponseJSON(ApiResponseEnum.SUCCESS.getCode(), ApiResponseEnum.SUCCESS.getName(), productService.getProductRelation(reqMap));
	}
	
	/**
	 * 查询商品
	 * 
	 * @return
	 */
	@RequestMapping(value = "catalog/product/{productId}/hot/{hot}/pagesize/{pageSize}", method = RequestMethod.GET, headers = "Accept=application/json")
	public ApiResponseObject searchProductByHot(@PathVariable("productId") int  productId,@PathVariable("hot") int  hot,@PathVariable("pageSize") int  pageSize) {
		Map<String,Object> reqMap = new HashMap<String,Object>();
		reqMap.put("productId", productId);
		reqMap.put("pageSize", pageSize);
		reqMap.put("hot", hot);
		return this.reponseJSON(ApiResponseEnum.SUCCESS.getCode(), ApiResponseEnum.SUCCESS.getName(), productService.getProduct(reqMap));
	}
	
	/**
	 * 商品详情页
	 * 
	 * @return
	 */
	@RequestMapping(value = "catalog/product/details/{productId}", method = RequestMethod.GET, headers = "Accept=application/json")
	public ApiResponseObject productDetails(@PathVariable("productId") int productId) {
		Map<String,Object> reqMap = new HashMap<String,Object>();
		reqMap.put("productId", productId);
		Object re = null;
		if ((re = productService.getProductDetailsById(reqMap)) != null)
			return this.reponseJSON(ApiResponseEnum.SUCCESS.getCode(), ApiResponseEnum.SUCCESS.getName(), re);
		return this.reponseJSON(ApiResponseEnum.ERROR_PARAM.getCode(), ApiResponseEnum.ERROR_PARAM.getName(), re);
	}

	/**
	 * 添加商品评论
	 * 
	 * @return
	 */
	@RequestMapping(value = "catalog/product/add/review", method = RequestMethod.POST, headers = "Accept=application/json")
	public ApiResponseObject addComments(Comments comments) {
		if (!commentsService.saveValidation(comments)) {
			return this.reponseJSON(ApiResponseEnum.ERROR_PARAM.getCode(), ApiResponseEnum.ERROR_PARAM.getName(), new AjaxResult(false));
		}
		commentsService.saveComments(comments);
		return this.reponseJSON(ApiResponseEnum.SUCCESS.getCode(), ApiResponseEnum.SUCCESS.getName(), new AjaxResult(true));
	}

	/**
	 * 获取商品评论
	 * 
	 * @return
	 */
	@RequestMapping(value = "catalog/product/reviews/{productId}", method = RequestMethod.GET, headers = "Accept=application/json")
	public ApiResponseObject getComments(@PathVariable("productId") int productId) {
		Map<String,Object> reqMap = new HashMap<String,Object>();
		reqMap.put("productId", productId);
		return this.reponseJSON(ApiResponseEnum.SUCCESS.getCode(), ApiResponseEnum.SUCCESS.getName(), commentsService.getCommentsByProductId(reqMap));
	}
	
}