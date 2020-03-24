package com.adultexample.manager.service;

import java.util.List;

import com.adultexample.manager.dto.OrgDto;
import com.adultexample.pojo.SOrganization;
import com.github.pagehelper.PageInfo;

public interface OrgService {
	/**
	 * 查询所有组织机构并且分页显示
	 * @param pageNumber
	 * @param pageSize
	 * @param orgname
	 * @return
	 */
	PageInfo findAllData(Integer pageNumber, Integer pageSize,String orgname);
	
	/**
	 * 通过id查找
	 * @param id
	 * @return
	 */
	SOrganization findInfoById(Integer id);

	/**
	 * 删除
	 * @param id
	 */
	int delById(Integer id);
	
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	int delByIds(Integer[] ids);
	
	/**
	 * 获取所有组织名及id
	 * @return
	 */
	List<SOrganization> findAllOrg();

	void add(SOrganization organization);

	void edit(SOrganization organization);


}
