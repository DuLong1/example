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
	<title>章节编辑</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="<%=path %>/layui/layui/css/layui.css" media="all" />
	
</head>
<body class="childrenBody">
	<form class="layui-form" action="<%=path %>/chapter/save.action" method="post" target="_parent" onsubmit="return check()">
		<input type="hidden" name="id" value="${chapter.id }" >
		
		<div class="layui-form-item">
			<label class="layui-form-label">章节名称</label>
			<div class="layui-input-block">
				<input type="text" name="name" value="${chapter.name }"  class="layui-input newsName" lay-verify="required" placeholder="请输入章节名称">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">上级章节</label>
			<div class="layui-input-block">
				<select name="parentCode" >
					<option value="0">无上级章节</option>
					<c:forEach items="${parList }" var="item">
						<option value="${item.id }" <c:if test="${item.id==chapter.parentCode }">selected</c:if>>${item.name }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">所属类型</label>
			<div class="layui-input-block">
				<select name="subjectId" >
					<c:forEach items="${subList }" var="item">
						<option value="${item.id }" <c:if test="${item.id==chapter.subjectId}">selected</c:if>>${item.name }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		
		<div class="layui-form-item">
			
			<div class="layui-inline">
				<label class="layui-form-label">状态</label>
				<div class="layui-input-inline">
					<select name="status" class="newsLook" lay-filter="browseLook">
				        <option value="1" <c:if test="${subject.status==1 }">selected</c:if>>启用</option>
				        <option value="0" <c:if test="${subject.status==0 }">selected</c:if>>禁用</option>
				    </select>
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" tyle="submit" lay-filter="addNews">立即提交</button>
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

	
 
	
})

function check(){
	
	var userid=document.getElementById("userid").value;
	var pwd1=document.getElementById("pwd1").value;
	var pwd2=document.getElementById("pwd2").value;
	if(userid.length!=0){
	if(pwd1!=pwd2){
		alert("两次密码不一致");
		document.getElementById("pwd1").value="";
		document.getElementById("pwd2").value="";
		return false;
	}}
	return true;
}


</script>
</html>
