<%@page import="com.adultexample.constant.Common"%>
<%@page import="com.adultexample.pojo.SCust"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>试卷列表页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path%>/door/css/main.css">
	<link rel="stylesheet" href="<%=path%>/door/css/reset.css">
	<link rel="stylesheet" href="<%=path%>/door/css/iconfont.css">
	<link rel="stylesheet" href="<%=path%>/door/css/paperlist.css">
	<link rel="stylesheet" href="<%=path%>/door/css/footer.css">
	<link rel="stylesheet" href="<%=path%>/door/css/member/minilogin.css">
	<link type="favicon" rel="shortcut icon" href="<%=path%>/door/images/favicon.png">
	</head>
  <body>
	<!-- 头部-->
	<div class="header">
	<div class="menu">
		<div class="menu-contain clearfix">
			<a href="<%=path %>/door/toindex.action"><span class="container-logo"></span></a>		
			<div class="contain-login" id="loginbut">
                <div class="login-container" >
                    <i class="login-icon iconfont icon-yonghu"></i>
                    <span>
                    	<%
                    	SCust cust = (SCust)session.getAttribute(Common.WEB_CURRENT_USER_STRING);
                    	String custname = null;
                    	if(cust!=null){
                    		custname = cust.getNickname();
                    	}
                    	
                     %>
                    <%
                    	String path2 = request.getContextPath();
                    	String str = "<a href='"+path2+"/door/tologin.action'>登录</a>";
                    	if(custname!=null){
                    		out.println(custname);
                    	}else{
                    		out.println(str);
                    	}
                     %>
                    </span>
                </div>
                <ul class="login-option dis-none" id="loginOption">
                    <li><a href="<%=path%>/per/like.action" title="收藏夹">收藏夹</a></li>
                    <li><a href="<%=path %>/door/removeLogin.action" title="退出">退出</a></li>
                </ul>
            </div>
			
          </div>
	</div>
