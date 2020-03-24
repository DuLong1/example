package com.adultexample.manager.controller.setting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.adultexample.manager.dto.OrgDto;
import com.adultexample.manager.service.OrgService;
import com.adultexample.manager.service.SuserService;
import com.adultexample.pojo.SOrganization;
import com.adultexample.pojo.SUser;
import com.adultexample.utils.PageStr;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("org")
public class OrgController {

	@Autowired
	OrgService orgService;
	@Autowired
	SuserService userService;
	
	//查询信息
	@RequestMapping("data")
	public ModelAndView getData(@RequestParam(name="pageNumber",required=true,defaultValue="1") Integer pageNumber,@RequestParam(name="pageSize",required=true,defaultValue="5") Integer pageSize,String orgname){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manager/org/list");
		PageInfo pageInfo=orgService.findAllData(pageNumber,pageSize,orgname);
		PageStr page = new PageStr(pageInfo);
		mav.addObject("page",page);
		mav.addObject("orgname", orgname);
		return mav;
	}
	
	//信息的增删改
	//删除一个
	@RequestMapping("delete")
	public String delete(Integer id){
		orgService.delById(id);
		return "redirect:data.action";
	}
	//批量删除
	@RequestMapping("deletes")
	public String deletes(Integer[] ids){
		orgService.delByIds(ids);
		return "redirect:data.action";
	}
	//编辑页面
	@RequestMapping("edit")
	public ModelAndView toedit(Integer id){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manager/org/edit");
		SOrganization org = null;
		//判断编辑还是添加
		
		//查询下拉框数据   上级组织/负责人
		List<SOrganization> orgList = orgService.findAllOrg();
		List<SUser> userList = userService.findAllUser();
		mav.addObject("orgList", orgList);
		mav.addObject("userList", userList);
		
		//编辑
		if(id!=null){
			//查询数据  原来数据
			org = orgService.findInfoById(id);
		}
		mav.addObject("org", org);
		return mav;
	}
	
	//进行编辑或修改
	@RequestMapping("save")
	public String save(SOrganization organization){
		//判断是添加还是修改
		//添加
		if(organization.getId()==null){
			orgService.add(organization);
		}else{
			//修改
			orgService.edit(organization);
		}
		
		
		return "redirect:data.action";
	}
	
	
}
