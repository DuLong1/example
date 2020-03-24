package com.adultexample.manager.service;

import java.util.List;

import com.adultexample.manager.dto.LeftData;
import com.adultexample.pojo.SUser;
import com.github.pagehelper.PageInfo;

public interface SuserService {
	
	/**
	 * 查询用户
	 * @param uname
	 * @param password
	 * @return
	 */
	SUser findUser(String uname, String password);
	/**
	 * 获取资源列表
	 * @param roleid
	 * @return
	 */
	List<LeftData> findRes(int roleid);
	/**
	 * 获取所有用户姓名及id
	 * @return
	 */
	List<SUser> findAllUser();
	
	PageInfo selectByPage(SUser user, Integer pageNumber, Integer pageSize);


	boolean saveOrUpdate(SUser user);
	//删除及批量删除
	boolean deleteById(Integer id);
	boolean deleteById(Integer[] ids);
	/**
	 * 通过id查询一条信息
	 * @param id
	 * @return
	 */
	SUser selectById(Integer id);
	
	
	
}
