package com.adultexample.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adultexample.manager.dto.SubjectDto;
import com.adultexample.manager.service.SubjectService;
import com.adultexample.mapper.TSubjectMapper;
import com.adultexample.pojo.TSubject;
import com.adultexample.pojo.TSubjectExample;
import com.adultexample.pojo.TSubjectExample.Criteria;
import com.adultexample.pojo.TSubjectKey;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	TSubjectMapper subjectMapper;
	
	
	@Override
	public PageInfo<SubjectDto> findPage(Integer pageNumber, Integer pageSize,
			String checkname) {
		PageHelper.startPage(pageNumber, pageSize);
		List<SubjectDto> list = subjectMapper.selectPage(checkname);
		PageInfo<SubjectDto> pageInfo = new PageInfo<SubjectDto>(list);
		return pageInfo;
	}


	@Override
	public TSubject finById(Integer id) {
		TSubjectKey key = new TSubjectKey();
		key.setId(id);
		TSubject subject = subjectMapper.selectByPrimaryKey(key );
		return subject;
	}


	@Override
	public List<TSubject> findParNameList() {
		return subjectMapper.selectParNameList();
	}


	@Override
	public void saveData(TSubject subject) {
		
		//修改数据
		if(subject!=null&&subject.getId()!=null){
			subjectMapper.updateByPrimaryKeySelective(subject);
		}else{
			//添加数据
			subjectMapper.insertSelective(subject);
		}
	}


	@Override
	public void removeById(Integer id) {
		TSubjectKey key = new TSubjectKey();
		key.setId(id);
		subjectMapper.deleteByPrimaryKey(key );
	}


	@Override
	public void removeByIds(Integer[] ids) {
		subjectMapper.deleteByIds(ids);
	}


	@Override
	public List<TSubject> findsubList() {
		TSubjectExample example = new TSubjectExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentnoNotEqualTo(0);
		return subjectMapper.selectByExample(example);
	}

}
