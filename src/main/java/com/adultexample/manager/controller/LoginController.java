package com.adultexample.manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.adultexample.constant.Common;
import com.adultexample.manager.service.SuserService;
import com.adultexample.pojo.SUser;
import com.adultexample.utils.MD5Utils;

@Controller
@RequestMapping("manager")
public class LoginController {

	@Autowired
	SuserService suserService;

	@RequestMapping("login")
	public String login(String uname, String password, String code,
			HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 验证验证码是否正确
		// 验证码输入错误
		if (!testCode(session, code)) {
			return "redirect:/login.jsp?flag=0";
		}
		//密码加密后进行比较
		password = MD5Utils.string2MD5(password);
		//验证用户名密码
		SUser user = suserService.findUser(uname, password);
		//用户名密码不正确11
		if(user==null){
			return "redirect:/login.jsp?flag=1";
		}
		//存到session作用域
		session.setAttribute(Common.CURRENT_USER_STRING,user);
		//将姓名存到request作用域
		request.setAttribute("uname", user.getLoginaccount());
		return "redirect:/index/page.action";
	}
	
	/**
	 * 进行验证码判断
	 * @param session
	 * @param code
	 * @return
	 */
	public boolean testCode(HttpSession session, String code) {
		// 获取自动生成的验证码
		String trueCode = (String) session.getAttribute(Common.KAPTCHA_SESSION_KEY);
		// 进行验证
		if(trueCode.equals(code)){
			return true;
		}
		return false;
	}
	

}
