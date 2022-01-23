<template>
  <div id="app-content">
			<section class="page-header page-header-xs">
			<div class="container">

				<h1>个人中心</h1>

				<!-- breadcrumbs -->
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item>个人中心</el-breadcrumb-item>
          <el-breadcrumb-item>常用联系人</el-breadcrumb-item>

        </el-breadcrumb>
				<!-- /breadcrumbs -->

				<!-- page tabs -->
				<ul class="page-header-tabs list-inline">
					<li><a @click="goto('/account/order/list','OrderList')">我的订单</a></li>
					<li  class="active"><a>常用联系人</a></li>
					<li><a @click="goto('/account/wishlist','WishList')">我的收藏</a></li>
					<li><a @click="goto('/account/setting','UserSetting')">个人设置</a></li>
					<li><a @click="goto('/account/ewallet','EWallet')">充值</a></li>
				</ul>
				<!-- /page tabs -->
			</div>
		</section>
		<section>
			<div class="container">

				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">常用联系人</h2>
					</div>


					<table class="table contact">
						<thead>
							<tr>
								<th>默认联系人</th>
								<th>联系人姓名</th>
								<th>联系人电话</th>
								<th>联系人地址</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
								<template v-if="accountList!=null&&accountList.data.legnth!=0">
									<tr v-for="(z,index) in accountList.data">
										<td v-if="z.contactFlag==1"><input type="radio" name="contect" checked="checked" @click="doOptions(API.API_URL_CONTECT_DEFAULT,z.id,'设置成功！')" /></td>
										<td v-else><input type="radio" name="contect"  @click="doOptions(API.API_URL_CONTECT_DEFAULT,z.id,'设置成功！')"/></td>
										<td>{{z.name}}</td>
										<td>{{z.mobile}}</td>
										<td>{{z.address}}</td>
										<td>
											<a @click="changeById(z.id,z.name,z.mobile,z.address)">编辑</a>
											<a @click="doOptions(API.API_URL_CONTECT_REMOVE,z.id,'删除成功')">删除</a>
										</td>
									</tr>
								</template>
						</tbody>
					</table>
						<div class="panel-body">
								<fieldset class="margin-top-10 ">
									<div class="row">
										<div class="col-md-6 col-sm-6">
											<input type="hidden" name="id">
											<label for="billing_firstname">姓名&nbsp;<span class="required">*</span></label>
                      <el-input id="billing_firstname" v-model="name" type="text"  maxlength="50"/>
											<div class="erro">{{tips.nameMsg}}</div>
										</div>
										<div class="col-md-6 col-sm-6">
											<label for="billing_lastname">电话&nbsp;<span class="required">*</span></label>
                      <el-input id="billing_lastname" v-model="mobile" type="text"  maxlength="11"/>
                      <div class="erro">{{tips.mobileMsg}}</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<label for="billing_address1">地址&nbsp;<span class="required">*</span></label>
                      <el-input id="billing_address1" v-model="address" type="text" placeholder="" maxlength="255"/>
                      <div class="erro">{{tips.addressMsg}}</div>
										</div>
									</div>
                  <el-button  @click="addContact" type="primary" class="pull-right margin-top-20" icon="el-icon-edit">保存联系人</el-button>
								</fieldset>
						</div>
				</div>
			</div>
		</section>
		</div>
</template>

<script>
export default {
  name: 'concatList',
  data () {
    return {
		accountList:null,
		name:null,
		mobile:null,
		address:null,
		editFlag:false,
		editId:null,
		tips:{
			nameMsg:'',
			mobileMsg:'',
			addressMsg:''
		}
    }
  },
  created(){
	  this.getAccountList()
  },
  methods:{
	  	getAccountList(){
			var vm = this
			var user = vm.Storage.Local.get('User')
			if(user){
				var userId = user.id;
				$.ajax({
					url:vm.API.API_URL_CONTECT,
					type:'POST',
					data:{
						'userId':userId
					},
					dataType:'json',
					success:function(response){
						if(response.errorCode==0&&response.data!=null){
							vm.accountList = response.data
						}
					},
					error:function(err){
						vm.Toastr.error('网络超时！')
						console.log(JSON.stringify(err))
					}
				})
		  	}
		},
		changeById(id,name,mobile,address){
			this.editId = id
			this.name = name
			this.mobile = mobile
			this.address = address
			this.editFlag = true
		},
		addContact(){
				var url = this.API.API_URL_CONTECT_ADD
				var msg1 = '添加成功!'
				var msg2 = '联系人至多添加5人!'
				if(this.editFlag){
					url = this.API.API_URL_CONTECT_UPDATE
					msg1 = '修改成功!'
					msg2 = '修改失败!'
				}
				var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
			  	var vm = this
				if(!vm.name&&!vm.mobile&&!vm.address){
					vm.tips.nameMsg='请输入用户名'
					vm.tips.mobileMsg='请输入手机号码'
					vm.tips.addressMsg='请输入地址'
			  	}else if(!vm.name){
				  	vm.tips.mobileMsg=''
					vm.tips.addressMsg=''
				  	vm.tips.nameMsg='请输入用户名'
			  	}else if(!vm.mobile){
				  	vm.tips.nameMsg=''
					vm.tips.addressMsg=''
					vm.tips.mobileMsg='请输入手机号码'
			  	}else if(!mobile.test(vm.mobile)||vm.mobile.length!=11){
					vm.tips.nameMsg=''
					vm.tips.addressMsg=''
					vm.tips.mobileMsg='请输入正确的手机号码'
				}else if(!vm.address){
				  	vm.tips.nameMsg=''
					vm.tips.mobileMsg=''
				  	vm.tips.addressMsg='请输入地址'
			  	}else{
					vm.tips.nameMsg=''
					vm.tips.mobileMsg=''
					vm.tips.addressMsg=''
					var user = vm.Storage.Local.get('User')
					if(user){
						var userId = user.id;
						$.ajax({
							url:url,
							type:'POST',
							data:{
								'id':vm.editId,
								'userId':userId,
								'name':vm.name,
								'mobile':vm.mobile,
								'address':vm.address
							},
							dataType:'json',
							success:function(response){
								if(response.errorCode==0){
									if(response.data){
										vm.getAccountList()
										vm.name=''
										vm.mobile=''
										vm.address=''
										vm.Toastr.success(msg1);
										if(vm.editFlag){
											vm.editId = null
											vm.editFlag = false
										}
									}else{
										vm.Toastr.error(msg2);
									}
								}
							},
							error:function(err){
								vm.Toastr.error('网络超时！')
								console.log(JSON.stringify(err))
							}
						})
					}
			  }

		},
		doOptions(path,id,msg){
			var vm = this
			var user = vm.Storage.Local.get('User')
			if(user){
				var userId = user.id;
				if(msg=='删除成功'&&vm.editFlag&&vm.editId==id){
					vm.Toastr.error("联系人编辑中,不允许删除")
				}else{
					if(userId&&id){
						$.ajax({
							url:path,
							type:'POST',
								data:{
									'userId':userId,
									'id':id
								},
								dataType:'json',
								success:function(response){
									if(response.errorCode==0&&response.data){
										vm.Toastr.success(msg);
										vm.getAccountList()
									}
								},
								error:function(err){
									vm.Toastr.error('网络超时！')
									console.log(JSON.stringify(err))
								}
					})
					}
				}
			}
		},
	  	goto(path,name,val){
			this.$router.push({
				path:path,
				name:name
			})
		}
  }
}
</script>

<style scoped>

.contact {
    margin-top: 0px !important;
	border-bottom: 1px solid #ddd;
}
.erro,.required{
	color: red
}
</style>
