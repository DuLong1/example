<%@page import="com.adultexample.constant.Common"%>
<%@page import="com.adultexample.pojo.SCust"%>
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
    <title>章节练习试题</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path%>/door/css/main.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/door/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/door/css/iconfont.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/door/css/questionList.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/door/css/footer.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/door/css/member/minilogin.css">
	<link type="favicon" rel="shortcut icon" href="<%=path%>/door/images/favicon.png">
	<link rel="stylesheet" href="<%=path%>/css/iconfont.css">
	<style>
		.answer{
			position: fixed; left: 841.5px; top: 162px; display: block;
		}
		.nofound{
			display:none !important;
		}
	</style>
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
	<!--头部结束  -->
	
</div>


<script src="https://zz.bdstatic.com/linksubmit/push.js"></script>
<script src="https://hm.baidu.com/hm.js?877e9c9ef462fe55b7750d478a41c981"></script>
<script type="text/javascript">
var mainHttp = "https:\/\/www.tamguo.com\/";
</script>	
	
	<div class="content-wp">
        <div class="main">
        	<!--头部章节信息  -->
        	<div class="title-bar">
			    <div class="title-inner">
			        <ul class="paper-crumbs clearfix">
			            <a href="javascript:void(0)" class="crumbs-link">
			                	<li>章节学习</li>
			                    <li>&nbsp;·&nbsp;${subname }</li>
			                	<li class="last">&nbsp;·&nbsp;${chaptername }</li>
			            </a>
			        </ul>
			        <ul class="quic-nav clearfix">
			            <li class="title">${chaptername }</li>
			        </ul>
			    </div>
			</div>
      	  <!--头部章节信息结束  -->
      	  <!-- 试题部分 -->
        	<div class="bd-content" style="visibility: visible;">
	        	<div class="quelist-wrap">
	        	<!--问题  -->
	        		<c:forEach items="${chapterquestion}" var="item" varStatus="info">
	                  <div class="question-box que-multi  last" onclick="showanswer(this)" data-id="${item.id}" data-index="${info.index+1}">
						    <div class="question-box-inner">
						        <span class="queindex-wrap">
						        	<span class="queindex">${info.index+1 }</span>
						        </span>
						        
						        <span class="pieces">
					                <c:if test="${item.questionType ==1 }">单选题</c:if>
					                <c:if test="${item.questionType ==2 }">多选题</c:if>
					                <c:if test="${item.questionType ==3 }">解答题</c:if>
						        </span>
						        <span class="heart-per shoucang" id="shoucang_${item.id }"  data-qid="${item.id }"><i class="iconfont icon-shoucang"></i></span>
						       
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
								    <a class="view-link" href="javascript:void(0)">查看题目解析 &gt;</a>
								</div>
						    </div>	
					</div>
					</c:forEach>
					<!--问题结束  -->
					
			        <div class="nexttolearn">
					    <div class="next-inner clearfix">
					    		<a href="<%=path %>/door/chapterquestion/${chapterid}-<c:if test="${pageNum>=total}">${pageNum}</c:if><c:if test="${pageNum<total}">${pageNum+1}</c:if>.action" class="tolearn">下一页</a>
					    </div>
					    <span class="done" style="margin-left: -31px; left: 50%;">
					            已完结
					    </span>
					</div>
	                <div class="crumbs">
	                    <a href="<%=path%>/door/toindex.action">成人题库网</a>
	                    <a href="<%=path%>/door/tosubject/${subid}.action">${subname}</a>
	                    <a href="<%=path%>/door/chapterquestion/${subid}.action">&gt;${chaptername}</a> &gt;
	                 </div>
	
	        </div>
	        <script type="text/javascript" src="<%=path%>/door/js/jquery-1.8.3.min.js"></script>
	        <script>
	        	function showanswer(e){
	        		var id = $(e).data("id");
	        		$(".queanalyse-wrap").filter("[data-id="+id+"]").addClass("answer").removeClass("nofound").siblings(".sub").removeClass("answer").addClass("nofound");
	        	}
	        	
	        </script>
	        <!--解析部分  -->
			<c:forEach items="${chapterquestion}" var="item" varStatus="info">
	        <div class="queanalyse-wrap sub"  data-id="${item.id}">
			   <div class="close-btn"></div>
			   <div class="content-wrap" id="queanalyse-content" tabindex="0" style="overflow: hidden; position: relative; outline: none;">
			   <div class="analyse-content" style="transform: translate3d(0px, 0px, 0px);">
			   <div class="que-title-wrap"> 
			   <div class="title" > 
				   <span class="content-wrap"> 
				   	   <span class="dt-index">${info.index+1 }</span> 
					   <span class="content"> 
					   <span style="display:  none "> 第(${info.index+1 })小题</span>正确答案及相关解析 </span> 
				   </span> 
			   </div> 
			   <hr style="display:  none ">
			   </div>
			   <div class="exam-answer"> 
			   		<h3 class="exam-answer-title">正确答案</h3>  
			   		<div class="answer-item"> 
			   		<div class="content exam-answer-content bdjson"> 
			   			${item.answer }
			   		</div> 
			   		</div> 
			   	</div>
			   	<div class="exam-analysis exam-info"> 
			   		<h3 class="exam-analysis-title">
			   		<span class="ic analysis-ic">解析</span></h3> 
			   		<div class="content exam-analysis-content bdjson"> 
			   			${item.analysis } 
			   		</div>
			   	</div> 
			   	</div>
			    <div id="ascrail2000" class="nicescroll-rails nicescroll-rails-vr" style="width: 5px; z-index: 5555; cursor: default; position: absolute; top: 0px; right: 0px; touch-action: none; height: 859px; opacity: 0; display: none;"><div class="nicescroll-cursors" style="position: relative; top: 0px; float: right; width: 5px; height: 0px; background-color: rgb(219, 219, 219); border: 0px; background-clip: padding-box; border-radius: 5px; touch-action: none;"></div></div><div id="ascrail2000-hr" class="nicescroll-rails nicescroll-rails-hr" style="height: 5px; z-index: 5555; position: absolute; left: 0px; bottom: 0px; cursor: default; width: 354px; opacity: 0; display: none;"><div class="nicescroll-cursors" style="position: absolute; top: 0px; height: 5px; width: 0px; background-color: rgb(219, 219, 219); border: 0px; background-clip: padding-box; border-radius: 5px; left: 0px;"></div></div></div>
			</div>
			</c:forEach>
			<!--解析部分结束  -->
    </div>
    <!--试题部分结束  -->
    </div>
</div>



<!--尾部-->
	
	
<div class="mask firstleader"></div>

<script type="text/javascript" src="<%=path%>/door/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/door/js/jquery.iDialog.js"></script>
<script type="text/javascript" src="<%=path%>/door/js/main.js"></script>
<script type="text/javascript" src="<%=path%>/door/js/questionList.js"></script>
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
				console.log($("#shoucang_"+qid).children("i").attr("class"));
					$("#shoucang_"+qid).children("i").addClass("icon-shoucang1");
					console.log($("#shoucang_"+qid).children("i").attr("class"));
					
					alert(res.flag);
				}else{
					console.log($("#shoucang_"+qid).children("i").attr("class"));
					$("#shoucang_"+qid).children("i").addClass("icon-shoucang1");
					alert(res.flag);
					console.log($("#shoucang_"+qid).children("i").attr("class"));
				}
			}
		});
		e.stopPropagation();
	});
</script>
</body>
</html>
