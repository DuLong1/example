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
	<title>用户编辑</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="<%=path %>/layui/layui/css/layui.css" media="all" />
	
</head>
<body class="childrenBody">
	<form class="layui-form" action="<%=path %>/user/save.action" method="post" target="_parent" onsubmit="return check()">
		<input type="hidden" name="id" value="${user.id }" id="userid">
		
		<div class="layui-form-item">
			<label class="layui-form-label">账号</label>
			<div class="layui-input-block">
				<input type="text" name="loginaccount" value="${user.loginaccount }"  class="layui-input newsName" lay-verify="required" placeholder="请输入账号">
			</div>
		</div>
		<c:if test="${user.id ==null }">
		<div class="layui-form-item">
			<label class="layui-form-label">密码</label>
			<div class="layui-input-block">
				<input type="password" id="pwd1" name="pwd" value="${user.pwd }"  class="layui-input newsName" lay-verify="required" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">确认密码</label>
			<div class="layui-input-block">
				<input type="password" id="pwd2" value="${user.pwd }"  class="layui-input newsName" lay-verify="required" >
			</div>
		</div>
		</c:if>
		
		<div class="layui-form-item">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-block">
				<input type="text" name="realname" value="${user.realname }"  class="layui-input newsName" lay-verify="required" placeholder="请输入姓名" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">手机号</label>
			<div class="layui-input-block">
				<input type="text" name="phone" value="${user.phone }"  class="layui-input newsName" lay-verify="required" placeholder="请输入手机号" >
			</div>
		</div>
		<div class="layui-inline">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-inline">
					<select name="sex" class="newsLook" lay-filter="browseLook">
				        <option value="1" <c:if test="${user.sex==1 }">selected</c:if>>男</option>
				        <option value="0" <c:if test="${user.sex==0 }">selected</c:if>>女</option>
				    </select>
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">组织机构</label>
			<div class="layui-input-block">
				<select name="sOId" >
					<option value="0">请选择</option>
					<c:forEach items="${orgs}" var="item">
						<option value="${item.id }" <c:if test="${user.sOId==item.id }"> selected</c:if>>${item.orgname }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">角色</label>
			<div class="layui-input-block">
				<select name="roleid" >
					<option value="0">请选择</option>
					<c:forEach items="${roles}" var="item">
						<option value="${item.id }" <c:if test="${user.roleid==item.id }">selected</c:if>>${item.rolename }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		<div class="layui-form-item">
			
			<div class="layui-inline">
				<label class="layui-form-label">状态</label>
				<div class="layui-input-inline">
					<select name="status" class="newsLook" lay-filter="browseLook">
				        <option value="1" <c:if test="${user.status==1 }">selected</c:if>>启用</option>
				        <option value="0" selected>禁用</option>
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
