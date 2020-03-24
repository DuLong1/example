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
    
    <title>试卷详情页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path%>/door/css/main.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/door/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/door/css/iconfont.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/door/css/footer.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/door/css/paper.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/door/css/member/minilogin.css">
	<link type="favicon" rel="shortcut icon" href="<%=path%>/door/images/favicon.png">
	<link rel="stylesheet" href="<%=path%>/css/iconfont.css">
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
		
	<div class="content-wp">
         <div class="main">
                    
		    <div class="title-bar">
			    <div class="title-inner">
			        <ul class="paper-title clearfix">
			            <li class="title">${papername }</li>
			            <li class="learnnum">0</li>
			            <li class="down-num">0</li>
			        </ul>
			        
			        <a class="download-btn-wrap" href="<%=path%>/upload/${paper.id}.docx" download="${paper.id }.docx">
			            <span class="download-btn">
			                <span class="donwload-text">立即下载</span>
			            </span>
			        </a>
			    </div>
			</div>
			
			<!-- 下载模版 -->

			<!-- 主体内容 -->
    		<div class="bd-content" style="visibility: visible;">
	        	<div class="quelist-wrap" style="">
		        	<div class="ques-container">
		        		<div class="ques-info-wrap">
				            <span class="que-type">单选题</span>
				        </div>
						<!--问题  -->
		        		<c:forEach items="${paperdetail}" var="item" varStatus="info">
		        		 <c:if test="${item.questionType ==1 }">
		                  <div class="question-box que-multi  last" onclick="answer(this)" data-id="${item.id}" data-index="${info.index+1}">
							    <div class="question-box-inner">
							        <span class="queindex-wrap"><span class="queindex">${info.index+1 }</span></span>
							        <span class="pieces">
							        	${item.score}分
							        </span>
							        <span class="heart-per shoucang" data-qid="${item.id }"><i class="iconfont icon-shoucang"></i></span>
							        <div class="que-stem">
							            <div class="questem-inner bdjson">
							            	${item.content}
										</div>
							        </div>
									<div class="que-options">
										<div class="queoptions-inner bdjson clearfix">
											
										</div>
									</div>
							        <div class="view-analyse">
									    <a class="view-link" href="javascript:void(0)" data-index="${info.index+1}" onclick="answer(this)" data-id="${item.id }">查看题目解析 &gt;</a>
									</div>
							    </div>	
						</div>
						</c:if>
						</c:forEach>
						<!--问题结束  -->
					</div>
		        	
		        	<div class="ques-container">
		        		<div class="ques-info-wrap">
				            <span class="que-type">多选题</span>
				        </div>
						<!--问题  -->
		        		<c:forEach items="${paperdetail}" var="item" varStatus="info">
		        		 <c:if test="${item.questionType ==2 }">
		                  <div class="question-box que-multi  last" onclick="answer(this)" data-id="${item.id}" data-index="${info.index+1}">
							    <div class="question-box-inner">
							        <span class="queindex-wrap"><span class="queindex">${info.index+1 }</span></span>
							        <span class="pieces">
							        	${item.score}分
							        </span>
							         <span class="heart-per shoucang" data-qid="${item.id }"><i class="iconfont icon-shoucang"></i></span>
							        <div class="que-stem">
							            <div class="questem-inner bdjson">
							            	${item.content}
										</div>
							        </div>
									<div class="que-options">
										<div class="queoptions-inner bdjson clearfix">
											
										</div>
									</div>
							        <div class="view-analyse">
									    <a class="view-link" href="javascript:void(0)" data-index="${info.index+1}" onclick="answer(this)" data-id="${item.id }">查看题目解析 &gt;</a>
									</div>
							    </div>	
						</div>
						</c:if>
						</c:forEach>
						<!--问题结束  -->
					</div>
		        	
		        	<div class="ques-container">
	        		<div class="ques-info-wrap">
			            <span class="que-type">解答题（综合题）</span>
			        </div>

					<!--问题  -->
	        		<c:forEach items="${paperdetail}" var="item" varStatus="info">
	        		 <c:if test="${item.questionType ==3 }">
	                  <div class="question-box que-multi  last" onclick="answer(this)" data-id="${item.id}" data-index="${info.index+1}">
						    <div class="question-box-inner">
						        <span class="queindex-wrap"><span class="queindex">${info.index+1 }</span></span>
						        <span class="pieces">
						        	${item.score}分
						        </span>
						         <span class="heart-per shoucang" data-qid="${item.id }"><i class="iconfont icon-shoucang"></i></span>
						        <div class="que-stem">
						            <div class="questem-inner bdjson">
						            	${item.content}
									</div>
						        </div>
								<div class="que-options">
									<div class="queoptions-inner bdjson clearfix">
										
									</div>
								</div>
						        <div class="view-analyse">
								    <a class="view-link" href="javascript:void(0)" data-index="${info.index+1}" onclick="answer(this)" data-id="${item.id }">查看题目解析 &gt;</a>
								</div>
						    </div>	
					</div>
					</c:if>
					</c:forEach>
					<!--问题结束  -->
				</div>
		
                <div class="crumbs">
                    <a href="<%=path%>/door/toindex.action">成人题库网</a>
                    <span>&gt;${papername}</span>
                 </div>
	            </div>
	        	
	        <div class="queanalyse-wrap" style="position: fixed; left: 841.5px; top: 162px; height: 757px; display: none;">
			   <div class="close-btn"></div>
			   <div class="content-wrap" id="queanalyse-content" style="overflow: hidden; position: relative; outline: none;" tabindex="0">
			   <div class="analyse-content" style="transform: translate3d(0px, 0px, 0px);">
			   <div class="que-title-wrap"> 
			   <div class="title"> 
				   <span class="content-wrap"> 
				   	   <span class="dt-index" id="anindex"></span> 
					   <span class="content"> 
					   <span style="display:none" id="anindex2"></span>正确答案及相关解析 </span> 
				   </span> 
			   </div> 
			   <hr style="display:  none ">
			   </div>
			   <div class="exam-answer"> 
			   		<h3 class="exam-answer-title">正确答案</h3>  
			   		<div class="answer-item"> 
			   		<div class="content exam-answer-content bdjson" id="answercon"></div> 
			   		</div> 
			   	</div>
			   	<div class="exam-analysis exam-info"> 
			   		<h3 class="exam-analysis-title">
			   		<span class="ic analysis-ic">解析</span></h3> 
			   		<div class="content exam-analysis-content bdjson" id="analysiscon"></div>
			   	</div> 
			   	</div>
			    <div class="nicescroll-rails nicescroll-rails-vr" id="ascrail2000" style="width: 5px; z-index: 5555; cursor: default; position: absolute; top: 0px; right: 0px; touch-action: none; height: 859px; opacity: 0; display: none;"><div class="nicescroll-cursors" style="position: relative; top: 0px; float: right; width: 5px; height: 0px; background-color: rgb(219, 219, 219); border: 0px; background-clip: padding-box; border-radius: 5px; touch-action: none;"></div></div><div class="nicescroll-rails nicescroll-rails-hr" id="ascrail2000-hr" style="height: 5px; z-index: 5555; position: absolute; left: 0px; bottom: 0px; cursor: default; width: 354px; opacity: 0; display: none;"><div class="nicescroll-cursors" style="position: absolute; top: 0px; height: 5px; width: 0px; background-color: rgb(219, 219, 219); border: 0px; background-clip: padding-box; border-radius: 5px; left: 0px;"></div></div></div>
			    
			</div>
   	 	</div>
 	</div>
