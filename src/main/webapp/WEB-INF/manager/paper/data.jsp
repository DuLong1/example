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
	<link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
	<link rel="stylesheet" href="<%=path %>/layui/css/main.css" media="all" />
	<link rel="stylesheet" href="<%=path %>/ace/css/ace.css" media="all" />
 	<link rel="stylesheet" href="<%=path%>/ace/css/bootstrap.css"/>
	
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
	<form action="<%=path %>/paper/data.action" >
		<input type="hidden" name="pageNumber" id="pageNumber">
		<input type="hidden" name="pageSize" id="pageSize">
	
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" value="${checkname }" name="checkname" placeholder="请输入考试类型名称" class="layui-input search_input">
		    </div>
		    <input type="submit" class="layui-btn search_btn" value="查询">
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn">随机组卷</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal up_btn">上传试卷</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
		</div>
		</form>
	</blockquote>
	<div class="layui-form news_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="50">
				<col>
				<col width="17%">
				<col width="17%">
				<col width="17%">
				<col width="17%">
		    </colgroup>
		    <thead>
				<tr>
					<th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"  id="allChoose"></th>
					
					<th>考试类型</th>
					<th>试卷名称</th>
					<th>试卷类型</th>
					<th>试卷年份</th>
					<th>操作</th>
				</tr> 
		    </thead>
		    <tbody class="news_content">
		    <c:choose>
		    	<c:when test="${fn:length(page.page.list)==0 }">
		    		<tr><td colspan="6">暂无数据</td></tr>
		    	</c:when>
		    	<c:otherwise>
		    		<c:forEach items="${page.page.list }" var="item">
		    			<tr>
		    			<td><input type="checkbox" name="ids"  lay-skin="primary" lay-filter="choose"></td>
		    			<td>${item.subject }</td>
		    			<td>${item.name }</td>
		    			<td>
		    			<c:if test="${item.type==1 }">
		    			真题试卷
		    			</c:if>
		    			<c:if test="${item.type==2 }">
		    			模拟试卷
		    			</c:if>
		    			<c:if test="${item.type==3 }">
		    			押题预测
		    			</c:if>
		    			<c:if test="${item.type==4 }">
		    			名校精品
		    			</c:if>
		    			</td>
		    			<td>${item.year }</td>
		    			<td>
		    			<c:if test="${item.type==1}"><a onclick = "javascript:window.open('<%=path%>/upload/${item.point}');" class="layui-btn layui-btn-mini" href="#" id=""><i class="iconfont icon-edit"></i>查看详情</a></c:if>
		    			<c:if test="${item.type!=1}"><a class="layui-btn layui-btn-mini news_edit" data-id="${item.id }"><i class="iconfont icon-edit"></i> 查看详情</a></c:if>
		    			<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="${item.id }"><i class="layui-icon">&#xe640;</i> 删除</a>
		    			</td>
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
	<script type="text/javascript" src="<%=path %>/js/paper/list.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-3.4.1.min.js"></script>
	</body>
</html>