</div>
<script src="https://zz.bdstatic.com/linksubmit/push.js"></script>
<script src="https://hm.baidu.com/hm.js?877e9c9ef462fe55b7750d478a41c981"></script>
<script type="text/javascript">
var mainHttp = "https:\/\/www.tamguo.com\/";
</script>
	
	<!-- 主体 -->
	<div class="content-wp">
        <div class="main">
			<div class="main-submenu">
			    <div class="submenu-contain clearfix">
			        <span class="contain-title">
			            <a href="javascript:void(0)">${subname }</a>
			        </span>
			       <ul class="contain-ul">
			            <li class="contain-li">
			                <a href="<%=path %>/door/tosubject/${subid}.action" >考试首页</a>
			            </li>
			            <li class="contain-li">
			                <a class="" href="<%=path %>/door/tochapterlearn/${subid}.action">章节学习</a>
			            </li>
			            <li class="contain-li curr">
			                <a class="curr" href="<%=path %>/door/topaper/${subid}.action">试卷练习</a>
			            </li>
				   </ul>
			    </div>
			</div>
			<div class="main-inner clearfix">
	<a class="backtotop iconfont icon-xiangshang" href="#"></a>

	<div class="screening">
		<div class="sc-title clearfix">
			<h3 class="sc-ti">试卷资源库</h3>
			<p>共<span class="num">${num }</span>套试卷</p>
		</div>
		<div class="sc-list-content">
			<span class="sub">类型:</span>
			<ul class="sc-list clearfix">
				<li <c:if test="${type==0 }">class="selected"</c:if>>
					<a href="<%=path %>/door/topaper/${subid }-0-${year }-${pagenum }.action">全部</a>
				</li>
				<li <c:if test="${type==2 }">class="selected"</c:if>>
					<a href="<%=path %>/door/topaper/${subid }-2-${year }-${pagenum }.action">模拟试卷</a>
				</li>
				<li <c:if test="${type==3 }">class="selected"</c:if>>
					<a href="<%=path %>/door/topaper/${subid }-3-${year }-${pagenum }.action">押题预测</a>
				</li>

			</ul>
		</div>
		<div class="sc-list-content">
			<span class="sub">年份:</span>
			<ul class="sc-list clearfix">
				<li <c:if test="${year==0 }">class="selected"</c:if>>
					<a href="<%=path %>/door/topaper/${subid }-${type }-0-${pagenum }.action">全部</a>
				</li>
				<li <c:if test="${year==2018 }">class="selected"</c:if>>
					<a href="<%=path %>/door/topaper/${subid }-${type }-2018-${pagenum }.action">2018</a>
				</li>
				<li <c:if test="${year==2017 }">class="selected"</c:if>>
					<a href="<%=path %>/door/topaper/${subid }-${type }-2017-${pagenum }.action">2017</a>
				</li>
				<li <c:if test="${year==2016 }">class="selected"</c:if>>
					<a href="<%=path %>/door/topaper/${subid }-${type }-2016-${pagenum }.action">2016</a>
				</li>
				<li <c:if test="${year==2015 }">class="selected"</c:if>>
					<a href="<%=path %>/door/topaper/${subid }-${type }-2015-${pagenum }.action">2015</a>
				</li>
				<li <c:if test="${year==2014 }">class="selected"</c:if>>
					<a href="<%=path %>/door/topaper/${subid }-${type }-2014-${pagenum }.action">2014</a>
				</li>
			</ul>
		</div>
		
	</div>

	<div class="list-left">
		<div class="mainlist">
			<div class="title">
				<span class="all">全部试卷</span>
			</div>
			<c:forEach items="${pageInfo.list }" var="item">
			<div class="paperlist-content">
				<div class="paperlist">
					<div class="paper-title-content zhenti">
						<h3 class="paper-title">
                    <a href="javascript:void(0)" class="paper-a">${item.name }</a>
                </h3>
						<span class="read">0</span>
						<span class="down">0</span>
					</div>
					<a class="paper-link" href="<%=path%>/door/topaperdetail/${item.id}.action">查看套卷</a>
				</div>
			</div>
			</c:forEach>
			
			<div class="paging clearfix">
				<div class="page-content" style="margin-left: -147.5px; left: 50%;">
					<ul class="page-list">
						<li <c:if test="${pagenum==1 }">class="selected page-num"</c:if>
							<c:if test="${pagenum!=1 }">class="page-num"</c:if>
						>
							<a href="<%=path %>/door/topaper/${subid }-${type }-${year }-1.action">1</a>
						</li>
                
						<li <c:if test="${pagenum==2 }">class="selected page-num"</c:if>
							<c:if test="${pagenum!=2 }">class="page-num"</c:if>
						>
							<a href="<%=path %>/door/topaper/${subid }-${type }-${year }-2.action">2</a>
						</li>
                
						<li <c:if test="${pagenum==3 }">class="selected page-num"</c:if>
							<c:if test="${pagenum!=3 }">class="page-num"</c:if>
						>
							<a href="<%=path %>/door/topaper/${subid }-${type }-${year }-3.action">3</a>
						</li>
                
						<li <c:if test="${pagenum==43324 }">class="selected page-num"</c:if>
							<c:if test="${pagenum!=432432 }">class="page-num"</c:if>
						>
							<a href="<%=path %>/door/topaper/${subid }-${type }-${year }-3.action"">...</a>
						</li>
                
						<li <c:if test="${pagenum==8 }">class="selected page-num"</c:if>
							<c:if test="${pagenum!=8 }">class="page-num"</c:if>
						>
							<a href="<%=path %>/door/topaper/${subid }-${type }-${year }-8.action"">8</a>
						</li>
                
						<li <c:if test="${pagenum==9 }">class="selected page-num"</c:if>
							<c:if test="${pagenum!=9 }">class="page-num"</c:if>
						>
							<a href="<%=path %>/door/topaper/${subid }-${type }-${year }-9.action"">9</a>
						</li>
                
						<li <c:if test="${pagenum==10 }">class="selected page-num"</c:if>
							<c:if test="${pagenum!=10}">class="page-num"</c:if>
						>
							<a href="<%=path %>/door/topaper/${subid }-${type }-${year }-10.action"">10</a>
						</li>

						<li class="page-num next">
							<a href="<%=path %>/door/topaper/${subid }-${type }-${year }-<c:if test="${pagenum>=pageInfo.pages}">${pagenum}</c:if><c:if test="${pagenum<pageInfo.pages}">${pagenum+1}</c:if>.action"">&gt;</a>
						</li>

					</ul>
					<div class="page-sum">共${pageInfo.pages }页/${num }套试卷</div>
				</div>
			</div>

		</div>

	</div>
	<div class="list-right">

	</div>
