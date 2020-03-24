package com.adultexample.door.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.adultexample.door.service.RegisterService;
import com.adultexample.pojo.SCust;
import com.adultexample.utils.DateUtil;
import com.adultexample.utils.MD5Utils;
import com.adultexample.utils.SmsDemo;
import com.adultexample.utils.Snippet;
import com.aliyuncs.exceptions.ClientException;

@Controller
@RequestMapping("door")
public class DRegisterController {

	@Autowired
	private RegisterService service;
	
	@RequestMapping("ppregister")
	public ModelAndView WebRegister(SCust customer,HttpServletRequest request,
			HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		//获取注册信息
		String mobile = customer.getMobile();
		String email = customer.getEmain();
		String pwd = MD5Utils.string2MD5(customer.getPwd());
		String date=DateUtil.getTodayDate();
		
		SCust checkName =service.checkRed(customer);//用户名是否已存在
		if(checkName!=null){
			mav.setViewName("door/register");
			mav.addObject("flag", "用户名已存在");
			return mav;
		}
		SCust checkWeb = service.checkRedister(customer);//是否已注册
		if(checkWeb !=null){
			mav.setViewName("door/register");
			mav.addObject("flag", "已注册,不可重复注册");
		}else {                              //进行注册
			customer.setRegdate(date);
			customer.setMobile(mobile);
			customer.setEmain(email);
			customer.setPwd(pwd);
			service.insertWebRegister(customer);
			mav.addObject("flagg","注册成功");
			mav.setViewName("door/login");
		}
		return mav;
		
	}
	
	//发送验证码功能
	@RequestMapping("sendSms")
	@ResponseBody
	public Map mobleCode(String mobile) throws ClientException{
		Map map=new HashMap();
		String newCode = Snippet.newCode();
		SmsDemo.sendSms(mobile, newCode);
		map.put("smsflag", "已发送短信");
		map.put("code", newCode);
		return map;
	}
}