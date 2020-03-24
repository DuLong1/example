<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>

<title>My JSP 'demo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <link rel="stylesheet" href="<%=path %>/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
	
<script type="text/javascript" src="<%=path %>/js/zTree_v3/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/zTree_v3/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=path %>/js/zTree_v3/js/jquery.ztree.excheck.js"></script>
</head>

<body>
<h1 style="margin: 0 auto;width:180px;line-height:80px;" >树状菜单</h1>
<div class="ztree" id="treeDemo" style="margin: 0 auto;width:180px;">
</div>
<a></a>

</body>
<SCRIPT LANGUAGE="JavaScript">
   var zTreeObj;
   
   // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
   
    var setting = {
			check: {
				enable: true,
			},
			data: {
				simpleData: {
					enable: true,
					idKey: "id",
					pIdKey: "pId",
					rootPId: 0
				}
			},
			callback: {
				onCheck: onCheck
			}
		};
   
   
   //event对象   treeID 创建数时指定的id  treenode节点的json对象
   function onCheck(e, treeId, treeNode) {
	   $.getJSON("<%=path %>/resource/sava.action?resourceId="+treeNode.id+"&resourcePid="+treeNode.pId+"&roleId=${roleId}",function(res){
		   
	   });
		
	}

   
   // zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
   var zNodes=JSON.parse('${jsonStr }');
   $(function(){
	   zTreeObj = $.fn.zTree.init($(".ztree"), setting, zNodes);
  
   });
  </SCRIPT>
</html>
