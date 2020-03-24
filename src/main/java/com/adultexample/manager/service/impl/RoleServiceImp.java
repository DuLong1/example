package com.adultexample.manager.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adultexample.manager.service.RoleService;
import com.adultexample.mapper.SRoleMapper;
import com.adultexample.pojo.SRole;
import com.adultexample.pojo.SRoleExample;
import com.adultexample.pojo.SRoleExample.Criteria;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("roleService")
public class RoleServiceImp implements RoleService {
	@Autowired
	SRoleMapper mapper;
	
	@Override
	public List<SRole> selectAllRole() {
		List<SRole> list = mapper.selectByExample(null);
		return list;
	}

	@Override
	public PageInfo selectPage(SRole role,Integer pageNumber,Integer pageSize) {
		SRoleExample example=null;
		Criteria criteria =null;
		if (role.getRolename()!=null && role.getRolename().length()!=0) {
			example=new SRoleExample();
			 criteria=example.createCriteria();
			 criteria.andRolenameLike("%"+role.getRolename()+"%");
		}else {
			example=new SRoleExample();
		}
		example.setOrderByClause("id");
		PageHelper.startPage(pageNumber, pageSize);
		List<SRole> list = mapper.selectByExample(example);
		
		return new PageInfo(list);
	}

	@Override
	public SRole selectById(Integer id) {
		SRole role = mapper.selectByPrimaryKey(id);
		return role;
	}

	@Override
	public boolean saveOrUpdate(SRole role) {
		int num=0;
		boolean status=false;
		if(role!=null && role.getId()!=null){
			num=mapper.updateByPrimaryKeySelective(role);
		}else{
			num=mapper.insertSelective(role);
		}
		if(num==1){
			status=true;
		}
		return status;
	}

	@Override
	public boolean deleteById(Integer id) {
		boolean status=false;
		int num = mapper.deleteByPrimaryKey(id);
		if(num==1){
			status=true;
		}
		return status;
	}

	@Override
	public boolean deleteByIds(Integer[] ids) {
		boolean status=false;
		int num=mapper.deleteByIds(ids);
		if(num==ids.length){
			status=true;
		}
		return status;
	}
	
}