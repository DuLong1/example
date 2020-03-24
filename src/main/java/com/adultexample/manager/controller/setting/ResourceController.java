package com.adultexample.manager.controller.setting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.adultexample.manager.service.ResourceService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("resource")
public class ResourceController {
	@Autowired
	ResourceService service;

	@RequestMapping("data")
	public ModelAndView toData() {
		ModelAndView mav = new ModelAndView("manager/resource/data");
		return mav;
	}

	@ResponseBody
	@RequestMapping("resourceAll")
	public List getResourceAll() {
		List result = service.selectAll();
		return result;
	}

	@RequestMapping("roleRes")
	public ModelAndView toRes(Integer roleId) throws JsonProcessingException {
		ModelAndView mav = new ModelAndView("manager/role/roleRes");
		List list = service.selectRes(roleId);
		String jsonStr = new ObjectMapper().writeValueAsString(list);
		mav.addObject("jsonStr", jsonStr);
		mav.addObject("roleId", roleId);
		return mav;

	}

	@ResponseBody
	@RequestMapping("sava")
	public Map savaOrDelRoleRes(Integer roleId, Integer resourceId,Integer resourcePid) {
		Map map = new HashMap();
		boolean status=service.savaOrDeleteSQL(roleId, resourceId,resourcePid);
		map.put("status", status);
		return map;
	}
}
