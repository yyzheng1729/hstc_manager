<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 引入头部公共模块 -->
<%@include file="../public/head.jspf"%>
<title>收藏列表</title>
</head>
<body>
	<nav class="breadcrumb">
	    <i class="Hui-iconfont">&#xe67f;</i>首页
	    <span class="c-gray en">&gt;</span>收藏管理
	    <span class="c-gray en">&gt;</span>收藏列表
	    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新">
	        <i class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
	    <div class="mt-5">
	        <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
	            <thead>
		            <tr>
						<th scope="col" colspan="5">收藏列表</th>
					</tr>
	                <tr class="text-c">
	                    <th width="80">收藏编号</th>
	                    <th width="80">用户微信昵称</th>
	                    <th width="150">招聘信息标题</th>
	                    <th width="80">操作</th></tr>
	            </thead>
	            <tbody id="tbody"></tbody>
	            <tfoot>
			      	<tr>
				        <td colspan="11"><div class="box" id="box"></div></td></td>
				    </tr>
			     </tfoot>
	        </table>
	    </div>
	</div>
	
	<!-- 引入底部公共模块 -->
	<%@include file="../public/foot.jspf"%>
	
	<!--请在下方写此页面业务相关的脚本-->
	
	<script type="text/javascript">
		
		$(function(){
			loading(1);
		});
		
		function loading(pagenum){
			$.ajax({
				type:"POST",
				url:"/hstc_manage/display_collection",
				dataType:"json",
				data:{
					pagenum:pagenum
				},
				success:function(data){
					/*totalData 总数据 totalPage 总页数*/
					/* pagenum == 1 的时候，才需要对分页插件进行初始化 */
					if( pagenum == 1){
						paging(data.totalData,data.totalPage,pagenum);
					}
					displayData(data.tCollect);
				},
				error:function(){
					alert("收藏列表信息获取失败！");
				}
			});
		}
		
		function paging(totalData,totalPage,pagenum){
			$('#box').paging({
		        initPageNo: pagenum, // 初始页码
		        totalPages: totalPage, //总页数
		        totalCount: '合计' + totalData + '条数据', // 条目总数
		        slideSpeed: 600, // 缓动速度 单位毫秒
		        jump: true, //是否支持跳转
		        callback: function(page) { 
		        	// 回调函数
		        }
		    });
		}
		
		function JumpToPage(pagenum){
			loading(pagenum);
		}
	
		function displayData(data){
			var str="";
			var tbody = window.document.getElementById("tbody");
			for( i in data ){	
				str += '<tr class="text-c">'+
				       '<td>'+data[i].collectId+'</td>'+
				       '<td>'+data[i].tUser.nickname+'</td>'+
				       '<td>'+data[i].tRecruitment.title+'</td>'+
				       '<td class="f-14 td-manage">'+
				       '<a style="text-decoration:none" class="ml-5" onclick="del(this,'+data[i].collectId+')" href="javascript:;" title="删除"><i style="font-size:25px;" class="Hui-iconfont">&#xe6e2;</i></a>'+
				       '</td>'+
				       '</tr>';
			}
			tbody.innerHTML = str;
		}
		
		/*招聘信息-删除*/
		function del(obj,collectId) {
		    layer.confirm('确认要删除吗？',
		    function(index){
		        $.ajax({
		            type: 'POST',
		            url: '/hstc_manage/deleteByCollectId',
		            dataType: 'json',
		            data:{
		            	collectId:collectId
		            },
		            success: function(data) {
		                $(obj).parents("tr").remove();
		                layer.msg('已删除!', {
		                    icon: 1,
		                    time: 1000
		                });
		            },
		            error: function(data) {
		            	layer.msg('删除失败!', {
		                    icon: 1,
		                    time: 1000
		                });
		            },
		        });
		    });
		}
	</script>
</body>
</html>