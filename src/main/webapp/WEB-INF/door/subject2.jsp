<%@page import="com.adultexample.constant.Common"%>
<%@page import="com.adultexample.pojo.SCust"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>考试类型页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path%>/door/css/main.css">
	<link rel="stylesheet" href="https://www.tamguo.com/css/reset.css">
	<link rel="stylesheet" href="<%=path%>/door/css/iconfont.css">
	<link rel="stylesheet" href="<%=path%>/door/css/subject.css">
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
                    	String str = "<a href='"+path2+"/door/tologin.action' style='color:#fff;'>登录</a>";
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
	
	<!--主体-->
	<div class="content-wp">
        <div class="main">
    		<div class="main-container">
    			<!--二级导航开始-->
    			<div class="main-submenu">
				    <div class="submenu-contain clearfix">
				        <span class="contain-title">
				            <a href="javascript:void(0)">${subject.name}</a>
				        </span>
				        <ul class="contain-ul">
				            <li class="contain-li">
				                <a href="<%=path %>/door/tosubject/${subject.id}.action" class=" curr ">考试首页</a>
				            </li>
				            <li class="contain-li curr">
				                <a class="" href="<%=path %>/door/tochapterlearn/${subject.id}.action">章节学习</a>
				            </li>
				            <li class="contain-li">
				                <a class="" href="<%=path %>/door/topaper/${subject.id}-0-0-1.action">试卷练习</a>
				            </li>
				        </ul>
				    </div>
    			</div>
    			<!--二级导航结束-->
    			
    			<!--头部轮播开始-->
				
				
				<!--头部轮播结束-->
				
				<!--伴您走过-->
				<div class="withyou-container-box">
				    <div class="withyou-container">
				    	<p class="container-title">伴您走过</p>
				    	<p class="title-detail">学习中每一个阶段</p>
				    	<div class="title-underline">
				        </div>
				        <div class="withyou-main">
				        	<a class="withyou-box withyou-box-learn log-withyou-box " href="<%=path %>/door/tochapterlearn/${subject.id}.action" data-info="kp">
				        		<div class="box-title">
				        			<p class="box-title-name">章节学习</p>
				        			<p class="box-title-detail">考点各个击破</p>
				        			<div class="box-title-bg"></div>
				        		</div>
				        		<p class="box-content">串考点<span class="box-content-icon iconfont icon-right"></span></p>
				        	</a>
				        	
				        	<a class="withyou-box withyou-box-paper log-withyou-box " href="<%=path %>/door/topaper/${subject.id}-0-0-1.action" data-info="zhenti">
				        		<div class="withyou-box-mod-triangle">
				        			<div class="triangle-border"></div>
				        			<div class="triangle-inset"></div>
				        		</div>
				        		<div class="box-title">
				        			<p class="box-title-name">考试模拟</p>
				        			<p class="box-title-detail">巩固核心重点</p>
				        			<div class="box-title-bg"></div>
				        		</div>
				        		<p class="box-content">练重点<span class="box-content-icon iconfont icon-right"></span></p>
				        	</a> 
				        	
				        	<a class="withyou-box withyou-box-score log-withyou-box " href="<%=path %>/door/tozt/${subject.id}-1-0-1.action" style="cursor:pointer;" data-info="yuce">
				        		<div class="withyou-box-mod-triangle">
				        			<div class="triangle-border"></div>
				        			<div class="triangle-inset"></div>
				        		</div>
				        		<div class="box-title">
				        			<p class="box-title-name">真题下载</p>
				        			<p class="box-title-detail">真题巩固练习</p>
				        			<div class="box-title-bg"></div>
				        		</div>
				        		<p class="box-content">练真题<span class="box-content-icon iconfont icon-right"></span></p>
				        	</a>
				        </div>
				        <div class="withyou-circle circle1"></div>
				        <div class="withyou-circle circle2"></div>
				        <div class="withyou-circle circle3"></div>
				    </div>
				</div>
    			<!--伴您走过-->
    			
    			
    			
    			<!-- 页尾开始-->
    			<div class="gaokao-crumbs-box">
				    <div class="homepage-crumbs">
				        <a href="<%=path%>/door/toindex.action">成人题库网</a> &gt;
				        <a href="<%=path %>/door/tosubject/${subject.id}.action" class="cur-crumbs">${subject.name }</a> 
				    </div>
				</div>
    			<!-- 页尾结束-->
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

	
<script type="text/javascript" src="https://www.tamguo.com/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="https://www.tamguo.com/js/jquery.iDialog.js"></script>
<script type="text/javascript" src="https://www.tamguo.com/js/main.js"></script>
<script type="text/javascript" src="https://www.tamguo.com/js/subject.js"></script>
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
