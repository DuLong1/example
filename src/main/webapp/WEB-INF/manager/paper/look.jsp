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
	<title>试卷详情</title>
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
	<div class="layui-form news_list" style="width:650px;margin:0 auto;">
		<p style="text-align:center;">
			<strong>${paperBaseInfo.name}[ 
					${paperBaseInfo.year}--
					<c:if test="${paperBaseInfo.type==1 }">真题试卷</c:if>
		    		<c:if test="${paperBaseInfo.type==2 }">模拟试卷</c:if>
		    	    <c:if test="${paperBaseInfo.type==3 }">押题预测</c:if>
		    		<c:if test="${paperBaseInfo.type==4 }">名校精品</c:if> 
		    		]
		    </strong>
		</p>
		<c:forEach items="${paperQuestionInfo}" varStatus="sta" var="item" >
			<div style="line-height:35px;">
				<strong>[
				<c:if test="${item.questionType==1 }">单选题</c:if>
   				<c:if test="${item.questionType==2 }">多选题</c:if>
   				<c:if test="${item.questionType==3 }">解答题</c:if>
				--${item.score}
				] ${sta.index+1}、</strong>
				${item.content }
			</div>
		</c:forEach>
	</div>
	<script type="text/javascript" src="<%=path %>/layui/layui/layui.js"></script>
	<script type="text/javascript" src="<%=path %>/js/paper/list.js"></script>
	</body>
</html>