package com.adultexample.door.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adultexample.door.service.PreService;
import com.adultexample.mapper.TCollectionMapper;
import com.adultexample.mapper.TQuestionMapper;
import com.adultexample.pojo.TCollection;
import com.adultexample.pojo.TCollectionExample;
import com.adultexample.pojo.TCollectionExample.Criteria;
import com.adultexample.pojo.TQuestionWithBLOBs;
import com.adultexample.utils.DateUtil;

@Service
public class PreServiceImpl implements PreService {

	@Autowired
	TCollectionMapper collectionMapper;
	@Autowired
	TQuestionMapper questionMapper;
	
	@Override
	public boolean saveHeart(Integer qid, Integer custid) {
		String todayDate = DateUtil.getTodayDate();
		TCollection collection = new TCollection();
		collection.setCreatedate(todayDate);
		collection.setCusid(custid);
		collection.setQuestionid(qid);
		int num = collectionMapper.insertSelective(collection);
		if(num == 1){
			return true;
		}
		
		return false;
	}

	@Override
	public List<TQuestionWithBLOBs> findQuestions(Integer id) {
		TCollectionExample example = new TCollectionExample();
		Criteria criteria = example.createCriteria();
		criteria.andCusidEqualTo(id);
		List<TCollection> qustionIds = collectionMapper.selectByExample(example);
		String[] ids = new String[qustionIds.size()];
		if(qustionIds!=null&& qustionIds.size()!=0){
			for (int i = 0;i < qustionIds.size();i++) {
				ids[i] = qustionIds.get(i).getQuestionid().toString();
			}
		}
		 
		List<TQuestionWithBLOBs> questions =  new ArrayList<TQuestionWithBLOBs>();
		if(ids.length!=0){
			questions = questionMapper.selectQuestionInfo(ids);
		}
		return questions;
	}

	@Override
	public boolean findCunzai(Integer qid, Integer custid) {
		TCollectionExample example = new TCollectionExample();
		Criteria criteria = example.createCriteria();
		criteria.andCusidEqualTo(custid);
		criteria.andQuestionidEqualTo(qid);
		List<TCollection> qustionIds = collectionMapper.selectByExample(example);
		if(qustionIds.size()>0){
			return true;
		}
		return false;
	}

}
