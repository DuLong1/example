<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录--成人自考后台管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compat
	  ible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="<%=path%>/layui/layui/css/layui.css"
	media="all" />
<link rel="stylesheet" href="<%=path%>/layui/css/login.css" media="all" />
<link type="favicon" rel="shortcut icon" href="<%=path%>/door/images/favicon.png" />
</head>
<body>

	<div class="video_mask">
		<video autoplay="autoplay" style="width:100%;" class="video-player"
			loop="loop">
			<source src="<%=path%>/layui/page/login/login.mp4" type="video/mp4">;
		
		</video>
	</div>
	<div class="login">
		<h1>成人自考题库平台管理登录</h1>
		<form class="layui-form" action="<%=path%>/manager/login.action"
			method="post">
			<div class="layui-form-item">
				<input class="layui-input" name="uname" placeholder="用户名"
					lay-verify="required" type="text" autocomplete="off">
			</div>
			<div class="layui-form-item">
				<input class="layui-input" name="password" placeholder="密码"
					lay-verify="required" type="password" autocomplete="off">
			</div>
			<div class="layui-form-item form_code">
				<input class="layui-input" name="code" placeholder="验证码"
					lay-verify="required" type="text" autocomplete="off">
				<div class="code">
					<img id="code" src="<%=path%>/verification.action" width="116"
						height="36">
				</div>
			</div>
			<button type="submit" class="layui-btn login_btn" lay-submit=""
				lay-filter="login">登录</button>
		</form>
	</div>
	<script type="text/javascript" src="<%=path%>/layui/layui/layui.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-3.4.1.min.js"></script>
	<!-- 验证码的获取 -->
	<script type="text/javascript">
		document.getElementById("code").onclick=function(){
		this.src="<%=path%>/verification.action";}
		if(${param.flag == 0}){
			alert("验证码错误");
		}
		if(${param.flag == 1}){
			alert("用户名或密码错误");
		}
	</script>
</body>
</html>