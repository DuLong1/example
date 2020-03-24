package com.adultexample.manager.dto;

import java.util.List;

public class LeftData extends LeftDateForm{
	List<LeftDateForm> children;

	public List<LeftDateForm> getChildren() {
		return children;
	}

	public void setChildren(List<LeftDateForm> children) {
		this.children = children;
	}

	
}
