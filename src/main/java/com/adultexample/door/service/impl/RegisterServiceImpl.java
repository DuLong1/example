package com.adultexample.door.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adultexample.door.service.RegisterService;
import com.adultexample.mapper.SCustMapper;
import com.adultexample.pojo.SCust;

@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	private SCustMapper mapper;

	@Override
	public int insertWebRegister(SCust customer) {
		int num = mapper.insertSelective(customer);
		if(num==1){
			return 1;
		}
		return 0;
	}

	@Override
	public SCust checkRedister(SCust customer) {
		return mapper.selectIsActive(customer);
	}

	@Override
	public SCust checkRed(SCust customer) {
		return mapper.selectNameIsActive(customer);
	}

}
