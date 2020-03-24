package com.adultexample.manager.dto;

import com.adultexample.pojo.TSubject;

public class SubjectDto extends TSubject{
	private String parname;
	private String createname;
	private String updatename;
	public String getParname() {
		return parname;
	}
	public void setParname(String parname) {
		this.parname = parname;
	}
	public String getCreatename() {
		return createname;
	}
	public void setCreatename(String createname) {
		this.createname = createname;
	}
	public String getUpdatename() {
		return updatename;
	}
	public void setUpdatename(String updatename) {
		this.updatename = updatename;
	}
	
	
}
