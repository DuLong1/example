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
    
    <title>章节练习</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path%>/door/css/main.css">
	<link rel="stylesheet" href="<%=path%>/door/css/reset.css">
	<link rel="stylesheet" href="<%=path%>/door/css/iconfont.css">
	<link rel="stylesheet" href="<%=path%>/door/css/chapter.css">
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
	
</div><script src="https://zz.bdstatic.com/linksubmit/push.js"></script>
<script src="https://hm.baidu.com/hm.js?877e9c9ef462fe55b7750d478a41c981"></script>
<script type="text/javascript">
var mainHttp = "https:\/\/www.tamguo.com\/";
</script>	
	
	<!--主体-->	
	<div class="content-wp">
        <div class="main">
        	<!--二级菜单开始-->
        	<div class="main-submenu">
			    <div class="submenu-contain clearfix">
			        <span class="contain-title">
			            <a href="javascript:void(0)">${subname}</a>
			        </span>
			        <ul class="contain-ul">
			            <li class="contain-li">
			                <a href="<%=path %>/door/tosubject/${subid}.action" class="">考试首页</a>
			            </li>
			            <li class="contain-li curr">
			                <a class="curr " href="<%=path%>/door/tochapterlearn/${subid}.action">章节学习</a>
			            </li>
			            <li class="contain-li">
			                <a class="" href="<%=path%>/door/topaper/${subid}-0-0-1.action">试卷练习</a>
			            </li>
			        </ul>
			    </div>
			</div>
        	<!--二级菜单结束-->
        
        	<!--章节内容开始-->
        	<div class="main-inner clearfix">
       		    <a class="backtotop iconfont icon-xiangshang" href="#" style="display: none;"></a>
       		    <div class="screening clearfix">
				    <ul class="sc-subject clearfix">
				        <li>科目:</li>
				            <li class="selected">
				                <a href="javascript:void(0)">${subname}</a>
				            </li>
				        
				    </ul>
				</div>
				<!--左侧章节列表  -->
		        <div class="list-left">
		            <div id="outline" tabindex="0" style="overflow: hidden; position: static; outline: none; height: 697px; top: 0px;">
					    <div class="outline-content" style="transform: translate3d(0px, 0px, 0px);">
					        <c:forEach items="${chapterList}" var="item" varStatus="info">
					            <div class="out-chapter show" data-chapterid="${item.id }">
					                <h3 class="k1" data-class="dct-0" title="第${info.index+1 }章  ${item.name}">
					                    <i class="iconfont icon-unie047 icon-zhankai"></i> <span>第${info.index+1 }章  ${item.name}</span>
					                </h3>
					            </div>
					            
					        </c:forEach>  
					        <div class="blank" style="height: 70px;"></div>
					    </div>
						<div id="ascrail2000" class="nicescroll-rails nicescroll-rails-vr" style="width: 15px; z-index: auto; cursor: default; position: absolute; top: 0px; right: 0px; touch-action: none; height: 697px; opacity: 0; display: block;"><div class="nicescroll-cursors" style="position: relative; top: 0px; float: right; width: 5px; height: 403px; background-color: rgb(219, 219, 219); border: 5px; background-clip: padding-box; border-radius: 5px; touch-action: none;"></div></div><div id="ascrail2000-hr" class="nicescroll-rails nicescroll-rails-hr" style="height: 15px; z-index: auto; position: absolute; left: 0px; bottom: 0px; cursor: default; display: none; width: 329px; opacity: 0;"><div class="nicescroll-cursors" style="position: absolute; top: 0px; height: 5px; width: 329px; background-color: rgb(219, 219, 219); border: 5px; background-clip: padding-box; border-radius: 5px;"></div></div></div>
		        </div>
		        <!--右侧显示列表  -->
		        <div class="list-right">
		            <div class="detail">
		            <c:forEach items="${chapterList}" var="item" varStatus="info">
					    <div class="detail-chapter" style="${info.index==0}? 'display:block;' : 'display: none;'" data-chapterid="${item.id }">
					        <div class="detail-chapter-title dct-0" id="dct-0">
					            <h3>第${info.index+1 }章  ${item.name}</h3>
					        </div>
					        <!--每章的框框  -->
					        <div class="detail-kpoint-1">
					            <div class="kpoint-1-content clearfix">
					        		<c:forEach items="${item.chapter}" var="kuang" varStatus="kuanginfo">
					                    <div class="detail-kpoint-2">
						                    <h5>${info.index+1}.${kuanginfo.index+1} ${kuang.name }</h5>
						                    <p>
						                        <span class="">
						                                <span class="count">${kuang.count}</span> 道题
						                        </span>
						                    </p>
						                    <p></p>
						                    <div class="mask" style="display: none;">
						                        <a target="_blank" href="<%=path %>/door/chapterquestion/${kuang.id }-1.action" class="do">
						                          	  马上做题
						                        </a>
						                    </div>
					                    </div>
					       		   </c:forEach>
					            </div>
					        </div>
					        <!--每章的框框结束  -->
					   </div>
			 </c:forEach>  
		   		 </div>
			</div>
			<!--右侧显示列表结束  -->
        </div>
    </div>
      <!--章节内容结束-->
    </div>
    <!--主体部分结束  -->
    
    <div class="foot">
	    <div class="crumbs">
	        <a href="https://www.tamguo.com/">探果网</a>
	        <a href="https://www.tamguo.com/subject/gaokao.html">&gt;高考</a>
	        <span>&gt;理科数学</span>
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
<script type="text/javascript" src="<%=path%>/door/js/chapter.js"></script>
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
