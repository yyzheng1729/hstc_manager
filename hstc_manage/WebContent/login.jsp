<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 引入头部公共模块 -->
<%@include file="./public/head.jspf"%>
<title>韩师新闻Lite后台管理系统</title>
</head>
<body>
	<input type="hidden" id="TenantId" name="TenantId" value="" />
	<div class="header"></div>
	<div class="loginWraper">
	    <div id="loginform" class="loginBox">
	        <form class="form form-horizontal" action="index.jsp" method="post">
	            <div class="title">韩师招聘Lite后台管理登陆</div>
	            <div class="row cl">
	                <label class="form-label col-xs-3">
	                    <i class="Hui-iconfont">&#xe60d;</i></label>
	                <div class="formControls col-xs-8">
	                    <input id="username" name="" type="text" placeholder="账户" class="input-text size-L"></div>
	            </div>
	            <div class="row cl">
	                <label class="form-label col-xs-3">
	                    <i class="Hui-iconfont">&#xe60e;</i></label>
	                <div class="formControls col-xs-8">
	                    <input id="password" name="" type="password" placeholder="密码" class="input-text size-L"></div>
	            </div>
	            <div class="row cl">
	                <div class="formControls col-xs-8 col-xs-offset-3">
	                    <input class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
	                    <img src="">
	                    <a id="kanbuq" href="javascript:;">看不清，换一张</a></div>
	            </div>
	            <div class="row cl">
	                <div class="formControls col-xs-8 col-xs-offset-3">
	                    <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
	                    <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
	                </div>
	            </div>
	        </form>
	    </div>
	</div>
	<div class="footer"></div>
	
	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui/js/H-ui.min.js"></script>
</body>
</html>