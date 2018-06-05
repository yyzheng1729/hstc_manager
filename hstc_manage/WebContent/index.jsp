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
	<header class="navbar-wrapper">
	    <div class="navbar navbar-fixed-top">
	        <div class="container-fluid cl">
	            <a class="logo navbar-logo f-l mr-10 hidden-xs" href="index.html">韩师新闻Lite</a>
	            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
	                <ul class="cl">
	                    <li>
	                        <span>超级管理员</span></li>
	                    <li class="button">
	                        <a href="404.html">退出登录</a></li>
	                    <li id="Hui-skin" class="dropDown right dropDown_hover">
	                        <a href="javascript:;" class="dropDown_A" title="换肤">
	                            <i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
	                        <ul class="dropDown-menu menu radius box-shadow">
	                       		<li>
	                                <a href="javascript:;" data-val="blue" title="默认（蓝色）">默认（蓝色）</a></li>
	                            <li>
	                                <a href="javascript:;" data-val="default" title="黑色">黑色</a></li>
	                            <li>
	                                <a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
	                            <li>
	                                <a href="javascript:;" data-val="red" title="红色">红色</a></li>
	                            <li>
	                                <a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
	                            <li>
	                                <a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
	                        </ul>
	                    </li>
	                </ul>
	            </nav>
	        </div>
	    </div>
	</header>
	<aside class="Hui-aside">
	    <div class="menu_dropdown bk_2">
	        <dl id="menu-admin">
	            <dt>
	                <i class="Hui-iconfont">&#xe62d;</i>管理员管理
	                <i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
	            <dd>
	                <ul>
	                    <li>
	                        <a data-href="welcome.jsp" data-title="管理员列表" href="javascript:void(0)">管理员列表</a></li>
	                </ul>
	            </dd>
	        </dl>
	        <dl id="menu-member">
	            <dt>
	                <i class="Hui-iconfont">&#xe60d;</i>用户管理
	                <i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
	            <dd>
	                <ul>
	                    <li>
	                        <a data-href="./jsp/user_list.jsp" data-title="用户列表" href="javascript:;">用户列表</a></li>
	                </ul>
	            </dd>
	        </dl>
	        <dl id="menu-article">
	            <dt>
	                <i class="Hui-iconfont">&#xe616;</i>信息管理
	                <i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
	            <dd>
	                <ul>
	                    <li>
	                        <a data-href="./jsp/list.jsp" data-title="新闻列表" href="javascript:void(0)">招聘信息列表</a></li>
	                    <li>
	                        <a data-href="./jsp/add.jsp" data-title="添加新闻" href="javascript:void(0)">添加新闻</a></li>
	                </ul>
	            </dd>
	        </dl>
	        <dl id="menu-picture">
	            <dt>
	                <i class="Hui-iconfont">&#xe643;</i>学院管理
	                <i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
	            <dd>
	                <ul>
	                    <li>
	                        <a data-href="./jsp/college_list.jsp" data-title="学院列表" href="javascript:void(0)">学院列表</a></li>
	                </ul>
	            </dd>
	        </dl>
	        <dl id="menu-comments">
	            <dt>
	                <i class="Hui-iconfont">&#xe622;</i>评论管理
	                <i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
	            <dd>
	                <ul>
	                    <li>
	                        <a data-href="welcome.jsp" data-title="评论列表" href="javascript:;">评论列表</a></li>
	                </ul>
	            </dd>
	        </dl>
	        <dl id="menu-comments">
	            <dt>
	                <i class="Hui-iconfont">&#xe61b;</i>收藏管理
	                <i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
	            <dd>
	                <ul>
	                    <li>
	                        <a data-href="./jsp/collect_list.jsp" data-title="收藏列表" href="javascript:;">收藏列表</a></li>
	                </ul>
	            </dd>
	        </dl>
	        <dl id="menu-comments">
	            <dt>
	                <i class="Hui-iconfont">&#xe70c;</i>投诉管理
	                <i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
	            <dd>
	                <ul>
	                    <li>
	                        <a data-href="article-add.html" data-title="投诉列表" href="javascript:;">投诉列表</a></li>
	                </ul>
	            </dd>
	        </dl>
	    </div>
	</aside>
	<div class="dislpayArrow hidden-xs">
	    <a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
	</div>
	<section class="Hui-article-box">
	    <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
	        <div class="Hui-tabNav-wp">
	            <ul id="min_title_list" class="acrossTab cl">
	                <li class="active">
	                    <span title="我的桌面" data-href="welcome.jsp">我的桌面</span>
	                    <em></em>
	                </li>
	            </ul>
	        </div>
	        <div class="Hui-tabNav-more btn-group">
	            <a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;">
	                <i class="Hui-iconfont">&#xe6d4;</i></a>
	            <a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;">
	                <i class="Hui-iconfont">&#xe6d7;</i></a>
	        </div>
	    </div>
	    <div id="iframe_box" class="Hui-article">
	        <div class="show_iframe">
	            <div style="display:none" class="loading"></div>
	            <iframe scrolling="yes" frameborder="0" src="welcome.jsp"></iframe>
	        </div>
	    </div>
	</section>
	<div class="contextMenu" id="Huiadminmenu">
	    <ul>
	        <li id="closethis">关闭当前</li>
	        <li id="closeall">关闭全部</li></ul>
	</div>
	
	<!-- 引入底部公共模块 -->
	<%@include file="./public/foot.jspf"%>
	
	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
</body>
</html>