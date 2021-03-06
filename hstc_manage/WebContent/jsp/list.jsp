<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 引入头部公共模块 -->
<%@include file="../public/head.jspf"%>
<title>招聘信息列表</title>
</head>
<body>
	<nav class="breadcrumb">
	    <i class="Hui-iconfont">&#xe67f;</i>首页
	    <span class="c-gray en">&gt;</span>信息管理
	    <span class="c-gray en">&gt;</span>招聘信息列表
	    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新">
	        <i class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
	    <div class="cl pd-5 bg-1 bk-gray mt-20">
	        <span class="l">
	            <a class="btn btn-primary radius" data-title="添加新闻" data-href="${pageContext.request.contextPath}/jsp/add.jsp" onclick="Hui_admin_tab(this)" href="javascript:;">
	                <i class="Hui-iconfont">&#xe600;</i>添加招聘信息</a></span>
	    </div>
	    <div class="mt-20">
	        <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
	            <thead>
	            	<tr>
						<th scope="col" colspan="11">招聘信息列表</th>
					</tr>
	                <tr class="text-c">
	                    <th width="80">招聘信息编号</th>
	                    <th width="80">招聘信息标题</th>
	                    <th width="150">招聘信息展示图</th>
	                    <th width="80">招聘信息详情</th>
	                    <th width="80">发表时间</th>
	                    <th width="80">作者</th>
	                    <th width="80">学院分类</th>
	                    <th width="80">招聘信息类型</th>
	                    <th width="80">被投诉次数</th>
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
		/*定义图像存储在对应服务器的对象存储空间的路径*/
		var imgPath = "https://hstc-image-1254334144.cos.ap-guangzhou.myqcloud.com/";
		
		$(function(){
			loading(1);
		});
		
		function loading(pagenum){
			$.ajax({
				type:"POST",
				url:"/hstc_manage/displayAll",
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
					displayData(data.tRecruitment);
				},
				error:function(){
					alert("招聘信息获取失败！");
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
				var details = data[i].details;
				var details_new = details.substring(0,70)+"...";
				str += '<tr class="text-c">'+
				       '<td>'+data[i].id+'</td>'+
				       '<td>'+data[i].title+'</td>'+
				       '<td>'+'<img width="200" class="picture-thumb" src='+imgPath+data[i].litimg+'>'+'</td>'+
				       /* '<td class="td4">'+data[i].details+'</td>'+ */
				       '<td class="td4">'+details_new+'</td>'+
				       '<td>'+data[i].publishedTime+'</td>'+
				       '<td>'+data[i].author+'</td>'+
				       '<td>'+data[i].tCollege.collegeName+'</td>'+
				       '<td>'+data[i].type+'</td>'+
				       '<td>'+data[i].complaintCount+'</td>'+
				       '<td class="f-14 td-manage">'+
				       '<a style="text-decoration:none" class="ml-5" onClick="edit(\'招聘信息编辑\',\'edit.jsp\','+data[i].id+')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>'+
				       '<a style="text-decoration:none" class="ml-5" onclick="del(this,'+data[i].id+')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>'+
				       '</td>'+
				       '</tr>';
			}
			tbody.innerHTML = str;
		}
		
		/*招聘信息-编辑*/
		function edit(title, url, id, w, h) {
			var urlwith= url+"?id="+id;
			console.log(urlwith)
			layer_show(title,urlwith,w,h);
			/* 
		    var index = layer.open({
		        type: 2,
		        title: title,
		        content: url
		    });
		    layer.full(index); */
		}
		
		/*招聘信息-删除*/
		function del(obj,id) {
		    layer.confirm('确认要删除吗？',
		    function(index){
		        $.ajax({
		            type: 'POST',
		            url: '/hstc_manage/deleteById',
		            dataType: 'json',
		            data:{
		            	id:id
		            },
		            success: function(data) {
		                $(obj).parents("tr").remove();
		                layer.msg('已删除!', {
		                    icon: 1,
		                    time: 1000
		                });
		            },
		            error: function(data) {
		                console.log(data.msg);
		            },
		        });
		    });
		}
	</script>
</body>
</html>