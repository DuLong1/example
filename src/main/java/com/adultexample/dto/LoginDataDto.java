package com.adultexample.dto;
import java.util.List;

import com.adultexample.pojo.LoginData;


public class LoginDataDto extends LoginData {
	List<LoginData> children;

	public List<LoginData> getChildren() {
		return children;
	}

	public void setChildren(List<LoginData> children) {
		this.children = children;
	}

	
	
}