package com.adultexample.manager.controller.setting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.adultexample.manager.service.RoleService;
import com.adultexample.pojo.SRole;
import com.adultexample.utils.PageStr;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("role")
public class RoleController {

	@Autowired
	RoleService service;
	
	
	@RequestMapping("data")
	public ModelAndView toData(SRole role,@RequestParam(required=true,defaultValue="1") Integer pageNumber,@RequestParam(required=true,defaultValue="2") Integer pageSize){
		ModelAndView mav=new ModelAndView("manager/role/data");
		
		PageInfo page=service.selectPage(role,pageNumber,pageSize);
		PageStr pageStr=new PageStr(page);
		mav.addObject("page",pageStr);
		mav.addObject("role", role);
		return mav;
	}
	
	@RequestMapping("edit")
	public ModelAndView toEdit(SRole role){
		ModelAndView mav=new ModelAndView("manager/role/edit");
		if(role!=null && role.getId()!=null){
			role=service.selectById(role.getId());
		}
		mav.addObject("role",role);
		return mav;
	}
	
	@RequestMapping("save")
	public String save(SRole role){
		service.saveOrUpdate(role);
		return "redirect:data.action";
	}
	
	@RequestMapping("delete")
	public String delete(Integer id){
		service.deleteById(id);
		return "redirect:data.action";
	}
	
	@RequestMapping("deletes")
	public String deletes(Integer[] ids){
		service.deleteByIds(ids);
		return "redirect:data.action";
	}
	
	
	
}
