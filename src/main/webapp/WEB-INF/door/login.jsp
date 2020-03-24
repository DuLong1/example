<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录_成人自考题库网</title>
		<link rel="stylesheet" href="<%=path%>/door/css/reset.css"/>
		<link rel="stylesheet" href="<%=path%>/door/css/member/login.css" />
		<link type="favicon" rel="shortcut icon" href="<%=path%>/door/images/favicon.png" /> 
	</head>
	<%
		Cookie[] cookies = request.getCookies();
		String nickname =null;
		String pwd = null;
		if(cookies!=null&&cookies.length!=0){
			for(int i = 0;i<cookies.length;i++){
				if("nickname".equals(cookies[i].getName())){
					nickname = URLDecoder.decode(cookies[i].getValue(),"utf-8");
				}
				if("pwd".equals(cookies[i].getName())){
					pwd = URLDecoder.decode(cookies[i].getValue(),"utf-8");
				}
						
			}
		}
	 %>
		
	<body>
		<div id="wrapper" class="">
			<div id="head">
				<div class="mod-header">
				</div>
			</div>
			<div id="nav">
				<div class="nav-2">
					<div class="mod-nav clearfix">
						<h1 class="page-type-notab"></h1>
					</div>
				</div>
			</div>
			<div id="content" style="display: block;">
				<div class="clearfix ">
					<div class="login-form">
						<div class="login-wrapper">
							<div id="login" class="tang-pass-login animation" style="display: block; visibility: visible; opacity: 1;">
								<form id="TANGRAM__PSP_3__form" action="<%=path%>/door/login.action" class="pass-form pass-form-normal" method="POST" autocomplete="off">
									<p class="pass-form-logo">用户名密码登录</p>
									<p id="TANGRAM__PSP_3__errorWrapper" class="pass-generalErrorWrapper">
										<span id="TANGRAM__PSP_3__error" class="pass-generalError pass-generalError-error" th:text="${msg}"></span>
									</p>
									<p id="TANGRAM__PSP_3__MakeTextWrapper" class="pass-make-text" style="display:none;"></p>
									<p id="TANGRAM__PSP_3__hiddenFields" style="display:none"></p>
									<p id="TANGRAM__PSP_3__userNameWrapper" class="pass-form-item pass-form-item-userName" style="display:">
										<input type="text" style="display:none;">
										<input  placeholder="手机/邮箱/用户名" id="TANGRAM__PSP_3__userName" type="text" name="nickname" class="pass-text-input pass-text-input-userName open" autocomplete="off" value="<%=nickname%>">
										<span id="TANGRAM__PSP_3__userName_clearbtn" class="pass-clearbtn pass-clearbtn-userName" style="display: none; visibility: visible; opacity: 1;"></span>
										<span id="TANGRAM__PSP_3__userNameTip" class="pass-item-tip pass-item-tip-userName" style="display:none"><span id="TANGRAM__PSP_3__userNameTipText" class="pass-item-tiptext pass-item-tiptext-userName"></span></span>
										<span class="pass-item-selectbtn pass-item-selectbtn-userName" style="display: none; visibility: hidden; opacity: 1;"></span>
									</p>
									<p id="TANGRAM__PSP_3__passwordWrapper" class="pass-form-item pass-form-item-password" style="display:">
										<input type="password" style="display: none;">
										<input placeholder="密码" id="TANGRAM__PSP_3__password" type="password" name="pwd" class="pass-text-input pass-text-input-password" readonly onfocus="this.removeAttribute('readonly');" value="<%=pwd%>" >
										<span id="TANGRAM__PSP_3__password_clearbtn" class="pass-clearbtn pass-clearbtn-password" style="display:none;"></span>
											<span id="TANGRAM__PSP_3__passwordTip" class="pass-item-tip pass-item-tip-password" style="display:none"><span id="TANGRAM__PSP_3__passwordTipText" class="pass-item-tiptext pass-item-tiptext-password">
											</span>
										</span>
									</p>
									
									<p id="TANGRAM__PSP_3__memberPassWrapper" class="pass-form-item pass-form-item-memberPass">
										<input id="TANGRAM__PSP_3__memberPass" type="checkbox" name="remeber" value="1" class="pass-checkbox-input pass-checkbox-memberPass" checked="checked">
										<label for="TANGRAM__PSP_3__memberPass" id="TANGRAM__PSP_3__memberPassLabel" class="">下次自动登录</label>
									</p>
									<p id="TANGRAM__PSP_3__submitWrapper" class="pass-form-item pass-form-item-submit">
										<input id="TANGRAM__PSP_3__submit" type="submit" value="登录" class="pass-button pass-button-submit">
									</p>
								</form>
							</div>
							<div class="tang-pass-footerBar" style="margin-top:17px;">
								<p class="tang-pass-footerBarULogin pass-link" title="第三方登录" data-type="normal" id="TANGRAM__PSP_3__footerULoginBtn"></p>
								<div class="tang-pass-footerBarPhoenix"><span class=""></span>
									<div class="tang-pass-footerBarPhoenixItem" id="TANGRAM__PSP_3__PhoenixItem">
										<div id="pass-phoenix-login" class="tang-pass-login-phoenix">
											<div id="pass-phoenix-list-login" class="pass-phoenix-list clearfix">
												<div class="pass-phoenix-btn clearfix" id="pass_phoenix_btn">
													<ul class="bd-acc-list">
														<li class="bd-acc-qzone" data-dialog="1" data-acc="15" data-height="450" data-width="750">
															<a class="phoenix-btn-item" style="display:none;" href="#" data-title="qzone" title="QQ帐号"></a>
														</li>
														<li class="bd-acc-tsina" data-dialog="1" data-acc="2" data-height="669" data-width="800">
															<a class="phoenix-btn-item" style="display:none;" href="#" data-title="tsina" title="新浪微博"></a>
														</li>
														<li class="bd-acc-weixin" data-dialog="1" data-acc="42" data-height="450" data-width="850">
															<a class="phoenix-btn-item" style="display:none;" href="#" data-title="weixin" title="微信"></a>
														</li>
													</ul>
												</div>
											</div>
											<div class="clear"></div>
										</div>
									</div>
								</div>
								<a class="pass-reglink pass-link" href="<%=path%>/door/register.action" target="_blank">立即注册</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="foot">
				<div class="mod-footer">
					<div class="copy-box">2020&nbsp;©裴晶</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" >
	</script>
	<script type="text/javascript" src="<%=path%>/door/js/jquery-1.8.3.min.js" ></script>
	<script type="text/javascript" src="<%=path%>/door/js/member/login.js"></script>
	<script>
		if(${flag==1}){
			alert("用户名或密码错误");
		}	
		if(${flagg == "注册成功"}){
			alert("注册成功");
		}
	</script>
</html>
