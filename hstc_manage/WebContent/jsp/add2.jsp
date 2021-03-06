<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 引入头部公共模块 -->
<%@include file="../public/head.jspf"%>
<!-- 引入副文本编辑器相关文件 -->
<%@include file="../public/kindeditor.jspf"%>
<title>添加新闻</title>
</head>
<body>
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
	                <input type="text" class="input-text" autocomplete="off" id="title" name=""title""></div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">
	                <span class="c-red">*</span>作者：</label>
	            <div class="formControls col-xs-8 col-sm-8">
	                <input type="text" class="input-text" autocomplete="off" id="author" name="author" value="小程序工作人员"></div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">
	                <span class="c-red">*</span>发表时间：</label>
	            <div class="formControls col-xs-8 col-sm-8">
	                <input type="text" id="newsTime" name="newsTime" class="input-text Wdate" onfocus="WdatePicker({ Date:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" style="width:185px;"></div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">
	                <span class="c-red">*</span>新闻位置：</label>
	            <div class="formControls col-xs-8 col-sm-8">
	                <span class="select-box" style="width:185px;">
	                    <select class="select" id="newsPosition" name="newsPosition" size="1">
	                        <option value="普通新闻">普通新闻</option>
	                        <option value="首页轮播">首页轮播</option>
	                        <option value="热门推荐">热门推荐</option></select>
	                </span>
	            </div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">
	                <span class="c-red">*</span>新闻分类：</label>
	            <div class="formControls col-xs-8 col-sm-8">
	                <span class="select-box" style="width:185px;">
	                    <select class="select" id="newsCategory" name="newsCategory" size="1">
	                        <option value="韩师要闻">韩师要闻</option>
	                        <option value="学习十九大精神">学习十九大精神</option>
	                        <option value="两学一做">两学一做</option>
	                        <option value="学习习书记重要讲话">学习习书记重要讲话</option>
	                        <option value="韩师时事快报">韩师时事快报</option>
	                        <option value="学术交流">学术交流</option>
	                        <option value="韩师人物">韩师人物</option>
	                        <option value="媒体韩师">媒体韩师</option></select>
	                </span>
	            </div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">
	                <span class="c-red">*</span>缩略图：</label>
	            <div class="formControls col-xs-8 col-sm-8" style="width:185px;">
	                <input type="file" id="newsLitimg" name="file" autocomplete="off" class="input-text" multiple style="border:none;"></div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">新闻详情：</label>
	            <div class="formControls col-xs-8 col-sm-8">
	                <textarea name="text" class="textarea" style="height:500px;width:100%;"></textarea>
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
	
	<!-- 日期插件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
	
	<!--与本页面动态处理有关的 js 操作-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/add.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/kindEditor.js"></script> 
</body>
</html>