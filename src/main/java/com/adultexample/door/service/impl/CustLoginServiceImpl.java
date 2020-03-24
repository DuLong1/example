package com.adultexample.door.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adultexample.door.service.CustLoginService;
import com.adultexample.mapper.SCustMapper;
import com.adultexample.pojo.SCust;
import com.adultexample.pojo.SCustExample;
import com.adultexample.pojo.SCustExample.Criteria;

@Service
public class CustLoginServiceImpl implements CustLoginService {

	@Autowired
	SCustMapper custMapper;
	
	@Override
	public SCust findLogin(SCust cust) {
		return custMapper.selectLogin(cust);
	}

	@Override
	public boolean testUname(String username) {
		SCustExample example = new SCustExample();
		Criteria criteria = example.createCriteria();
		criteria.andNicknameEqualTo(username);
		List<SCust> selectByExample = custMapper.selectByExample(example);
		if(selectByExample.size()!=0){
			return true;
		}
		return false;
	}

	@Override
	public boolean testMobile(String mobile) {
		SCustExample example = new SCustExample();
		Criteria criteria = example.createCriteria();
		criteria.andMobileEqualTo(mobile);
		List<SCust> selectByExample = custMapper.selectByExample(example);
		if(selectByExample.size()!=0){
			return true;
		}
		return false;
	}

}
