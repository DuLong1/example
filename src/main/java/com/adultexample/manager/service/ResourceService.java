package com.adultexample.manager.service;
import java.util.List;
import java.util.Map;


public interface ResourceService {
	public List selectAll();
	public List selectRes(Integer roleId);
	boolean savaOrDelete(Integer roleId,Integer resourceId,Integer resourcePid);
	boolean savaOrDeleteSQL(Integer roleId,Integer resourceId,Integer pid);
	
	public List<Map> selectByRoleId(Integer roleid);
}
