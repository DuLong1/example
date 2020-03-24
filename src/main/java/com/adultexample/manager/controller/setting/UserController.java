package com.adultexample.manager.controller.setting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.adultexample.manager.service.OrgService;
import com.adultexample.manager.service.RoleService;
import com.adultexample.manager.service.SuserService;
import com.adultexample.pojo.SUser;
import com.adultexample.utils.MD5Utils;
import com.adultexample.utils.PageStr;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	SuserService service;
	@Autowired
	OrgService orgService;
	@Autowired
	RoleService roleService;
	
	//查询用户管理页面  并分页
	@RequestMapping("data")
	public ModelAndView toData(@RequestParam(required=true,defaultValue="1") Integer pageNumber,@RequestParam(required=true,defaultValue="2") Integer pageSize,SUser user){
		ModelAndView mav=new ModelAndView("manager/user/data");
		PageInfo page=service.selectByPage(user,pageNumber,pageSize);
		PageStr pageStr=new PageStr(page);
		mav.addObject("page", pageStr);
		mav.addObject("user", user);
		return  mav;
	}
	
	//修改或添加
	@RequestMapping("edit")
	public ModelAndView toEdit(SUser user){
		ModelAndView mav=new ModelAndView("manager/user/edit");
		//修改
		if(user!=null && user.getId()!=null){
			//获取修改前的数据
			user=service.selectById(user.getId());
		}
		mav.addObject("user", user);
		//获取所属组织
		mav.addObject("orgs", orgService.findAllOrg());
		//获取所属角色
		mav.addObject("roles", roleService.selectAllRole());
		return mav;
	}
	
	@RequestMapping("save")
	public String save(SUser user){
		if(user.getId()==null){
		user.setPwd(MD5Utils.string2MD5(user.getPwd()));
		}
		boolean flag=service.saveOrUpdate(user);
		
		return "redirect:data.action";
	}
	
	@RequestMapping("delete")
	public String delete(Integer id){
		boolean flag=service.deleteById(id);
		return "redirect:data.action";
	}
	@RequestMapping("deletes")
	public String deletes(Integer[] ids){
		boolean flag=service.deleteById(ids);
		return "redirect:data.action";
	}
	
}