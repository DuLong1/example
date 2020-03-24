package com.adultexample.manager.dto;
import java.io.Serializable;
import java.util.List;

import com.adultexample.pojo.TreeNode;


public class TreeNodeDto extends TreeNode implements Serializable{
	List<TreeNode> children;

	public List<TreeNode> getChildren() {
		return children;
	}

	public void setChildren(List<TreeNode> children) {
		this.children = children;
	}
	
}
