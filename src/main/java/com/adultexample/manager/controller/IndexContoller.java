package com.adultexample.manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.adultexample.constant.Common;
import com.adultexample.manager.dto.LeftData;
import com.adultexample.manager.service.ResourceService;
import com.adultexample.manager.service.SuserService;
import com.adultexample.pojo.SUser;

@Controller
@RequestMapping("index")
public class IndexContoller {

	@Autowired
	private SuserService uSuserService;
	@Autowired
	ResourceService resourceService;
	
	@RequestMapping("page")
	public ModelAndView toPage(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("manager/index");
		HttpSession session = request.getSession();
		SUser user = (SUser)session.getAttribute(Common.CURRENT_USER_STRING);
		mav.addObject("uname", user.getRealname());
		return mav;
	}
	//获取左侧列表
	//获取资源数据
		@ResponseBody
		@RequestMapping("data")
		public List jsonData(HttpSession session){
			List result=null;
			SUser user=(SUser)session.getAttribute(Common.CURRENT_USER_STRING);
			Integer roleid = user.getRoleid();
			result=resourceService.selectByRoleId(roleid);
			return result;
		}
	
	
}
