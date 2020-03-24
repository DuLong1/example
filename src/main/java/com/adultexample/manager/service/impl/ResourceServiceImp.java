package com.adultexample.manager.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adultexample.manager.dto.TreeNodeDto;
import com.adultexample.manager.service.ResourceService;
import com.adultexample.mapper.SResourceMapper;
import com.adultexample.pojo.SResource;
import com.adultexample.pojo.SResourceExample;
import com.adultexample.pojo.SResourceExample.Criteria;
import com.adultexample.pojo.TreeNode;

@Service("resourceService")
public class ResourceServiceImp implements ResourceService {

	@Autowired
	private SResourceMapper mapper;
	
	public List selectAll(){
		List<TreeNodeDto> result = mapper.selectAll();
		return result;
	}

	@Override
	public List selectRes(Integer roleId) {
		List<TreeNode> list = mapper.selectRes(roleId);
		return list;
	}
	@Override
	public boolean savaOrDelete(Integer roleId, Integer resourceId,Integer resourcePid) {
		Map map=new HashMap();
		map.put("roleId", roleId);
		map.put("resourceId", resourceId);
		
		if(mapper.selectSroleResource(map)==0){
			
			if(resourcePid==0){  
				mapper.insertSroleResource(map);
				List childAll=selectChild(resourceId);
				insertChild(childAll, roleId);
			}else if(resourcePid!=0){
				map.put("resourceId", resourcePid);
				if(mapper.selectSroleResource(map)==0){
					mapper.insertSroleResource(map);
				}
				map.put("resourceId", resourceId);
				mapper.insertSroleResource(map);
			
			}
			return true;
		}else {
			if(resourcePid==0){  
				mapper.deleteSroleResource(map);
				List childAll=selectChild(resourceId);
				delChild(childAll, roleId);
			}else if(resourcePid!=0){
				if(selectBrother(resourcePid,roleId)==1){
					mapper.deleteSroleResource(map);
					map.put("resourceId", resourcePid);
					mapper.deleteSroleResource(map);
				}else{
					mapper.deleteSroleResource(map);
					
				}
			}
			return false;
				
	}}
	
	public List selectChild(Integer pid){
		
		SResourceExample example=new SResourceExample();
		Criteria criteria = example.createCriteria();
		criteria.andPidEqualTo(pid);
		List<SResource> list = mapper.selectByExample(example);
		return list;
	}
	public int selectBrother (Integer pid,Integer roleId){
		Map map=new HashMap();
		map.put("resourceId", pid);
		map.put("roleId", roleId);
		return mapper.selectBrother(map);
		
	}
	public void insertChild(List<SResource> child,Integer roleId){
		//�ж��Ƿ����ӽڵ�
		if(child.size()>0){
			for (SResource sResource : child) {
				Map map=new HashMap();
				map.put("roleId", roleId);
				map.put("resourceId", sResource.getId());
				//��ݿ����Ƿ��Ѵ���    �������ǽ��в���
				if(mapper.selectSroleResource(map)==0){
					mapper.insertSroleResource(map);
				}
			}
		}
		
	}
	public void delChild(List<SResource> child, Integer roleId){
		//�ж��Ƿ����ӽڵ�
		if(child.size()>0){
			for (SResource sResource : child) {
				Map map=new HashMap();
				map.put("roleId", roleId);
				map.put("resourceId", sResource.getId());
				//��ݿ����Ƿ��Ѵ���    �������ǽ��в���
				if(mapper.selectSroleResource(map)>0){
					mapper.deleteSroleResource(map);
				}
			}
		}
	}

	//ʹ��SQL���
	@Override
	public boolean savaOrDeleteSQL(Integer roleId, Integer resourceId,Integer pid) {
		
		Map map=new HashMap();
		map.put("roleId", roleId);
		map.put("resourceId", resourceId);
		if(mapper.selectSroleResource(map)==0){
			if(pid==0){
				mapper.insertParentChild(map);
			}else{
				if(hasParent(roleId,pid)){
					mapper.insertSroleResource(map);
				}else{
					mapper.insertSroleResource(map);//��
					map.put("resourceId", pid);
					mapper.insertSroleResource(map);//��
				}
			}
		}else{
			if(pid==0){
				mapper.deleteParentChild(map);
			}else{
				if(hasOtherChild(roleId,pid)){
					mapper.deleteSroleResource(map);
				}else {
					mapper.deleteSroleResource(map);//��
					map.put("resourceId", pid);
					mapper.deleteSroleResource(map);//��
				}
				
			}
		}
		return false;
	}

	private boolean hasOtherChild(Integer roleId, Integer pid) {
		boolean status=false;
		Map map=new HashMap();
		map.put("roleId", roleId);
		map.put("pid", pid);
		if(mapper.selectOtherChild(map)>1){
			status=true;
		}
		return status;
	}

	private boolean hasParent(Integer roleId, Integer pid) {
		boolean status=false;
		Map map=new HashMap();
		map.put("roleId", roleId);
		map.put("pid", pid);
		int num=mapper.selectParent(map);
		if(num==1){
			status=true;
		}
		return status;
	}

	@Override
	public List selectByRoleId(Integer roleid) {
		List list = mapper.selectResList(roleid);
		return list;
	}
	
	
}