<%@page import="com.adultexample.pojo.SCust"%>
<%@page import="com.adultexample.constant.Common"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>成人题库系统首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path%>/door/css/main.css">
	<link rel="stylesheet" href="<%=path%>/door/css/reset.css">
	<link rel="stylesheet" href="<%=path%>/door/css/iconfont.css">
	<link rel="stylesheet" href="<%=path%>/door/css/index.css">
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
	<div class="clearfix submenu-container" data-id="submenu">
	</div>
</div>
<script src="https://zz.bdstatic.com/linksubmit/push.js"></script>
<script src="https://hm.baidu.com/hm.js?877e9c9ef462fe55b7750d478a41c981"></script>
<script type="text/javascript">
var mainHttp = "https:\/\/www.tamguo.com\/";
</script>
	
	<!--主体-->
	<div class="content-wp">
        <div class="main">
    		<div class="main-container">
    			<!-- 头部轮播-->
                <div class="banner" data-am-flexslider>
					<ul class="banner-list">
						<li class="img-list" >
							<a class="banner-link img-1" href="javascript:void(0)" data-index="1">
								<div style="background-image:url('<%=path %>/door/images/banner.jpg');" class="banner-pic"></div>
							</a>
						</li>
						<li class="img-list" >
							<a class="banner-link img-1" href="javascript:void(0)"  data-index="2">
								<div style="background-image:url('<%=path %>/door/images/banner1.jpg');" class="banner-pic"></div>
							</a>
						</li>
					</ul>
					<ul class="play-nav">
						<li data-idx="1" class="cur">
							<a href="javascript:void(0);">1</a>
						</li>
						<li data-idx="2" class="">
							<a href="javascript:void(0);">2</a>
						</li>
					</ul>
				</div>
                
    			<!-- 头部轮播 -->
    			<script>
    				setInterval(function(){
    					$(".play-nav").children(".cur").removeClass("cur").siblings().addClass("cur");
    					var index = $(".play-nav").children(".cur").data("idx");
    					$(".banner-list>li").css("z-index","1");
    					$(".banner-list").find("a[data-index="+index+"]").parent().css("z-index","9");
    					
    				},4500);
    			</script>
    			
    			<!-- 导航 -->
    			<div class="navbar-container" id="navcontainer">
					<ul class="navbar-list" id="navlist">
						<c:forEach items="${leftList}" var="item">
							<li class="navbar-list-item" datatype="${item.id }">
							<span>${item.name }</span>
							<span class="navbar-list-item-icon iconfont icon-jiantouyou" datatype="${item.id }"></span>
							</li>	
								<div class="navbar-list-item-section" id="childe" style="display: none;" datatype="${item.id }">
									<ul class="navbar-list-ul">
										<li class="navbar-list-li">
										<c:forEach items="${item.sub}" var="subitem"> 
											<a class="navbar-list-item-section-name log-navbar-item" href="<%=path%>/door/tosubject/${subitem.id}.action" target="_blank">${subitem.name }</a>
										</c:forEach>
										</li>
									</ul>
								</div>
						</c:forEach>
					</ul>
					
				</div>
    			<!--导航结束-->
    			
    		</div>
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
<script type="text/javascript" src="<%=path%>/door/js/index.js"></script>
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
