package com.adultexample.door.dto;

import java.util.List;

import com.adultexample.pojo.TSubject;

public class SubjectDto extends TSubject{
	private List<TSubject> sub;

	public List<TSubject> getSub() {
		return sub;
	}

	public void setSub(List<TSubject> sub) {
		this.sub = sub;
	}
}