</div>
        </div>	
	</div>
	
	<!--尾部 -->
	<div class="foot">
	    <div class="crumbs">
	        <a href="<%=path%>/door/toindex.action">成人题库网</a> &gt;
	        <a href="javascript:void(0)">${subname }</a>
	     </div>
    </div>
    
    <!--尾部-->
	<div class="footer">
	<div class="footer-contain clearfix">
		<div class="intro">
			<div class="title">成人题库网</div>
			<p>
				成人网旨在为用户提供高效的备考服务，让知识能无障碍传播，为用户创造价值，助您不断前行！
			</p>
		</div>
		<div class="connect">
			<div class="title">联系我们</div>
			<p>
				<i class="iconfont icon-yonghu"></i> 裴女士
			</p>
			<p>
				<i class="iconfont icon-mail"></i> wjsn.love@ujuing.com
			</p>
			<p>
				<i class="iconfont icon-qq"></i> qq：5946329138
			</p>
		</div>
		<div class="suggest">
			<div class="title">微信公众号</div>
			<p>
				<img style="width:80px;height:80px;" alt="成人网公众号" src="<%=path %>/door/images/weixin.jpg">
			</p>
		</div>
		<div class="cooperation">
			<div class="title">合作机构</div>
			<span class="left iconfont icon-xiangzuo1"></span> <span class="right iconfont icon-xiangyou1"></span>
			<div class="coo-view clearfix">
				<ul class="contain-ul dis-none" style="display: block;">
					<li class="contain-li"><a class="contain-link" href="http://www.baidu.com/" style="color:#fff;" target="_blank" >百度网</a>
					</li>
					<li class="contain-li"><a class="contain-link" href="https://book.yuoku.com/" style="color:#fff;" target="_blank" >优酷网</a>
					</li>	
					<li class="contain-li"><a class="contain-link" style="color:#fff;" href="http://www.xunaiquan.com/" target="_blank" >腾讯网</a></li>
					<li class="contain-li"><a class="contain-link" href="http://www.tenxun.com/" style="color:#fff;" target="_blank">酷狗网</a>
						</li>	
					<li class="contain-li"><a class="contain-link" href="http://sh.kaoyan365.cn/" style="color:#fff;" target="_blank" title="上海研究生招生信息网">研究生网</a>
						</li>
					<li class="contain-li"><a class="contain-link" style="color:#fff;" href="http://liuxue.markets120.com/" target="_blank" title="德国双元制">德国双元制</a></li>
					<li class="contain-li"><a class="contain-link" href="http://www.ffjhrj.com/" style="color:#fff;" target="_blank" title="非凡科技软件">非凡科技软件</a>
					</li>
					<li class="contain-li"><a class="contain-link" href="http://www.zhouyafei.net/" style="color:#fff;" target="_blank" title="特色小吃">特色小吃</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<p class="bottom">
		沪备案号 <a href="http://www.miitbeian.gov.cn" target="_blank">沪ICP备14022608号-1</a> Copyright © 2018 ZM
	</p>
</div>
	
<div class="mask firstleader"></div>

<script type="text/javascript" src="<%=path%>/door/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/door/js/jquery.iDialog.js"></script>
<script type="text/javascript" src="<%=path%>/door/js/main.js"></script>
<script>
   	$("#loginbut").hover(function(){
   		$("#loginOption").toggleClass("dis-none");
   	});
   	if(${flag==999}){
   		alert("登录后才能查看此功能");
   	}
</script>
</body>
</html>
