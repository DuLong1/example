package com.adultexample.door.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adultexample.door.dto.DChapterDto;
import com.adultexample.door.dto.SubjectDto;
import com.adultexample.door.service.DIndexService;
import com.adultexample.manager.dto.QuestionDto;
import com.adultexample.mapper.TChapterMapper;
import com.adultexample.mapper.TPaperMapper;
import com.adultexample.mapper.TQuestionMapper;
import com.adultexample.mapper.TSubjectMapper;
import com.adultexample.pojo.TPaperExample;
import com.adultexample.pojo.TPaperExample.Criteria;
import com.adultexample.pojo.TPaperKey;
import com.adultexample.pojo.TPaperWithBLOBs;
import com.adultexample.pojo.TQuestionKey;
import com.adultexample.pojo.TQuestionWithBLOBs;
import com.adultexample.pojo.TSubject;
import com.adultexample.pojo.TSubjectKey;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.tools.javac.util.Context.Key;

@Service
public class DIndexServiceImpl implements DIndexService {

	@Autowired
	TSubjectMapper subjectMapper;
	
	@Autowired
	TChapterMapper chapterMapper;
	
	@Autowired
	TQuestionMapper questionMapper;
	
	@Autowired
	TPaperMapper paperMapper;
	
	@Override
	public List<SubjectDto> findLeftList() {
		return subjectMapper.selectLeftList();
	}

	@Override
	public TSubject findSubjectName(Integer id) {
		TSubjectKey key = new TSubjectKey();
		key.setId(id);
		return subjectMapper.selectByPrimaryKey(key );
	}

	@Override
	public List<DChapterDto> findChapterList(Integer id) {
		return chapterMapper.selectChapterLearn(id);
	}

	@Override
	public PageInfo<QuestionDto> findChapterQuestion(Integer pageNum,
			Integer pageSize, Integer id) {
		PageHelper.startPage(pageNum, pageSize);
		List<QuestionDto> questionlist = questionMapper.selectChapterQuestion(id);
		PageInfo<QuestionDto> pageInfo = new PageInfo<QuestionDto>(questionlist);
		return pageInfo;
	}

	@Override
	public PageInfo<TPaperWithBLOBs> findExamplePaper(Integer subid,
			Integer type, Integer pageNum, Integer pageSize, String year) {
		PageHelper.startPage(pageNum, pageSize);
		if(type==0){
			type = null;
		}
		if("0".equals(year)){
			year = null;
		}
		Map map = new HashMap();
		map.put("subid", subid);
		map.put("type", type);
		map.put("year", year);
		List<TPaperWithBLOBs> paperInfo = paperMapper.selectExamplePaper(map);
		PageInfo<TPaperWithBLOBs> paper = new PageInfo<TPaperWithBLOBs>(paperInfo);
		return paper;
	}

	@Override
	public List<TQuestionWithBLOBs> findExamplePaperDetail(Integer id) {
		TPaperWithBLOBs paper = paperMapper.selectById(id);
		String questionInfo = paper.getQuestionInfo();
		String[] ids = questionInfo.split(",");
		List<TQuestionWithBLOBs> questions = questionMapper.selectQuestionInfo(ids);
		return questions;
	}

	@Override
	public TPaperWithBLOBs findPapername(Integer id) {
		TPaperKey key = new TPaperKey();
		key.setId(id);
		return paperMapper.selectByPrimaryKey(key );
	}

	@Override
	public TQuestionWithBLOBs findQuestionById(Integer id) {
		TQuestionKey key = new TQuestionKey();
		key.setId(id);
		return questionMapper.selectByPrimaryKey(key );
	}

}
