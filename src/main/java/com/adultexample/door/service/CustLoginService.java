package com.adultexample.door.service;

import com.adultexample.pojo.SCust;

public interface CustLoginService {

	/**
	 * 判断用户名密码是否正确
	 * @param nickname
	 * @param pwd
	 * @return
	 */
	SCust findLogin(SCust cust);

	/**
	 *注册时 用户名是否已经存在
	 * @param username
	 * @return
	 */
	boolean testUname(String username);

	/**
	 * 注册时 手机号是否已经存在
	 * @param mobile
	 * @return
	 */
	boolean testMobile(String mobile);

}
