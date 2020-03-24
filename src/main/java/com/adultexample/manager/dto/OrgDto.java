package com.adultexample.manager.dto;

import com.adultexample.pojo.SOrganization;

public class OrgDto extends SOrganization{
	private String realname;
	private String porgname;
	
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getPorgname() {
		return porgname;
	}
	public void setPorgname(String porgname) {
		this.porgname = porgname;
	}
	
}
