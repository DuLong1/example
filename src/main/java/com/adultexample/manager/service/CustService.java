package com.adultexample.manager.service;

import com.adultexample.pojo.SCust;
import com.github.pagehelper.PageInfo;

public interface CustService {

	/**
	 * 获取用户的分页信息
	 * @param pageNumber
	 * @param pageSize
	 * @param checkname
	 * @return
	 */
	PageInfo<SCust> findPageData(Integer pageNumber, Integer pageSize,
			String checkname);

}
