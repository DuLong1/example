package com.adultexample.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adultexample.manager.dto.QuestionDto;
import com.adultexample.manager.service.QuestionService;
import com.adultexample.mapper.TQuestionMapper;
import com.adultexample.pojo.TQuestion;
import com.adultexample.pojo.TQuestionKey;
import com.adultexample.pojo.TQuestionWithBLOBs;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	TQuestionMapper questionMapper;
	
	@Override
	public PageInfo<QuestionDto> findPageInfo(Integer pageNumber,
			Integer pageSize, String checkname) {
		PageHelper.startPage(pageNumber,pageSize);
	    List<QuestionDto> list = questionMapper.selectPageInfo(checkname);
	    PageInfo<QuestionDto> pageInfo = new PageInfo<QuestionDto>(list);
		return pageInfo;
	}

	@Override
	public TQuestionWithBLOBs findById(Integer id) {
		TQuestionKey key = new TQuestionKey();
		key.setId(id);
		return questionMapper.selectByPrimaryKey(key );
	}

	@Override
	public void save(TQuestionWithBLOBs question) {
		//修改数据
		if(question!=null && question.getId()!=null){
			questionMapper.updateByPrimaryKeySelective(question);
		}else{
			questionMapper.insertSelective(question);
		}
	}

	@Override
	public void del(Integer id) {
		TQuestionKey key = new TQuestionKey();
		key.setId(id);
		questionMapper.deleteByPrimaryKey(key );
	}

	@Override
	public void dels(Integer[] ids) {
		questionMapper.deleteByIds(ids);
	}

}
