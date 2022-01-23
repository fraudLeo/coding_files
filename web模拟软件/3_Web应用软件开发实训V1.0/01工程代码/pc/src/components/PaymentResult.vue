<template>
	<div id="app-content">
		<section class="page-header page-header-xs">
			<div class="container">
				<h1>支付</h1>
				<ol class="breadcrumb">
					<li><a href="${root}/pc/index">首页</a></li>
					<li>支付</li>
				</ol>
			</div>
		</section>
		<!-- /PAGE HEADER -->
		<!-- 购物车 -->
		<section>
			<div class="container">
				<!-- /EMPTY CART -->
				<!-- CART -->
					<div class="row margin-top-10">
						<!-- LEFT -->
						<div class="col-lg-9 col-sm-8">
							<template v-if="payResult ==1">
								<strong style='font-size: 20px'>订单支付成功！</strong>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a style='font-size: 16px'@click="goto('/account/order/list','OrderList')">到个人中心查看订单>></a>
							</template>
							<template v-if="payResult ==-1">
								<strong style='font-size: 20px'>余额不足，订单支付失败！</strong>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a style='font-size: 16px' @click="goto('/account/ewallet','EWallet')">去充值>></a>
							</template>
						</div>
						<!-- RIGHT -->
						<div class="col-lg-3 col-sm-4"></div>
					</div>
			</div>
		</section>
	</div>
</template>

<script>
export default {
  name: 'Payment',
  data () {
    return {
	  payResult:-1
    }
  },
  created(){
	  this.payByEWallet()
  },
  methods:{
	  payByEWallet(){
		  	var vm = this
			var user = vm.Storage.Local.get('User')
			var totalPrice = vm.Storage.Session.get('TotalPrice')
			if(user&&totalPrice){
				var userId = user.id;
				$.ajax({						
					url: vm.API.API_URL_CUSTOMER_Pay_Order,
					type:'POST',
					data:{
						'userId':userId,
						'amount':-totalPrice
					},
					dataType:'json',
					success:function(response){
						if(response.errorCode==0){
							vm.payResult = response.data
							if(vm.payResult==1){
								vm.Storage.Session.remove('TotalPrice')
							}
						}
					},
					error:function(err){
						vm.Toastr.error("网络超时！")							
						console.log(JSON.stringify(err))
					}
				})
            }
	  },
	  goto(path,name){
			this.$router.push({
				path:path,
				name:name
			})
		},
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
