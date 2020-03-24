package com.adultexample.manager.controller.setting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.adultexample.manager.service.CustService;
import com.adultexample.pojo.SCust;
import com.adultexample.utils.PageStr;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("cust")
public class CustController {

	@Autowired
	CustService custService;
	
	@RequestMapping("data")
	public ModelAndView todata(@RequestParam(required=true,defaultValue="1") Integer pageNumber,@RequestParam(required=true,defaultValue="3") Integer pageSize,String checkname){
		ModelAndView mav = new ModelAndView("manager/cust/data");
		PageInfo<SCust> pageInfo = custService.findPageData(pageNumber,pageSize,checkname);
		PageStr pageStr = new PageStr(pageInfo);
		mav.addObject("page",pageStr);
		mav.addObject("checkname", checkname);
		return mav;
		
	}
	
}
