package com.adultexample.door.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.adultexample.constant.Common;
import com.adultexample.door.service.DIndexService;
import com.adultexample.door.service.PreService;
import com.adultexample.pojo.SCust;
import com.adultexample.pojo.TQuestionWithBLOBs;
import com.adultexample.utils.DateUtil;

@Controller
@RequestMapping("per")
public class DPreController {
	
	@Autowired
	PreService preService;
	
	//查看试卷详情
	@RequestMapping("like")
	public ModelAndView toheart(HttpSession session){
		ModelAndView mav = new ModelAndView("door/heart");
		//查找登录的用户
		SCust cust = (SCust)session.getAttribute(Common.WEB_CURRENT_USER_STRING);
		//查找所有问题
		List<TQuestionWithBLOBs> questioncon = preService.findQuestions(cust.getId());
		mav.addObject("questioncon", questioncon);
		return mav;
	}
	
	//收藏功能
	@ResponseBody
	@RequestMapping("heart")
	public Map clickheart(Integer qid,HttpSession session){
		Map map = new HashMap();
		String res = "操作失败";
		map.put("flag", res);
		SCust cust = (SCust)session.getAttribute(Common.WEB_CURRENT_USER_STRING);
		Integer custid = cust.getId();
		//试题是否已经被收藏过
		boolean cun = preService.findCunzai(qid,custid);
		//判断是否已经存在
		if(!cun){
			//不存在，进行收藏
			boolean flag = preService.saveHeart(qid,custid);
			if(flag){
				res="收藏成功";
				map.put("flag", res);
			}
		}else{
			res = "已收藏,不能重复收藏";
			map.put("flag",res);
		}
		return map;
		
	}
}
