<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 引入头部公共模块 -->
<%@include file="../public/head.jspf"%>
<!-- 引入副文本编辑器相关文件 -->
<%@include file="../public/kindeditor.jspf"%>
<title>修改密码</title>
</head>
<body>
	<nav class="breadcrumb">
	    <i class="Hui-iconfont">&#xe67f;</i>首页
	    <span class="c-gray en">&gt;</span>管理员管理
	    <span class="c-gray en">&gt;</span>修改密码
	    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新">
	        <i class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<article class="page-container">
	    <form class="form form-horizontal" id="form-admin-add" name="myform">
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">
	                <span class="c-red">*</span>新密码：</label>
	            <div class="formControls col-xs-8 col-sm-8">
	                <input type="text" class="input-text" autocomplete="off" id="adminPassword" name="adminPassword" ></div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-4 col-sm-2">
	                <span class="c-red">*</span>确认密码：</label>
	            <div class="formControls col-xs-8 col-sm-8">
	                <input type="text" class="input-text" autocomplete="off" id="comfirmPassword" name="comfirmPassword" ></div>
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

	<script type="text/javascript">
		$("#form-admin-add").validate({
		    rules: {
		    	adminPassword: {
		            required: true,
		            minlength:6
		        },
		        comfirmPassword: {
		            required: true,
		            equalTo:"#adminPassword"
		        }
		    },
		    onkeyup: false,
		    focusCleanup: true,
		    success: "valid",
		    submitHandler: function(form) {
		        $(form).ajaxSubmit({
		            type: 'post',
		            url: "/hstc_manage/admin_edit_password",
		            success: function(data) {
		            	if(data == "true"){
		            		layer.msg('修改密码成功!重新登录系统时生效！', {
			                    icon: 1,
			                    time: 3000
			                });
		            	}
		            },
		            error: function(XmlHttpRequest, textStatus, errorThrown) {
		                layer.msg('修改密码失败!', {
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