package com.adultexample.manager.service;
import java.util.List;

import com.adultexample.pojo.SRole;
import com.github.pagehelper.PageInfo;

public interface RoleService {
	List<SRole> selectAllRole();
	PageInfo selectPage(SRole role,Integer pageNumber,Integer pageSize);
	SRole selectById(Integer id);
	boolean saveOrUpdate(SRole role);
	boolean deleteById(Integer id);
	boolean deleteByIds(Integer[] ids);

}