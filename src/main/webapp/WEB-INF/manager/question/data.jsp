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
	<title>题目管理</title>
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
	<form action="<%=path %>/question/data.action" >
		<input type="hidden" name="pageNumber" id="pageNumber">
		<input type="hidden" name="pageSize" id="pageSize">
	
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" value="${checkname }" name="checkname" placeholder="请输入类型或章节名称" class="layui-input search_input">
		    </div>
		    <input type="submit" class="layui-btn search_btn" value="查询">
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn">添加题目</a>
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
				<col width="5%">
				<col width="17%">
				<col width="5%">
				<col width="17%">
				<col width="17%">
				<col width="8%">
				<col width="15%">
		    </colgroup>
		    <thead>
				<tr>
					<th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"  id="allChoose"></th>
					
					<th>题目类型</th>
					<th>分数</th>
					<th>题目内容</th>
					<th>答案</th>
					<th>解析</th>
					<th>节点信息(类型--章节)</th>
					<th>状态</th>
					<th>操作</th>
				</tr> 
		    </thead>
		    <tbody class="news_content">
		    <c:choose>
		    	<c:when test="${fn:length(page.page.list)==0 }">
		    		<tr><td colspan="9">暂无数据</td></tr>
		    	</c:when>
		    	<c:otherwise>
		    		<c:forEach items="${page.page.list }" var="item">
		    			<tr>
		    			<td><input type="checkbox" name="ids"  lay-skin="primary" lay-filter="choose"></td>
		    			<td>
		    				<c:if test="${item.questionType==1 }">单选题</c:if>
		    				<c:if test="${item.questionType==2 }">多选题</c:if>
		    				<c:if test="${item.questionType==3 }">解答题</c:if>
		    			</td>
		    			
		    			<td>${item.score }</td>
		    			<td>${item.content }</td>
		    			<td>${item.answer }</td>
		    			<td>${item.analysis }</td>
		    			<td>${item.subject} -- ${item.chapter}</td>
		    			<td>
		    			<c:if test="${item.auditStatus==0 }">
		    			未审核
		    			</c:if>
		    			<c:if test="${item.auditStatus==1 }">
		    			审核通过
		    			</c:if>
		    			<c:if test="${item.auditStatus==2 }">
		    			未通过
		    			</c:if>
		    			</td>
		    			<td>
		    			<a class="layui-btn layui-btn-mini news_edit" data-id="${item.id }"><i class="iconfont icon-edit"></i> 编辑</a>
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
	<script type="text/javascript" src="<%=path %>/js/question/list.js"></script>
	
	</body>
</html>