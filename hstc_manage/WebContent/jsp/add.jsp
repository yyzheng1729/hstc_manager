<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 引入头部公共模块 -->
<%@include file="../public/head.jspf"%>
<!-- 引入副文本编辑器相关文件 -->
<%@include file="../public/kindeditor.jspf"%>
<title>添加招聘信息</title>
</head>
<body>
	<!-- 更新信息时页面加载动画的初始化 -->
	<div class="sk-three-bounce" id="sk-three-bounce">
        <div class="sk-child sk-bounce1"></div>
        <div class="sk-child sk-bounce2"></div>
        <div class="sk-child sk-bounce3"></div>
    </div>
    
	<nav class="breadcrumb">
	    <i class="Hui-iconfont">&#xe67f;</i>首页
	    <span class="c-gray en">&gt;</span>信息管理
	    <span class="c-gray en">&gt;</span>添加招聘信息
	    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新">
	        <i class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<article class="page-container">
	    <form class="form form-horizontal" id="form-admin-add" name="myform" enctype="multipart/form-data" >
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
	                <input type="text" class="input-text" autocomplete="off" id="author" name="author" value="小程序工作人员"></div>
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
	                    	<option value="普通信息">普通信息</option>
	                        <option value="首页轮播">首页轮播</option>
	                    </select>
	                </span>
	            </div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">
	                <span class="c-red">*</span>缩略图：</label>
	            <div class="formControls col-xs-8 col-sm-8" style="width:185px;">
	                <input type="file" id="litimg" name="file" autocomplete="off" class="input-text" multiple style="border:none;"></div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">招聘信息详情：</label>
	            <div class="formControls col-xs-8 col-sm-8">
	                <textarea name="details" class="textarea" style="height:500px;width:100%;"></textarea>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/add.js"></script> 
	<script>
		/* 页面初始化时，默认加载效果隐藏*/
		$("#sk-three-bounce").hide();
		
		//获取学院分类信息，并且动态生成 option 选项
		$(function(){
			$.ajax({
				type:"POST",
				url:"/hstc_manage/college",
				data:{},
				success:function(data){
					$("#college option").remove();
					for( i in data ){
						$("#college").append("<option value='"+data[i].collegeId+"'>"+data[i].collegeName+"</option>");
					}
				},
				error:function(){
					layer.msg('获取学院分类列表失败!', {
		                icon: 1,
		                time: 1000
		            });
				}
			});
		});
		
		/*上传数据到数据库*/
		$("#form-admin-add").validate({
		    rules: {
		    	title: {
		            required: true,
		            minlength: 4,
		            maxlength: 20
		        },
		        author: {
		            required: true,
		        },
		        litimg: {
		            required: true,
		        }
		    },
		    onkeyup: false,
		    focusCleanup: true,
		    success: "valid",
		    submitHandler: function(form) {
		    	$("#sk-three-bounce").show();
		        $(form).ajaxSubmit({
		            type: 'post',
		            url: "/hstc_manage/uploadImage?url=add",
		            success: function(data) {
		            	if(data == "true"){
		            		$("#sk-three-bounce").hide();
		            		layer.msg('添加招聘信息成功!', {
			                    icon: 1,
			                    time: 3000
			                });
		            		
		            	}
		            },
		            error: function(XmlHttpRequest, textStatus, errorThrown) {
		            	$("#sk-three-bounce").hide();
		                layer.msg('没有选择图片或者上传图片error!', {
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