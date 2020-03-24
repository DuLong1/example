package com.adultexample.manager.controller.content;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.adultexample.manager.dto.ChapterDto;
import com.adultexample.manager.service.ChapterService;
import com.adultexample.manager.service.SubjectService;
import com.adultexample.pojo.TChapter;
import com.adultexample.pojo.TSubject;
import com.adultexample.utils.PageStr;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("chapter")
public class ChapterController {

	@Autowired
	ChapterService chapterService;
	@Autowired
	SubjectService subjectService;
	
	//获取data.jsp页面数据   分页
	@RequestMapping("data")
	public ModelAndView todata(@RequestParam(name="pageNumber",required=true,defaultValue="1") Integer pageNumber,@RequestParam(name="pageSize",required=true,defaultValue="5") Integer pageSize,String checkname){
		ModelAndView mav = new ModelAndView("manager/chapter/data");
		PageInfo<ChapterDto> pageInfo = chapterService.findPageInfo(pageNumber,pageSize,checkname);
		PageStr pageStr = new PageStr(pageInfo);
		mav.addObject("page",pageStr);
		mav.addObject("checkname", checkname);
		return mav;
	}
	
	//修改页面数据准备
	@RequestMapping("edit")
	public ModelAndView toedit(Integer id){
		ModelAndView mav = new ModelAndView("manager/chapter/edit");
		//修改数据  获取原来数据
		if(id!=null){
			TChapter chapter = chapterService.findById(id);
			mav.addObject("chapter", chapter);
		}
		//获取类型数据(id,name)
		List<TSubject> subList = subjectService.findParNameList();
		//获取章节父级数据 (id,name)
		List<TChapter> parList = chapterService.findSelectedVal();
		mav.addObject("subList", subList);
		mav.addObject("parList", parList);
		return mav;
	}
	
	//保存数据
	@RequestMapping("save")
	public String save(TChapter chapter){
		chapterService.saveData(chapter);
		return "redirect:data.action";
	}
	//删除一条数据
	@RequestMapping("delete")
	public String delete(Integer id){
		chapterService.del(id);
		return "redirect:data.action";
	}
	//批量删除
	@RequestMapping("deletes")
	public String deletes(Integer[] ids){
		chapterService.dels(ids);
		return "redirect:data.action";
	}
}









