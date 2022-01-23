<template>
    <div id="app-content">
        <section class="page-header page-header-xs">
			<div class="container">
				<h1>个人中心</h1>
                <!-- breadcrumbs -->
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item>个人中心</el-breadcrumb-item>
          <el-breadcrumb-item>订单明细</el-breadcrumb-item>
        </el-breadcrumb>
				<!-- /breadcrumbs -->
				<!-- page tabs -->
				<ul class="page-header-tabs list-inline">
					<li><a @click="goto('/account/order/list','OrderList')">我的订单</a></li>
					<li><a  @click="goto('/account/contact/list','ContactList')">常用联系人</a></li>
					<li><a @click="goto('/account/wishlist','WishList')">我的收藏</a></li>
					<li><a @click="goto('/account/setting','UserSetting')">个人设置</a></li>
					<li><a @click="goto('/account/ewallet','EWallet')">充值</a></li>
				</ul>
				<!-- /page tabs -->
			</div>
		</section>
		<section>
			<div class="container">
				<div class="panel panel-default" v-if="orderItem">
					<div class="panel-heading">
						<h2 class="panel-title">订单编号：{{orderItem.orderNum}}</h2>
					</div>
					<div class="panel-body">
						<div v-if="orderItem.status==0 || orderItem.status==null">订单状态：订单编辑中</div>
						<div v-else-if="orderItem.status==1">订单状态：已下单</div>
                        <div v-else-if="orderItem.status==2">订单状态：配送中</div>
                        <div v-else-if="orderItem.status==3">订单状态：配送完成</div>
                        <div v-else-if="orderItem.status==4">订单状态：订单取消</div>
						<div>联系人姓名：{{orderItem.contactName}}</div>
						<div>联系人电话：{{orderItem.contactMobile}}</div>
						<div>送货地址：{{orderItem.contactAddress}}</div>
						<div>订单金额：{{orderItem.price/100}}</div>
						<hr />
						<template v-if="orderItem.logisticsList.length>0">
                            <template v-for="logistic in orderItem.logisticsList">
                                <div v-bind:key="logistic.logisticsNum">物流单号：{{logistic.logisticsNum}}</div>
                                <div v-bind:key="logistic.companyName">物流公司：{{logistic.companyName}}</div>
                                <div v-bind:key="logistic.state">物流费用：(包邮)</div>
                                <div v-bind:key="logistic.state+'.'">物流状态：
                                    <template v-if="logistic.state==null || logistic.state==0">订单编辑中</template>
                                    <template v-else-if="logistic.state==1">已下单</template>
                                    <template v-else-if="logistic.state==2">配送中</template>
                                    <template v-else-if="logistic.state==3">配送完了</template>
                                    <template v-else-if="logistic.state==4">订单取消</template>
                                </div>
                                <div v-bind:key="logistic.timestamp">发货时间：{{logistic.timestamp}}</div>
                            </template>
						</template>
						</div>
						<table class="table">
							<thead>
								<tr>
									<th>商品</th>
									<th>选项</th>
									<th>单价</th>
									<th>数量</th>
									<th>合计金额</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(z,index) in orderItem.orderItemList">
									<td>
                                        <template v-for="product in z.productList">
                                            <div class="cart_img pull-left width-100 padding-10 text-left">
                                                <img v-bind:src="API.BASE_SERVER_URL+product.defaultImg" alt="无法显示图片" width="40"  />
									        </div>
                                            {{product.name}}
                                        </template>
                                    </td>
									<td>{{z.jsonData}}</td>
									<td>{{(z.price/100).toFixed(1)}}</td>
									<td>{{z.quantity}}</td>
									<td>{{(z.price*z.quantity/100).toFixed(1)}}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</section>
    </div>
</template>

<script>
export default {
    data(){
        return{
            orderItem:null
        }
    },
    created(){
        var data = this.Storage.Session.get("data");
        if(data){
            this.getOrderDetail(data.orderNum)
        }
    },
    methods:{
        getOrderDetail(orderNum){
            var vm = this
            var user = vm.Storage.Local.get('User')
		    if(user){
			    var userId = user.id;
                $.ajax({
                    url: vm.API.API_URL_ORDER_DETAIL,
                    type:'POST',
                    data:{
                        'userId':userId,
                        'type':0,
                        'orderNum':orderNum
                    },
                    dataType:'json',
                    success:function(response){
                        if(response.errorCode==0&&response.data){
                            vm.orderItem = response.data
                        }
                    },
                    error:function(err){
                        vm.Toastr.error("网络超时！")
                        console.log(JSON.stringify(err))
                    }
                })
            }
        },
        goto(path,name,val){
			this.$router.push({
				path:path,
				name:name
			})
			if(val){
				this.Storage.Session.set("data",{
					orderNum:val
				})
			}
		},
    }
}
</script>

<style scoped>
.table>tbody>tr>td{
	vertical-align: inherit;
}
</style>


