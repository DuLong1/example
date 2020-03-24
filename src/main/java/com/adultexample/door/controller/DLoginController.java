package com.adultexample.door.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.adultexample.constant.Common;
import com.adultexample.door.service.CustLoginService;
import com.adultexample.pojo.SCust;
import com.adultexample.utils.MD5Utils;

@Controller
@RequestMapping("door")
public class DLoginController {

	@Autowired
	CustLoginService custLoginService;
	
	//跳转到login界面
	@RequestMapping("tologin")
	public ModelAndView tologin(String flag){
		ModelAndView mav = new ModelAndView("door/login");
		mav.addObject("flag",flag);
		return mav;
	}
	
	//跳转到注册界面
	@RequestMapping("register")
	public String toregister(){
		return "door/register";
	}
	//进行登陆判断
	@RequestMapping("login")
	public void login(SCust cust,Integer remeber,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		String name = cust.getNickname();//表单中的
		String pwd = cust.getPwd();//表单中的
		
		//密码加密比较
		String pwd2 = MD5Utils.string2MD5(pwd);
		cust.setPwd(pwd2);
		//验证登录 用户名密码
		cust = custLoginService.findLogin(cust);
		if(cust!=null){
			//存在
			cust.setNickname(name);
			session.setAttribute(Common.WEB_CURRENT_USER_STRING, cust);
			//记住密码
			if(remeber!=null){
				//存到cookie中
				Cookie cookie = new Cookie("nickname",  URLEncoder.encode(name,"utf-8"));
				cookie.setMaxAge(7*24*60*60);
				cookie.setPath("/");
				response.addCookie(cookie);
				Cookie cookie2 = new Cookie("pwd",  URLEncoder.encode(pwd,"utf-8"));
				cookie2.setMaxAge(7*24*3600);
				cookie2.setPath("/");
				response.addCookie(cookie2);
				
			}else {
				Cookie cookie = new Cookie("nickname",  URLEncoder.encode("","utf-8"));
				cookie.setMaxAge(7*24*60*60);
				cookie.setPath("/");
				response.addCookie(cookie);
				Cookie cookie2 = new Cookie("pwd",  URLEncoder.encode("","utf-8"));
				cookie2.setMaxAge(7*24*3600);
				cookie2.setPath("/");
				response.addCookie(cookie2);
			}
			//跳转首页
			response.sendRedirect(request.getContextPath()+"/door/toindex.action");
		}else{
			//跳转到登录界面
			response.sendRedirect(request.getContextPath()+"/door/tologin.action?flag=1");
		}
		
	}
	
	
	//退出登录
	@RequestMapping("removeLogin")
	public String exit(HttpSession session){
		session.removeAttribute(Common.WEB_CURRENT_USER_STRING);
		return "redirect:toindex.action";
	}
	
	/*//注册用户名验证
	@ResponseBody
	@RequestMapping("testuname")
	public String testuname(String username){
		String res = "11";
		boolean flag = custLoginService.testUname(username);
		if(!flag){
			res = "201";
		}
		return res;
	}
	
	//注册手机号验证
	@ResponseBody
	@RequestMapping("checkMobile")
	public String testMobile(String mobile){
		String res = "11";
		boolean flag = custLoginService.testMobile(mobile);
		if(!flag){
			res = "201";
		}
		return res;
	}
	
	//发送验证码
	@ResponseBody
	@RequestMapping("sms")
	public String sendsms(String mobile){
		String res = "11";
		boolean flag = custLoginService.testMobile(mobile);
		if(!flag){
			res = "201";
		}
		return res;
	}*/

	
}
