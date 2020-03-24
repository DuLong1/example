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
	<title>用户信息</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	
	<link rel="stylesheet" href="<%=path %>/layui/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
	<link rel="stylesheet" href="<%=path %>/layui/css/main.css" media="all" />
	<link rel="stylesheet" href="<%=path %>/ace/css/ace.css" media="all" />
 	<link rel="stylesheet" href="<%=path%>/ace/css/bootstrap.css"/>
	
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
	<form action="<%=path %>/cust/data.action" >
		<input type="hidden" name="pageNumber" id="pageNumber">
		<input type="hidden" name="pageSize" id="pageSize">
	
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" value="${checkname }" name="checkname" placeholder="请输入用户名称" class="layui-input search_input">
		    </div>
		    <input type="submit" class="layui-btn search_btn" value="查询">
		</div>
		</form>
	</blockquote>
	<div class="layui-form news_list">
	  	<table class="layui-table">
		    <colgroup>
				<col>
				<col width="9%">
				<col width="6%">
				<col width="12%">
				<col width="14%">
				<col width="16%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="6%">
		    </colgroup>
		    <thead>
				<tr>
					<th>昵称</th>
					<th>真实姓名</th>
					<th>性别</th>
					<th>电话</th>
					<th>邮箱</th>
					<th>身份证号</th>
					<th>生日</th>
					<th>注册时间</th>
					<th>最后登陆时间</th>
					<th>状态</th>
				</tr> 
		    </thead>
		    <tbody class="news_content">
		    <c:choose>
		    	<c:when test="${fn:length(page.page.list)==0 }">
		    		<tr><td colspan="10">暂无数据</td></tr>
		    	</c:when>
		    	<c:otherwise>
		    		<c:forEach items="${page.page.list }" var="item">
		    			<tr>
		    			<td>
		    			<c:if test="${item.nickname==null }">未设置</c:if>
		    			<c:if test="${item.nickname!=null }">${item.nickname }</c:if>
		    			
		    			</td>
		    			<td>
		    			<c:if test="${item.realname==null }">未设置</c:if>
		    			<c:if test="${item.realname!=null }">${item.realname }</c:if>
		    			</td>
		    			<td>
		    			<c:if test="${item.sex==1 }">男</c:if>
		    			<c:if test="${item.sex==0 }">女</c:if>
		    			<c:if test="${item.sex==null}">未设置</c:if>
		    			</td>
		    			<td>
		    			<c:if test="${item.mobile==null }">未设置</c:if>
		    			<c:if test="${item.mobile!=null }">${item.mobile }</c:if>
		    			</td>
		    			<td>
		    			<c:if test="${item.emain==null }">未设置</c:if>
		    			<c:if test="${item.emain!=null }">${item.emain }</c:if>
		    			</td>
		    			<td>
		    			<c:if test="${item.idcard==null }">未设置</c:if>
		    			<c:if test="${item.idcard!=null }">${item.idcard }</c:if>
		    			</td>
		    			<td>
		    			<c:if test="${item.birthday==null }">未设置</c:if>
		    			<c:if test="${item.birthday!=null }">${item.birthday }</c:if>
		    			</td>
		    			<td>
		    			<c:if test="${item.regdate==null }">未设置</c:if>
		    			<c:if test="${item.regdate!=null }">${item.regdate }</c:if>
		    			</td>
		    			<td>
		    			<c:if test="${item.lastlogindate==null }">未设置</c:if>
		    			<c:if test="${item.lastlogindate!=null }">${item.lastlogindate }</c:if>
		    			</td>
		    			<td>
		    			<c:if test="${item.status==null }">未设置</c:if>
		    			<c:if test="${item.status==1 }">
		    			启用
		    			</c:if>
		    			<c:if test="${item.status==0 }">
		    			禁用
		    			</c:if></td>
		    			</tr>
		    		</c:forEach>
		    	</c:otherwise>
		    </c:choose>
		    	
		    </tbody>
		</table>
	</div>
	<div id="page">
	${page.pageStr }
	</div>
	<script type="text/javascript" src="<%=path %>/layui/layui/layui.js"></script>
	</body>
</html>