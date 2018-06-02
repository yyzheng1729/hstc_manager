<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 引入头部公共模块 -->
<%@include file="../public/head.jspf"%>
<!-- 引入副文本编辑器相关文件 -->
<%@include file="../public/kindeditor.jspf"%>
<title>添加学院信息</title>
</head>
<body>
	<nav class="breadcrumb">
	    <i class="Hui-iconfont">&#xe67f;</i>首页
	    <span class="c-gray en">&gt;</span>学院管理
	    <span class="c-gray en">&gt;</span>添加学院信息
	    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新">
	        <i class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<article class="page-container">
	    <form class="form form-horizontal" id="form-college-add" name="myform" enctype="multipart/form-data" >
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">
	                <span class="c-red">*</span>学院编号：</label>
	            <div class="formControls col-xs-8 col-sm-8">
	                <input type="text" class="input-text" autocomplete="off" id="collegeId" name="collegeId"></div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">
	                <span class="c-red">*</span>学院名称：</label>
	            <div class="formControls col-xs-8 col-sm-8">
	                <input type="text" class="input-text" autocomplete="off" id="collegeName" name="collegeName" ></div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">
	                <span class="c-red">*</span>缩略图：</label>
	            <div class="formControls col-xs-8 col-sm-8" style="width:185px;">
	                <input type="file" id="litimg" name="file" autocomplete="off" class="input-text" multiple style="border:none;"></div>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/college_add.js"></script>
	<script type="text/javascript">

	</script>
</body>
</html>