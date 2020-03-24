package com.adultexample.door.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.adultexample.constant.Common;
import com.adultexample.door.dto.DChapterDto;
import com.adultexample.door.dto.SubjectDto;
import com.adultexample.door.service.DIndexService;
import com.adultexample.manager.dto.QuestionDto;
import com.adultexample.pojo.SCust;
import com.adultexample.pojo.TPaperWithBLOBs;
import com.adultexample.pojo.TQuestionWithBLOBs;
import com.adultexample.pojo.TSubject;
import com.github.pagehelper.PageInfo;
import com.sun.tools.internal.ws.processor.model.Model;

@Controller
@RequestMapping("door")
public class DIndexController {
	
	@Autowired
	DIndexService indexService;
	
	//跳转到首页
	@RequestMapping("toindex")
	public ModelAndView toindex(Integer flag,HttpServletRequest request,HttpSession session){
		ModelAndView mav = new ModelAndView("door/index2");
		//查找左侧列表
		List<SubjectDto> leftList = indexService.findLeftList();
		//获取登录的用户信息
		SCust cust = (SCust)session.getAttribute(Common.WEB_CURRENT_USER_STRING);
		String custname = null;
		if(cust!=null){
			custname = cust.getNickname();
		}
		mav.addObject("custname",custname);
		mav.addObject("leftList", leftList);
		mav.addObject("flag", flag);
		return mav;
	}
	//跳转到科目类型页
	@RequestMapping("tosubject/{id}")
	public ModelAndView tosubject(@PathVariable("id") Integer id){
		ModelAndView mav = new ModelAndView("door/subject2");
		//通过科目id查找对应信息
		TSubject subject = indexService.findSubjectName(id);
		mav.addObject("subject", subject);
		return mav;
	}
	//跳转到章节练习页
	@RequestMapping("tochapterlearn/{id}")
	public ModelAndView tochapterlearn(@PathVariable("id") Integer id){
		ModelAndView mav = new ModelAndView("door/chapterlearn");
		//查找章节信息
		List<DChapterDto> chapterList = indexService.findChapterList(id);
		String subname = null;
		Integer subid = null;
		//查找科目信息
		if(chapterList.size()!=0){
			 subname = chapterList.get(0).getSubname();
			 subid = Integer.parseInt(chapterList.get(0).getSubjectId());
		}
		mav.addObject("subname", subname);
		mav.addObject("subid", subid);
		mav.addObject("chapterList", chapterList);
		return mav;
	}
	//跳转到章节练习对应的试题
	@RequestMapping("chapterquestion/{id}-{pageNum}")
	public ModelAndView tochapterquestion(@PathVariable("id") Integer id,@PathVariable("pageNum") Integer pageNum,@RequestParam(required=true,defaultValue="5") Integer pageSize){
		ModelAndView mav = new ModelAndView("door/chapterquestion");
		//查找章节所有问题及答案信息
		PageInfo<QuestionDto> chapterquestion = indexService.findChapterQuestion(pageNum,pageSize,id);
		List<QuestionDto> question = chapterquestion.getList();
		int total = chapterquestion.getPages();
		String subname = null;
		Integer subid = null;
		String chaptername = null;
		Integer chapterid = null;
		//查看章节及类型信息
		if(question.size()!=0){
			 subname = question.get(0).getSubject();
			 subid = Integer.parseInt(question.get(0).getSubjectId());
			 chaptername = question.get(0).getChapter();
			 chapterid = Integer.parseInt(question.get(0).getChapterId());
		}
		mav.addObject("subname", subname);
		mav.addObject("subid", subid);
		mav.addObject("chapterid", chapterid);
		mav.addObject("chaptername", chaptername);
		mav.addObject("pageNum",pageNum);
		mav.addObject("total",total);
		mav.addObject("chapterquestion", question);
		return mav;
	}
	
	//跳转到试卷练习页
	@RequestMapping("topaper/{id}-{type}-{year}-{pageNum}")
	public ModelAndView topaper(@PathVariable("id") Integer subid,@PathVariable("type") Integer type,@PathVariable("pageNum") Integer pageNum,@RequestParam(required=true,defaultValue="5") Integer pageSize,@PathVariable("year") String year){
		ModelAndView mav = new ModelAndView("door/paper");
		//查找试卷信息
		PageInfo<TPaperWithBLOBs> pageInfo = indexService.findExamplePaper(subid,type,pageNum,pageSize,year);
		List<TPaperWithBLOBs> list = pageInfo.getList();
		Integer num =null;//总量
		String subname = null;
		//查找类别信息
		if(list.size()!=0){
			num = list.size();
			subname = list.get(0).getCreaterId();
		}
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("subid",subid);
		mav.addObject("num", num);
		mav.addObject("type", type);
		mav.addObject("year", year);
		mav.addObject("pagenum",pageNum);
		mav.addObject("subname",subname);
		return mav;
	}
	
	//试卷详情页
	@RequestMapping("topaperdetail/{id}")
	public ModelAndView paperdetail(@PathVariable("id") Integer id){
		ModelAndView mav = new ModelAndView("door/paperdetail");
		List<TQuestionWithBLOBs> paperdetail = indexService.findExamplePaperDetail(id);
		TPaperWithBLOBs paper = indexService.findPapername(id);
		String papername = paper.getName();
		mav.addObject("paperdetail", paperdetail);
		mav.addObject("papername", papername);
		mav.addObject("paper", paper);
		return mav;
	}
	//查询试卷答案
	@ResponseBody
	@RequestMapping("answer")
	public TQuestionWithBLOBs answer(Integer id){
		TQuestionWithBLOBs question = indexService.findQuestionById(id);
		return question;
	}
	
	//跳转到试卷练习页
	@RequestMapping("tozt/{id}-{type}-{year}-{pageNum}")
	public ModelAndView zt(@PathVariable("id") Integer subid,@PathVariable("type") Integer type,@PathVariable("pageNum") Integer pageNum,@RequestParam(required=true,defaultValue="5") Integer pageSize,@PathVariable("year") String year){
		ModelAndView mav = new ModelAndView("door/paper2");
		//查找试卷信息
		PageInfo<TPaperWithBLOBs> pageInfo = indexService.findExamplePaper(subid,type,pageNum,pageSize,year);
		List<TPaperWithBLOBs> list = pageInfo.getList();
		Integer num =null;//总量
		String subname = null;
		//查找类别信息
		if(list.size()!=0){
			num = list.size();
			subname = list.get(0).getCreaterId();
		}
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("subid",subid);
		mav.addObject("num", num);
		mav.addObject("type", type);
		mav.addObject("year", year);
		mav.addObject("pagenum",pageNum);
		mav.addObject("subname",subname);
		return mav;
	}
	
}
