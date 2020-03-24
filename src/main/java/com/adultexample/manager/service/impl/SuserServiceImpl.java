package com.adultexample.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adultexample.dto.UserDto;
import com.adultexample.manager.dto.LeftData;
import com.adultexample.manager.dto.LeftDateForm;
import com.adultexample.manager.service.SuserService;
import com.adultexample.mapper.SUserMapper;
import com.adultexample.pojo.SUser;
import com.adultexample.pojo.SUserExample;
import com.adultexample.pojo.SUserExample.Criteria;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class SuserServiceImpl implements SuserService {

	@Autowired
	SUserMapper userMapper;
	@Override
	public SUser findUser(String uname, String password) {
		
		SUserExample example=new SUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andLoginaccountEqualTo(uname);
		criteria.andPwdEqualTo(password);
		List<SUser> sUser = userMapper.selectByExample(example);
		if(sUser.size()!=0){
			return sUser.get(0);
		}
		return null;
	}
	
	
	@Override
	public List<LeftData> findRes(int roleid) {
		List<LeftData> list =  userMapper.selectRes(roleid);
		return list;
	}


	@Override
	public List<SUser> findAllUser() {
		List<SUser> list = userMapper.selectByExample(null);
		return list;
	}

	
	//查询
	@Override
	public PageInfo selectByPage(SUser user, Integer pageNumber,
			Integer pageSize) {
		
		PageHelper.startPage(pageNumber, pageSize);
		List<UserDto> list = userMapper.selectByPage(user);
		return new PageInfo(list);
	}

	@Override
	public SUser selectById(Integer id) {
		SUser user = userMapper.selectByPrimaryKey(id);
		return user;
	}
	//修改更新
	@Override
	public boolean saveOrUpdate(SUser user) {
		boolean status=false;
		int num=0;
		if(user!=null && user.getId()!=null){
			num=userMapper.updateByPrimaryKeySelective(user);
		}else {
			num=userMapper.insertSelective(user);
		}
		
		if(num==1){
			status=true;
		}
		return status;
	}
	
	//删除
	@Override
	public boolean deleteById(Integer id) {
		boolean status=false;
		int num = userMapper.deleteByPrimaryKey(id);
		if(num==1){
			status=true;
		}
		return status;
	}

	@Override
	public boolean deleteById(Integer[] ids) {
		boolean status=false;
		int num=userMapper.deleteByIds(ids);
		if(num==ids.length){
			status=true;
		}
		return status;
	}
	

}
