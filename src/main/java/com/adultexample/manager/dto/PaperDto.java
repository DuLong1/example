package com.adultexample.manager.dto;

import com.adultexample.pojo.TPaperWithBLOBs;

public class PaperDto extends TPaperWithBLOBs{
	private String subject;

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
}
