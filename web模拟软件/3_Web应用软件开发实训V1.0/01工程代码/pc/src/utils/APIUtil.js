var serverBase='http://127.0.0.1:8080/Shopping'
var v1 = serverBase +'/api/v1/'
export default {
    BASE_SERVER_URL: serverBase,
    /* 注册 */
    REGISTER: v1 + "register",
    /* 忘记密码 */
    API_URL_FORGET_PASSWORD: v1 + "forgetPassword",
    /* 登录url */
    API_URL_LOGIN: v1 + "login",
    /* 发送短信码 */
    SEND_SMS: v1 + "send/sms/msg",
    /* 获取用户信息 */
    API_URL_CUSTOMER: v1 + "get/user/info",
    /* 获取用户基本信息 */
    API_URL_CUSTOMER_BASIC: v1 + "get/user/basic",
    /* 更新用户信息 */
    API_URL_UPDATE_CUSTOMER: v1 + "user/update/customer",
    /* 更新用户密码 */
    API_URL_CHANGE_PASSWORD: v1 + "user/change/password",
    /* 获取用户心愿单信息 */
    API_URL_CUSTOMER_WISHLIST: v1 + "user/wishlist",
    /* 删除用户心愿单 */
    API_URL_CUSTOMER_REMOVE_WISHLIST: v1 + "user/remove/wishlist",
    /* 新增用户心愿单信息 */
    API_URL_CUSTOMER_ADD_WISHLIST: v1 + "user/add/wishlist",
    /* 获取用户订单列表 */
    API_URL_ORDERS: v1 + "user/orders/list",
    /* 获取用户订单详细 */
    API_URL_ORDER_DETAIL: v1 + "user/orders/detail",
    /* 商品分类数据 */
    API_URL_CATEGORY: v1 + "catalog/category",
    /* 商品分类数据 */
    API_URL_CATEGORY_CONDITION: v1 + "catalog/category/condition",
    /* 商品分类数据 */
    API_URL_CATEGORY_ALL: v1 + "catalog/all",
    /* 添加商品评论 */
    API_URL_CATALOG_ADD_REVIEW: v1 + "catalog/product/add/review",
    /* 获取商品评论 */
    API_URL_CATALOG_SHOW_REVIEW: v1 + "catalog/product/reviews",
    /* 查询商品 */
    API_URL_CATALOG_INDEX_PRODUCTS: v1 + "catalog/category/product",
    /* 获取分类商品 */
    API_URL_CATALOG_PRODUCT: v1 + "catalog/product",
    /* 查询商品 */
    API_URL_CATALOG_SEARCH_PRODUCTS: v1 + "catalog/search/product",
    /* 查询热销商品 */
    API_URL_CATALOG_PRODUCTS_HOT: v1 + "catalog/product",
    /* 查询商品详情 */
    API_URL_CATALOG_PRODUCT_DETAILS: v1 + "catalog/product/details",
    /* 查询商品Option sku */
    API_URL_CATALOG_PRODUCT_SKU: v1 + "catalog/product/sku/list",
    /* 查询商品Option详情 */
    API_URL_CATALOG_PRODUCT_OPTION: v1 + "catalog/product/option/details",
    /* 获取购物车 */
    API_URL_CART: v1 + "cart",
    /* 新增购物车 */
    API_URL_CART_ADD: v1 + "cart/add",
    /* 移除购物车 */
    API_URL_CART_ITEMS_REMOVE: v1 + "cart/items/remove",
    /* 更新购物车 */
    API_URL_CART_ITEMS_UPDATE: v1 + "cart/items/update",
    /* 移除全部购物车 */
    API_URL_CART_ITEMS_REMOVEALL: v1 + "cart/items/removeall",
    /* 签出购物车准备支付 */
    API_URL_PAY_ADDPAYMENT: v1 + "/cart/checkout/addPayMent",
    /* 购物车数量 */
    API_URL_CART_COUNT: v1 + "cart/count",
    /* 添加常用收货地址 */
    API_URL_CONTECT_ADD: v1 + "user/add/contect",
    /* 删除常用收货地址 */
    API_URL_CONTECT_REMOVE: v1 + "user/remove/contect",
    /* 修改常用收货地址 */
    API_URL_CONTECT_UPDATE: v1 + "user/update/contect",
    /* 查询常用收货地址 */
    API_URL_CONTECT: v1 + "contect",
    /* 查询常用收货地址 */
    API_URL_CONTECT_DEFAULT: v1 + "user/contect/default",
    /* 支付订单*/
    API_URL_ORDER_PAYMENT: v1 + "order/PayMent",
    /* 密码找回*/
    API_URL_USER_RECOVERY: v1 + "/user/recovery/password",
    /* 获取电子钱包金额初始值*/
    API_URL_EWALLET_DEFAULT: v1 + "ewallet/defalutValue",
    /* 获取用户电子钱包余额*/
    API_URL_CUSTOMER_Account: v1 + "/account/userAccount",
    /* 用户充值到电子钱包中*/
    API_URL_CUSTOMER_Recharge_Account: v1 + "account/recharge",
    /* 用户利用电子钱包进行支付*/
    API_URL_CUSTOMER_Pay_Order: v1 + "/account/payOrder",

    API_CHECK_ORDER:v1+'order/check'
}
