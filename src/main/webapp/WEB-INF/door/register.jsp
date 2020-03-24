<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="UTF-8">
<title>注册</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet"
	href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
<link href="<%=path%>/css/dlstyle.css" rel="stylesheet" type="text/css">
<link type="favicon" rel="shortcut icon" href="<%=path%>/door/images/favicon.png">
<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>

<body>

	<div class="res-banner">
		<div class="res-main">
			<div class="login-banner-bg">
				<span></span><img src="<%=path%>/images/tiku.png" />
			</div>
			<div class="login-box">

				<div class="am-tabs" id="doc-my-tabs">
					<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
						<li class="am-active"><a href="">邮箱注册</a></li>
						<li><a href="">手机号注册</a></li>
					</ul>

					<div class="am-tabs-bd">
						<div class="am-tab-panel am-active">
							<form method="post" id="emal"
								action="<%=path%>/door/ppregister.action">
								<div class="user-email">
									<label for="email"><i class="am-icon-envelope-o"></i> </label>
									<input type="email" name="emain" id="email"
										placeholder="请输入邮箱账号">
								</div>
								<div class="user-pass">
									<label for="password"><i class="am-icon-lock"></i> </label> <input
										type="password" name="pwd" id="password" placeholder="设置密码">
								</div>
								<div class="user-pass">
									<label for="passwordRepeat"><i class="am-icon-lock"></i>
									</label> <input type="password" name="passwordRepeat"
										id="passwordRepeat" placeholder="确认密码">
								</div>
							</form>
							<div class="login-links">
								<label for="reader-me"> <input id="emailid" 
									type="checkbox"> 点击表示您同意《服务协议》 </label>
							</div>
							<div class="am-cf">
								<input type="submit" name="register" onclick="emal()" value="注册"
									class="am-btn am-btn-primary am-btn-sm am-fl" />
							</div>

						</div>

						<div class="am-tab-panel">
							<form method="post" id="emal2"
								action="<%=path%>/door/ppregister.action">
								
								<input type="hidden" id="smscode"/>
								<div class="user-phone">
									<label for="phone"><i
										class="am-icon-mobile-phone am-icon-md"></i> </label> <input
										type="tel" name="mobile" id="phone" placeholder="请输入手机号">
								</div>
								<div class="verification">
									<label for="code"><i class="am-icon-code-fork"></i> </label> <input
										type="tel" name="code" id="code" placeholder="请输入验证码">
									<a class="btn" href="javascript:void(0);" id="sendMobileCode">
									    <span id="dyMobileButton">获取</span> 
									</a>
								</div>
								<div class="user-pass">
									<label for="password"><i class="am-icon-lock"></i> </label> <input
										type="password" name="pwd" required="required" id="password2"
										placeholder="设置密码">
								</div>
								<div class="user-pass">
									<label for="passwordRepeat"><i class="am-icon-lock"></i>
									</label> <input type="password" required="required" name="passwordRepeat2"
										id="passwordRepeat2" placeholder="确认密码">
								</div>
							</form>
							<div class="login-links">
								<label for="reader-me"> <input id="phoneid"
									type="checkbox"> 点击表示您同意《服务协议》 </label>
							</div>
							<div class="am-cf">
								<input type="button" name="register" value="注册"
									onclick="emal2()" class="am-btn am-btn-primary am-btn-sm am-f2">
							</div>

							<hr>
						</div>


						<script>
						$(function() {
							$('#doc-my-tabs').tabs();
							//邮箱注册
							if(${flag!=null && flag!=''}){
								alert('${flag}');}
						});
						//邮箱注册
						function emal() {
							var emails = document.getElementById("email").value;
							var emailReg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
							if (!emailReg.test(emails)) {
								alert("email格式不正确");
								return false;
							}
							
							var pwd = document.getElementById("password").value;
							var repeat = document.getElementById("passwordRepeat").value;
							if (pwd != repeat) {
								alert("两次密码输入不一致");
								return false;
							}
							if($("#emailid").is(':checked')){
						        $("#emal").submit();
						       }else{
						        alert("请勾选协议")
						       }
							return true;
						}
						
						//手机号注册
						function emal2() {
							var phones = document.getElementById("phone").value;
							var phoneReg = /^1[3456789]\d{9}$/;
							if (!phoneReg.test(phones)) {
								alert("手机号格式不正确");
								return false;
							}

							var codes = document.getElementById("code").value;
							if (codes == "") {
								alert("验证码不能为空")
								return false;
							} else if (codes != $("#smscode").val()) {
								alert("验证码输入错误")
								return false;
							}

							var pwd2 = document.getElementById("password2").value;
							var repeat2 = document
									.getElementById("passwordRepeat2").value;
							if (pwd2 != repeat2) {
								alert("两次密码输入不一致");
								return false;
							}
							if($("#phoneid").is(':checked')){
						        $("#emal2").submit();
						       }else{
						        alert("请勾选协议")
						        return false;
						       }
						}
						
					
						//
						$("#dyMobileButton").click(function(){
							var phones = document.getElementById("phone").value;
							$.ajax({
								url:"<%=path%>/door/sendSms.action?t="+new Date(),
								data:{"mobile":phones},
								method:'post',
								success : function(res) {
									alert(res.smsflag);
									$("#smscode").val(res.code);
									}
								});
						});
				
						</script>
					</div>
				</div>

			</div>
		</div>

		<div class="footer ">
				<div class="footer-hd ">
					<p style="text-align: center">
						<a href="javascript:void(0)">首页</a> <b>|</b> <a href="javascript:void(0)">首页</a>
						<a href="javascript:void(0)">首页</a> <b>|</b> <a href="javascript:void(0)">首页</a>
					</p>
				</div>
				<div class="footer-bd ">
					<p style="text-align: center">
						<a href="javascript:volid(0);">关于</a> <a href="javascript:volid(0);">合作伙伴</a> <a href="javascript:volid(0);">联系我们</a>
						<a href="javascript:volid(0);">网站地图</a> <em>© 2019-2025 peijing.com 版权所有</em>
					</p>
				</div>
			</div>
</body>

</html>