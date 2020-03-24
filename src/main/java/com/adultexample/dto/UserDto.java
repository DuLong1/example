package com.adultexample.dto;

import com.adultexample.pojo.SOrganization;
import com.adultexample.pojo.SRole;
import com.adultexample.pojo.SUser;

public class UserDto extends SUser{

	private SOrganization org;
	private SRole role;
	
	public SOrganization getOrg() {
		return org;
	}
	public void setOrg(SOrganization org) {
		this.org = org;
	}
	public SRole getRole() {
		return role;
	}
	public void setRole(SRole role) {
		this.role = role;
	}
	
	
}
