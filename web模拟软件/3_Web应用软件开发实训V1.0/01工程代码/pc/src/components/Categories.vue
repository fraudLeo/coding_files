<template>
    <div id="app-content">
	<section class="page-header page-header-xs">
			<div class="container">
			</div>
		</section>
		<!-- /PAGE HEADER -->
		<!-- -->
		<section>
			<div class="container">
				<h1>所有分类</h1>
				<ul id="category">
					<li v-for="category in categoryList" style="margin-top: 30px">
            <a  @click="goto(category.id)">
              <el-tag type="primary">
                {{category.name}}
              </el-tag>
            </a>
					</li>
				</ul>

			</div>
		</section>
	</div>
</template>
<script>
export default {
    data(){
		return{
			categoryList:[],
		}
	},
	created:function(){
		this.loadCategoryList()
	},
	methods:{
		loadCategoryList(){
			var vm = this;
			$.ajax({
				url:vm.API.API_URL_CATEGORY_CONDITION,
				type:'GET',
				success:function(response){
					if(response.errorCode==0){
						vm.categoryList=response.data;
					}
				},
				error:function(err){
					console.log(JSON.stringify(err))
				}
			})
		},
		goto(val){
			this.$router.push({
				path:'/category',
				name:'Category'
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
#category {
	list-style:none;
}
#category li {
	float:left;
	width:100px;
	height:20px;
}
</style>
