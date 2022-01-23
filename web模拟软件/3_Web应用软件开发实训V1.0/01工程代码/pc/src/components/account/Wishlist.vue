<template>
  <div id="app-content">
			<section class="page-header page-header-xs">
			<div class="container">

				<h1>个人中心</h1>

				<!-- breadcrumbs -->

        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item>个人中心</el-breadcrumb-item>
          <el-breadcrumb-item>我的收藏</el-breadcrumb-item>

        </el-breadcrumb>
				<!-- /breadcrumbs -->

				<!-- page tabs -->
				<ul class="page-header-tabs list-inline">
					<li><a @click="goto('/account/order/list','OrderList')">我的订单</a></li>
					<li><a  @click="goto('/account/contact/list','ContactList')">常用联系人</a></li>
					<li class="active"><a>我的收藏</a></li>
					<li><a @click="goto('/account/setting','UserSetting')">个人设置</a></li>
					<li><a @click="goto('/account/ewallet','EWallet')">充值</a></li>
				</ul>
				<!-- /page tabs -->
			</div>
		</section>
		<section style="padding-top: 25px">
			<div class="container">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">个人收藏</h2>
					</div>
					<table class="table" v-if="wishlistPage&&wishlistPage.wishlist.length>0">
						<thead>
							<tr>
								<th>商品名称</th>
								<th class="text-center">市场价格</th>
								<th class="text-center">店内价格</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="(value,index) in wishlistPage.wishlist">
								<td>
									<img class="weui-media-box__thumb" style="width: 65px; height: 65px" v-bind:src="API.BASE_SERVER_URL+value.product.defaultImg" >
									{{value.product.name}}
								</td>
								<td class="text-center">
									<span class="line-through">
										￥{{(value.product.price / 100).toFixed(1)}}
									</span>
								</td>
								<td class="text-center">￥{{(value.product.shopPrice / 100).toFixed(1)}}</td>
								<td class="text-center">
									<a @click="deleteWish(value.id)">删除收藏</a>
									<a @click="goto('./product','Product',value.productId)">查看商品</a>
								</td>
							</tr>
						</tbody>
						</table>
						<fieldset class="padding-40 " v-else>
							<div class="row">
								<h4>暂无数据！</h4>
							</div>
						</fieldset>
						<div id="bootpag" class="pull-right">
							<ul class="pagination bootpag">
								<li data-lp="1" class="prev disabled"><a>&lt;</a></li>
								<li data-lp="1" class="active"><a >1</a></li>
								<li data-lp="1" class="next"><a >&gt;</a></li>
							</ul>
						</div>
				</div>
			</div>
		</section>

		</div>
</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
		wishlistPage:null
    }
  },
  created(){
	  this.getWishListPage(1);
  },
  methods:{
	  	getWishListPage(currentPage){
			var vm = this
			var user = vm.Storage.Local.get('User')
			if(user&&currentPage){
				var userId = user.id;
				$.ajax({
					url:vm.API.API_URL_CUSTOMER_WISHLIST+'/'+currentPage,
					type:'POST',
					data:{
						'userId':userId
					},
					dataType:'json',
					success:function(response){
						if(response.errorCode==0&&response.data!=null){
							vm.wishlistPage = response.data
						}
					},
					error:function(err){
						vm.Toastr.error('网络超时！')
						console.log(JSON.stringify(err))
					}
				})
		  	}
		},
		deleteWish(wishlisId){
			var vm = this
			var user = vm.Storage.Local.get('User')
		  	if(user&&wishlisId){
				var userId = user.id;
				$.ajax({
					url:vm.API.API_URL_CUSTOMER_REMOVE_WISHLIST,
					type:'POST',
					data:{
						'userId':userId,
						'wishlisId':wishlisId
					},
					dataType:'json',
					success:function(response){
						if(response.errorCode==0&&response.data){
							vm.Toastr.success('删除成功！')
							vm.getWishListPage(1)
						}
					},
					error:function(err){
						vm.Toastr.error('网络超时！')
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
			var params={
				id:val
			}
			this.Storage.Session.set("data",params)
		}
  }
}
</script>

<style scoped>
.table>tbody>tr>td{
	vertical-align: inherit;
}
</style>
