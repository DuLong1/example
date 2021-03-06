<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>试卷管理</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="<%=path %>/layui/layui/css/layui.css" media="all" />
	
</head>
<body class="childrenBody">
	<form class="layui-form" action="<%=path %>/paper/save.action" method="post" target="_parent" onsubmit="return check()">
		<input type="hidden" name="id" value="${chapter.id }" >
		
		<div class="layui-form-item">
			<div class="layui-inline">
			<label class="layui-form-label">考试类型</label>
			<div class="layui-input-inline">
				<select name="subjectId" >
					<c:forEach items="${subList }" var="item">
						<option value="${item.id }">${item.name }</option>
					</c:forEach>
				</select>			
			</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
			<label class="layui-form-label">试卷类型</label>
			<div class="layui-input-inline">
				<select name="type" >
					<option value="1">真题试卷</option>
					<option value="2">模拟试卷</option>
					<option value="3">押题预测</option>
					<option value="4">名校精品</option>
				</select>
			</div>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">试卷名称</label>
			<div class="layui-input-block">
				<input type="text" name="name" value=""  class="layui-input newsName" lay-verify="required" placeholder="请输入试卷名称">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">单选题个数</label>
			<div class="layui-input-block">
				<input type="text" name="numdan" value=""  class="layui-input newsName" lay-verify="required" placeholder="请输入选择题个数">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">多选题个数</label>
			<div class="layui-input-block">
				<input type="text" name="numduo" value=""  class="layui-input newsName" lay-verify="required" placeholder="请输入多选题个数">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">解答题个数</label>
			<div class="layui-input-block">
				<input type="text" name="numjie" value=""  class="layui-input newsName" lay-verify="required" placeholder="请输入解答题个数">
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn"  type="submit" lay-filter="addNews">生成试卷</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="<%=path %>/layui/layui/layui.js"></script>
	
</body>

<script type="text/javascript">
layui.config({
	base : "js/"
}).use(['form','layer','jquery','layedit','laydate'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		layedit = layui.layedit,
		laydate = layui.laydate,
		$ = layui.jquery;
});
</script>
</html>