</div>
<div class="mask firstleader"></div>

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
<script type="text/javascript" src="<%=path %>/door/js/paper.js"></script>
<script>
	function answer(e){
		var id = $(e).data("id");
		var index = $(e).data("index");
		$.ajax({
			url:"<%=path%>/door/answer.action?id="+id,
			success: function(res){
				$("#anindex").text(index);
				$("#anindex2").text("第("+index+")小题");
				$("#answercon").text(res.answer);
				$("#analysiscon").text(res.analysis);
			}
		});
	}	        		
</script>
<script>
   	$("#loginbut").hover(function(){
   		$("#loginOption").toggleClass("dis-none");
   	});
   	if(${flag==999}){
   		alert("登录后才能查看此功能");
   	}
</script>
<script>
	$(".shoucang").mouseenter(function(){
		$(this).children("i").removeClass("icon-shoucang").addClass("icon-shoucang1");
	});
	$(".shoucang").mouseleave(function(){
		$(this).children("i").removeClass("icon-shoucang1").addClass("icon-shoucang");
	});
	$(".shoucang").click(function(e){
		var qid = $(this).data("qid");
		$.ajax({
			url:"<%=path%>/per/heart.action?qid="+qid,
			success:function(res){
				if("收藏成功"== res.flag){
					$(".shoucang").children("i").removeClass("icon-shoucang").addClass("icon-shoucang1");
					alert(res.flag);
				}else{
					alert(res.flag);
				}
			}
		});
		e.stopPropagation();
	});
</script>
</body>
</html>
