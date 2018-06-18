<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 引入头部公共模块 -->
<%@include file="./public/head.jspf"%>
<meta http-equiv="refresh" content="3;url=login.jsp">
<title>登录错误页面</title>
</head>
<body>
	<section class="container-fluid page-404 minWP text-c">
		<p class="error-title"><i class="Hui-iconfont va-m" style="font-size:100px">&#xe688;</i></p>
		<p class="error-description">不好意思，您输入的账号、密码或者验证码错误~</p>
		<p class="error-description" id="count"></p>
		<p class="error-info">您可以：
			<a href="javascript:;" onclick="history.go(-1)" class="c-primary">&lt; 返回上一页</a>
		</p>
	</section>
	
	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui/js/H-ui.min.js"></script>
	
	<script type="text/javascript">
		var time = 3;
		function countDown(){
			var content = time +"秒后自动返回，请重新输入!";
			$("#count").text(content);
			time--;
			if( time == 0 ){
				clearTimeout();
			}else{
				setTimeout(countDown,1000);
			}
		}
		countDown();
	</script>
</body>
</html>