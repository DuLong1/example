package com.adultexample.manager.controller.content;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.adultexample.constant.Common;
import com.adultexample.manager.dto.PaperDto;
import com.adultexample.manager.service.PaperService;
import com.adultexample.manager.service.SubjectService;
import com.adultexample.pojo.SUser;
import com.adultexample.pojo.TPaperWithBLOBs;
import com.adultexample.pojo.TQuestionWithBLOBs;
import com.adultexample.pojo.TSubject;
import com.adultexample.utils.PageStr;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("paper")
public class PaperController {
	
	@Autowired
	PaperService paperService;
	@Autowired
	SubjectService subjectService;
	
	
	
	//获取数据
	@RequestMapping("data")
	public ModelAndView todata(@RequestParam(name="pageNumber",required=true,defaultValue="1") Integer pageNumber,@RequestParam(name="pageSize",required=true,defaultValue="5") Integer pageSize,String checkname){
		ModelAndView mav = new ModelAndView("manager/paper/data");
		PageInfo<PaperDto> pageInfo = paperService.findPageInfo(pageNumber,pageSize,checkname);
		PageStr pageStr = new PageStr(pageInfo);
		mav.addObject("page",pageStr);
		mav.addObject("checkname", checkname);
		return mav;
	}
	
	//添加数据
	@RequestMapping("edit")
	public ModelAndView toedit(Integer op){
		ModelAndView mav = new ModelAndView("manager/paper/edit");
		if (op!=null && op != 0) {
			mav.setViewName("manager/paper/uppaper");
		}
		//考试类型
		List<TSubject> subjectList = subjectService.findsubList();
		mav.addObject("subList", subjectList);
		return mav;
	}
	
	//生成试卷文件
	public String file(Integer id,HttpServletRequest request) throws IOException{
		//试卷信息
		TPaperWithBLOBs paper = paperService.findById(id);
		//所有题目
		List<TQuestionWithBLOBs> list = paperService.findPaperInfo(paper.getQuestionInfo());
		StringBuffer str = new StringBuffer();
		//试卷信息
		for (int i= 0 ;i<list.size();i++) {
			str.append(i + "." +list.get(i).getContent());
		}
		//保存路径
		String path =request.getSession().getServletContext().getRealPath("/upload")+"/";
		File file = new File(path+id+".docx");
		//判断路径是否存在
		if(!file.exists()){
			 file.getParentFile().mkdir();
		    try {
		        //创建文件
		        file.createNewFile();
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		}
		//保存到服务器端
		BufferedWriter writer = new BufferedWriter(new FileWriter(file));
		writer.write(str.toString());
		writer.close();
		return id+".docx";
	}
	//保存生成试卷数据
	@RequestMapping("save")
	public String save(TPaperWithBLOBs paper,Integer numdan,Integer numduo,
			Integer numjie,HttpSession session,HttpServletRequest request) throws IOException{
		
		SUser user = (SUser)session.getAttribute(Common.CURRENT_USER_STRING);//获取当前创建试卷用户
		Integer id = user.getId();
		paper.setCreaterId(id.toString());//设置创建id
		
		Calendar date = Calendar.getInstance();//获取当前时间
		Integer year = date.get(Calendar.YEAR);//获取当前时间的年份
		paper.setYear(year.toString());//设置年份
		
		//保存生成试卷到数据库
		int pid = paperService.save(paper,numdan,numduo,numjie);
		
		//讲试卷文件保存到服务器端
		String string = file(pid, request);
		paper.setPoint(string);
		paperService.save(paper, numdan, numduo, numjie);
		
		return "redirect:data.action";
	}
	//上传试卷
	@RequestMapping("uppaper")
	public String uppaper(@RequestParam(name="point1") MultipartFile point1,TPaperWithBLOBs paper,HttpSession session,HttpServletRequest request){
		SUser user = (SUser)session.getAttribute(Common.CURRENT_USER_STRING);//获取当前创建试卷用户
		Integer id = user.getId();
		paper.setCreaterId(id.toString());//设置创建id
		int pid = paperService.save(paper);
		String orginame = point1.getOriginalFilename();
		String filename = pid+orginame.substring(orginame.lastIndexOf('.'));
		String pathname = request.getRealPath("/")+"upload/"+filename;
		try {
			point1.transferTo(new File(pathname));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		paper.setPoint(filename);
		paperService.save(paper);
		return "redirect:data.action";
	}
	//查看试卷信息
	@RequestMapping("look")
	public ModelAndView look(Integer id){
		ModelAndView mav = new ModelAndView("manager/paper/look");
		//试卷信息
		TPaperWithBLOBs paper = paperService.findById(id);
		//所有题目
		List<TQuestionWithBLOBs> list = paperService.findPaperInfo(paper.getQuestionInfo());
		mav.addObject("paperBaseInfo",paper);
		mav.addObject("paperQuestionInfo",list);
		return mav;
	}
	//删除试卷
	@RequestMapping("delete")
	public String delete(Integer id){
		paperService.del(id);
		return "redirect:data.action";
	} 
	//批量删除
	@RequestMapping("deletes")
	public String delete(Integer[] ids){
		paperService.dels(ids);
		return "redirect:data.action";
	}
}
