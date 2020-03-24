package com.adultexample.manager.controller.content;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.adultexample.manager.dto.QuestionDto;
import com.adultexample.manager.service.ChapterService;
import com.adultexample.manager.service.QuestionService;
import com.adultexample.manager.service.SubjectService;
import com.adultexample.pojo.TChapter;
import com.adultexample.pojo.TQuestion;
import com.adultexample.pojo.TQuestionWithBLOBs;
import com.adultexample.pojo.TSubject;
import com.adultexample.utils.PageStr;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("question")
public class QuestionController {

	@Autowired
	QuestionService questionService;
	
	@Autowired
	SubjectService subjectService;
	@Autowired
	ChapterService chapterService;
	
	//查询问题数据  分页
	@RequestMapping("data")
	public ModelAndView todata(@RequestParam(name="pageNumber",required=true,defaultValue="1") Integer pageNumber,@RequestParam(name="pageSize",required=true,defaultValue="2") Integer pageSize,String checkname){
		ModelAndView mav = new ModelAndView("manager/question/data");
		PageInfo<QuestionDto> pageinfo = questionService.findPageInfo(pageNumber,pageSize,checkname);
		PageStr pageStr = new PageStr(pageinfo);
		mav.addObject("page", pageStr);
		mav.addObject("checkname",checkname);
		return mav;
	}
	//修改界面
	@RequestMapping("edit")
	public ModelAndView toedit(Integer id){
		ModelAndView mav = new ModelAndView("manager/question/edit");
		if(id!=null){
			TQuestion question = questionService.findById(id);
			mav.addObject("question",question);
		}
		//所属类型下拉框信息
		List<TSubject> subList = subjectService.findParNameList();
		//所属章节下拉框信息
		List<TChapter> chapterList = chapterService.findSelectedVal();
		mav.addObject("subList",subList);//返回到前端页面
		mav.addObject("chapterList",chapterList);
		return mav;
	}
	//异步获取章节信息
	@ResponseBody
	@RequestMapping("getchapter")
	public List<TChapter> getchapter(Integer subid){
		//所属章节下拉框信息
		List<TChapter> chapterList = chapterService.findChapterList(subid);
		return chapterList;
	}
	//保存
	@RequestMapping("save")
	public String save(TQuestionWithBLOBs question){
		//进行保存
		questionService.save(question);
		return "redirect:data.action";
	}
	//删除一条数据
	@RequestMapping("delete")
	public String delete(Integer id){
		questionService.del(id);
		return "redirect:data.action";
	}
	//批量数据
	@RequestMapping("deletes")
	public String delete(Integer[] ids){
		questionService.dels(ids);
		return "redirect:data.action";
	}
}
