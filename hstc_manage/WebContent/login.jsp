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
	        <form class="form form-horizontal" action="loginValidate" method="post">
	            <div class="title">韩师招聘Lite后台管理登陆</div>
	            <div class="row cl">
	                <label class="form-label col-xs-3">
	                    <i class="Hui-iconfont">&#xe60d;</i></label>
	                <div class="formControls col-xs-8">
	                    <input id="loginAccount" name="loginAccount" type="text" placeholder="账户" class="input-text size-L"></div>
	            </div>
	            <div class="row cl">
	                <label class="form-label col-xs-3">
	                    <i class="Hui-iconfont">&#xe60e;</i></label>
	                <div class="formControls col-xs-8">
	                    <input id="loginPassword" name="loginPassword" type="password" placeholder="密码" class="input-text size-L"></div>
	            </div>
	            <div class="row cl">
	                <div class="formControls col-xs-8 col-xs-offset-3">
	                    <input name="inputCode" class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
	                    <img src="checkCode" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">
	                    <div class="check-box">
							<input type="checkbox" id="checkOne" name="rememberMe">
							<label for="checkOne">记住我</label>
						</div>
					</div>
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
	<script type="text/javascript">    
        $(function(){
            $.ajax({
                type:"POST",
                url: "/hstc_manage/getCookie", 
                dataType:"json",
                success:function(data){ 
                    $("#loginAccount").val(data.loginAccount);
                    $("#loginPassword").val(data.loginPassword);
                    if(data.loginAccount != ""){
                    	$("#checkOne").attr("checked",true);
                    }
                },
                error:function() {
                    alert("cookies 信息获取失败！");
                }
            });
        });
    </script>
</body>
</html>