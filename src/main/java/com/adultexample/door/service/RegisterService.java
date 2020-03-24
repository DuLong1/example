package com.adultexample.door.service;

import com.adultexample.pojo.SCust;

public interface RegisterService {

	SCust checkRed(SCust customer);

	SCust checkRedister(SCust customer);

	int insertWebRegister(SCust customer);


}
