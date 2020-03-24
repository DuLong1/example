package com.adultexample.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adultexample.manager.dto.OrgDto;
import com.adultexample.manager.service.OrgService;
import com.adultexample.mapper.SOrganizationMapper;
import com.adultexample.pojo.SOrganization;
import com.adultexample.pojo.SOrganizationKey;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class OrgServiceImpl implements OrgService{
	
	@Autowired
	SOrganizationMapper orgMapper;
	
	@Override
	public PageInfo findAllData(Integer pageNumber, Integer pageSize,String orgname) {
		PageHelper.startPage(pageNumber, pageSize);
		List<OrgDto> orgList = orgMapper.selectInfo(orgname);
		PageInfo pagteInfo = new PageInfo(orgList);
		return pagteInfo;
	}

	@Override
	public SOrganization findInfoById(Integer id) {
		return orgMapper.selectInfoById(id);
	}

	@Override
	public int delById(Integer id) {
		SOrganizationKey key = new SOrganizationKey();
		key.setId(id);
		return orgMapper.deleteByPrimaryKey(key);
	}

	@Override
	public int delByIds(Integer[] ids) {
		int num = orgMapper.deleteByIds(ids);
		return num;
	}

	@Override
	public List<SOrganization> findAllOrg() {
		return orgMapper.selectOrgname();
	}

	@Override
	public void add(SOrganization organization) {
		orgMapper.insert(organization);
	}

	@Override
	public void edit(SOrganization organization) {
		orgMapper.updateByPrimaryKeySelective(organization);
	}


}
