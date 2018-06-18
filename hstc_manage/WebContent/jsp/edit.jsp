<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 引入头部公共模块 -->
<%@include file="../public/head.jspf"%>
<!-- 引入副文本编辑器相关文件 -->
<%@include file="../public/kindeditor.jspf"%>
<title>编辑招聘信息</title>
</head>
<body>

	<!-- 遮掩层 -->
	<div class="modal" id="modal"></div>
	
	<!-- 更新信息时页面加载动画的初始化 -->
	<div class="sk-three-bounce" id="sk-three-bounce">
        <div class="sk-child sk-bounce1"></div>
        <div class="sk-child sk-bounce2"></div>
        <div class="sk-child sk-bounce3"></div>
    </div>
    
	<article class="page-container">
	    <form class="form form-horizontal" id="form-admin-edit" name="myform" >
	    	<input type="hidden" id="id" name="id">
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">
	                <span class="c-red">*</span>招聘信息标题：</label>
	            <div class="formControls col-xs-8 col-sm-8">
	                <input type="text" class="input-text" autocomplete="off" id="title" name="title"></div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">
	                <span class="c-red">*</span>作者：</label>
	            <div class="formControls col-xs-8 col-sm-8">
	                <input type="text" class="input-text" autocomplete="off" id="author" name="author" ></div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">
	                <span class="c-red">*</span>学院分类：</label>
	            <div class="formControls col-xs-8 col-sm-8">
	                <span class="select-box" style="width:185px;">
	                    <select class="select" id="college" name="college" size="1"></select>
	                </span>
	            </div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">
	                <span class="c-red">*</span>招聘信息类型：</label>
	            <div class="formControls col-xs-8 col-sm-8">
	                <span class="select-box" style="width:185px;">
	                    <select class="select" id="type" name="type" size="1">
	                        <option value="首页轮播">首页轮播</option>
	                        <option value="普通信息">普通信息</option></select>
	                </span>
	            </div>
	        </div>
	        <input type="hidden" id="imgUrl" name="imgUrl">
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">
	                <span class="c-red">*</span>缩略图：</label>
	            <div class="formControls col-xs-8 col-sm-8" style="width:185px;">
	            	<!-- <image src="https://hstc-image-1256231252.cos.ap-guangzhou.myqcloud.com/test/1.jpg" style="width:300prx;height:200px;"></image> -->
	            	<image id="img" style="width:300prx;height:200px;"></image>
	            </div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">招聘信息详情：</label>
	            <div class="formControls col-xs-8 col-sm-8">
	                <textarea name="details" id="details" class="textarea" style="height:300px;width:100%;"></textarea>
				</div>
	        </div>
	        <div class="row cl">
	            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
	                <input class="btn btn-primary  btn-lg radius" type="submit" value="&nbsp;&nbsp;提&nbsp;&nbsp;交&nbsp;&nbsp;"></div>
	        </div>
	    </form>

	</article>
		
	<!-- 引入底部公共模块 -->
	<%@include file="../public/foot.jspf"%>
	
	<!--请在下方写此页面业务相关的脚本-->
	
	<!-- 引入表单验证模块 -->
	<%@include file="../public/validation.jspf"%>
	
	<!--与本页面动态处理有关的 js 操作-->
	<script>
		/*定义图像存储在对应服务器的对象存储空间的路径*/
		var imgPath = "https://hstc-image-1256231252.cos.ap-guangzhou.myqcloud.com/";
		
		/* 页面初始化时，默认加载效果隐藏*/
		$("#sk-three-bounce").hide();
		/* 页面初始化时，默认加载效果隐藏*/
		$("#modal").hide();
		
		$(function(){
			/*获取  edit.jsp?id=111 的参数 id 的值*/
			var id = ${param.id};
			$.ajax({
				type:"POST",
				url:"/hstc_manage/queryById",
				data:{
					id:id
				},
				success:function(data){
					console.log(data);
					$("#id").val(data.tRecruitment.id);//隐藏输入框，存放当前招聘信息 id
					$("#title").val(data.tRecruitment.title);
					$("#author").val(data.tRecruitment.author);
					$("#details").val(data.tRecruitment.details);
					$("#imgUrl").val(data.tRecruitment.litimg);//隐藏输入框，存放当前招聘信息的缩略图路径
					$("#img").attr("src",imgPath+data.tRecruitment.litimg);
					$("#type option[value='"+data.tRecruitment.type+"']").attr("selected","selected");
					isCollege(data.collegeName);
				},
				error:function(){
					layer.msg('获取当前的招聘信息详情失败!', {
		                icon: 1,
		                time: 1000
		            });
				}
			});
		});
		
		//获取学院分类信息，并且动态生成 option 选项
		//通过传过来的 collegeName 判断当前的招聘信息是属于哪个学院分类，并选中
		function isCollege(collegeName){
			$.ajax({
				type:"POST",
				url:"/hstc_manage/college",
				data:{},
				success:function(data){
					$("#college option").remove();
					for( i in data ){
						if(data[i].collegeName == collegeName){
							$("#college").append("<option value='"+data[i].collegeId+"' selected='selected'>"+data[i].collegeName+"</option>");
						}else{
							$("#college").append("<option value='"+data[i].collegeId+"'>"+data[i].collegeName+"</option>");
						}
					}
				},
				error:function(){
					layer.msg('获取学院分类列表失败!', {
		                icon: 1,
		                time: 1000
		            });
				}
			});
		};
		
		$("#form-admin-edit").validate({
		    onkeyup: false,
		    focusCleanup: true,
		    success: "valid",
		    submitHandler: function(form) {
		    	$("#sk-three-bounce").show();
		    	$("#modal").show();
		        $(form).ajaxSubmit({
		            type: 'post',
		            url: "/hstc_manage/edit",
		            success: function(data) {
		            	if(data == "true"){
		            		$("#sk-three-bounce").hide();
		            		$("#modal").hide();
		            		layer.msg('修改成功!', {
			                    icon: 1,
			                    time: 1500
			                },function(){
			                	window.parent.location.replace("list.jsp");
			                });
		            		
		            	}
		            },
		            error: function(XmlHttpRequest, textStatus, errorThrown) {
		            	$("#sk-three-bounce").hide();
		            	$("#modal").hide();
		                layer.msg('修改招聘信息error!', {
		                    icon: 1,
		                    time: 1000
		                });
		            }
		        });
		    }
		});
	</script>
</body>
</html>