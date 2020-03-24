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
	<title>题目编辑</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="<%=path %>/layui/layui/css/layui.css" media="all" />
	
</head>
<body class="childrenBody">
	<form class="layui-form" action="<%=path %>/question/save.action" style="width:500px;height:100%" method="post" target="_parent" onsubmit="return check()">
		<input type="hidden" name="id" value="${question.id }" >
		
		<div class="layui-form-item">
			<label class="layui-form-label">题目类型</label>
			<div class="layui-input-block">
				<select name="questionType" >
					<option value="1" <c:if test="${question.questionType==1}">selected</c:if>>单选题</option>
					<option value="2" <c:if test="${question.questionType==2}">selected</c:if>>多选题</option>
					<option value="3" <c:if test="${question.questionType==3}">selected</c:if>>解答题</option>
				</select>
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">分数</label>
			<div class="layui-input-block">
				<input type="number" name="score" value="${question.score}"  class="layui-input newsName" lay-verify="required" placeholder="请输入题目分数">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">题目内容</label>
			<div class="layui-input-block">
			
				<input type="hidden" required="required" value='${question.content}'  name="content" id="contentsave">
				
				<!-- 加载编辑器的容器 -->
			    <script id="text"  type="text/plain">
              		内容
    			</script>
    			<button class="layui-btn" lay-submit="" id="btn1"  onclick="javascript:void(0)">保存</button>
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">答案</label>
			<div class="layui-input-block">
				<input type="hidden" required="required" value='${question.answer}' name="answer" id="answersave">
				<!-- 加载编辑器的容器 -->
			    <script id="answer"  type="text/plain">
              		答案
    			</script>
    			<button class="layui-btn" lay-submit="" id="btn2"  onclick="javascript:void(0)">保存</button>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">解析</label>
			<div class="layui-input-block">
			<input type="hidden" required="required" value='${question.analysis}' name="analysis" id="analysissave">
				<!-- 加载编辑器的容器 -->
			    <script id="analysis"  type="text/plain">
              		解析
    			</script>
    			<button class="layui-btn" lay-submit="" id="btn3"  onclick="javascript:void(0)">保存</button>
			</div>
		</div>
		
		
		<div class="layui-form-item">
			<label class="layui-form-label">所属考试类型</label>
			<div class="layui-input-block">
				<select name="subjectId" onchange="getchapterList(this)">
					<c:forEach items="${subList }" var="item">
						<option value="${item.id }" <c:if test="${item.id==question.subjectId }">selected</c:if>>${item.name }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">所属章节</label>
			<div class="layui-input-block">
				<select name="chapterId" id="chapter">
					<c:forEach items="${chapterList }" var="item">
						<option value="${item.id }" <c:if test="${item.id==question.chapterId}">selected</c:if>>${item.name }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">状态</label>
				<div class="layui-input-inline">
					<select name="auditStatus" class="newsLook" lay-filter="browseLook">
				        <option value="0" <c:if test="${question.auditStatus==0 }">selected</c:if>>未审核</option>
				        <option value="1" <c:if test="${question.auditStatus==1 }">selected</c:if>>审核通过</option>
				        <option value="2" selected>未通过</option>
				    </select>
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" type="submit" lay-filter="addNews">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="<%=path %>/layui/layui/layui.js"></script>
	
</body>

<!-- 配置文件 -->
  <script type="text/javascript" src="<%=path %>/utf8-jsp/ueditor.config.js"></script>
  <!-- 编辑器源码文件 -->
  <script type="text/javascript" src="<%=path %>/utf8-jsp/ueditor.all.js"></script>
  <!-- 实例化编辑器 -->
  <script type="text/javascript">
    //内容
    var content2 = UE.getEditor('text');
    //答案
    var answer = UE.getEditor('answer');
    //解析
    var analysis = UE.getEditor('analysis');

	//内容
	content2.ready(function() {
	   	//设置编辑器的内容
	    content2.setContent(document.getElementById("contentsave").value);
	    var contentsave = content2.getContent();
		document.getElementById("contentsave").value = contentsave;
    });
	document.getElementById("btn1").onclick = function(){
		var contentsave = content2.getContent();
		document.getElementById("contentsave").value = contentsave;
		return false;
	};
	
	//答案
	answer.ready(function() {
	    //设置编辑器的内容
	    answer.setContent(document.getElementById("answersave").value);
	    answersave = answer.getContent();
		document.getElementById("answersave").value = answersave;
    });

	document.getElementById("btn2").onclick = function(){
		answersave = answer.getContent();
		document.getElementById("answersave").value = answersave;
		return false;
	};
	
	//解析
	analysis.ready(function() {
	    //设置编辑器的内容
	    analysis.setContent(document.getElementById("analysissave").value);
	    analysissave = analysis.getContent();
		document.getElementById("analysissave").value = analysissave;
    });
  	document.getElementById("btn3").onclick = function(){
		analysissave = analysis.getContent();
		document.getElementById("analysissave").value = analysissave;
		return false;
	};
  </script>

<script type="text/javascript">
layui.config({
	base : "js/"
}).use(['form','layer','jquery','layedit','laydate'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		layedit = layui.layedit,
		laydate = layui.laydate,
		$ = layui.jquery;
});

function check(){
	
	var userid=document.getElementById("userid").value;
	var pwd1=document.getElementById("pwd1").value;
	var pwd2=document.getElementById("pwd2").value;
	if(userid.length!=0){
	if(pwd1!=pwd2){
		alert("两次密码不一致");
		document.getElementById("pwd1").value="";
		document.getElementById("pwd2").value="";
		return false;
	}}
	return true;
}


</script>
<script>
	function getchapterList(e){
		var subid = $(e).val();
		alert(subid);
		$.ajax({
			url:"<%=path%>/question/getchapter.action?subid="+subid,
			success:function(res){
			var str = "";
				for(var i=0;i<res.size;i++){
					str += "<option value='res[i].id' <c:if test='res[i].id==question.chapterId'>selected</c:if>>res[i].name</option>"
				}
				$("#chapter").append(str);
			}
		});
	}
</script>
</html>
