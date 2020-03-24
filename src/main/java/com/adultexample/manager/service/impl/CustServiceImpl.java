package com.adultexample.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adultexample.manager.service.CustService;
import com.adultexample.mapper.SCustMapper;
import com.adultexample.pojo.SCust;
import com.adultexample.pojo.SCustExample;
import com.adultexample.pojo.SCustExample.Criteria;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class CustServiceImpl implements CustService {

	@Autowired
	SCustMapper custMapper;
	@Override
	public PageInfo<SCust> findPageData(Integer pageNumber, Integer pageSize,
			String checkname) {
		PageHelper.startPage(pageNumber, pageSize);
		SCustExample example = null;
		if(checkname != null && checkname.length()!=0){
			checkname = "%" +checkname + "%";
			example = new SCustExample();
			Criteria criteria = example.createCriteria();
			criteria.andNicknameLike(checkname);
			Criteria criteria2 = example.createCriteria();
			criteria2.andMobileLike(checkname);
			Criteria criteria3 = example.createCriteria();
			criteria3.andEmainLike(checkname);
			
			example.or(criteria2);
			example.or(criteria3);
		}
		
		List<SCust> list = custMapper.selectByExample(example );
		PageInfo<SCust> pageInfo = new PageInfo<SCust>(list);
		return pageInfo;
	}

}
