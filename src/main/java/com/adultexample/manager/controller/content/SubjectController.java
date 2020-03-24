package com.adultexample.manager.controller.content;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.adultexample.constant.Common;
import com.adultexample.manager.dto.SubjectDto;
import com.adultexample.manager.service.SubjectService;
import com.adultexample.manager.service.SuserService;
import com.adultexample.pojo.SUser;
import com.adultexample.pojo.TSubject;
import com.adultexample.utils.DateUtil;
import com.adultexample.utils.PageStr;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("subject")
public class SubjectController {

	@Autowired
	SubjectService subjectService;
	@Autowired
	SuserService userService;
	
	@RequestMapping("data")
	public ModelAndView toData(@RequestParam(name="pageNumber",required=true,defaultValue="1") Integer pageNumber,@RequestParam(name="pageSize",required=true,defaultValue="2") Integer pageSize,String checkname){
		ModelAndView mav = new ModelAndView("manager/subject/data");
		PageInfo<SubjectDto> pageInfo = subjectService.findPage(pageNumber,pageSize,checkname);
		PageStr page = new PageStr(pageInfo);
		mav.addObject("checkname",checkname);
		mav.addObject("page", page);
		return mav;
	}
	@RequestMapping("edit")
	public ModelAndView toedit(Integer id){
		ModelAndView mav = new ModelAndView("manager/subject/edit");
		//修改操作  
		if(id != null){
			//根据id查询原有信息
			TSubject subject = subjectService.finById(id);
			 mav.addObject("subject", subject);
		}
		
		//查询下拉框内容
		//上级类型(id,name)
		List<TSubject> parnameList = subjectService.findParNameList();
		//创建人信息 (id,name)
		//更新人信息(id,name)
		List<SUser> usernameList = userService.findAllUser();
		mav.addObject("parnameList", parnameList);
		mav.addObject("usernameList", usernameList);
		return mav;
	}
	
	//保存数据  (修改或添加)
	@RequestMapping("save")
	public String tosave(TSubject subject,HttpSession session){
		SUser user = (SUser)session.getAttribute(Common.CURRENT_USER_STRING);
		String opaname = user.getId().toString();
 		String opadate = DateUtil.getTodayDate();
		if(subject!=null && subject.getId()!=null){
			subject.setUpdateBy(opaname);
			subject.setUpdateDate(opadate);
		}else {
			subject.setCreateBy(opaname);
			subject.setCreateDate(opadate);
		}
		subjectService.saveData(subject);
		return "redirect:data.action";
	}
	
	//删除数据
	@RequestMapping("delete")
	public String delete(Integer id){
		subjectService.removeById(id);
		return "redirect:data.action";
	}
	//批量删除
	@RequestMapping("deletes")
	public String deletes(Integer[] ids){
		subjectService.removeByIds(ids);
		return "redirect:data.action";
	}
}
