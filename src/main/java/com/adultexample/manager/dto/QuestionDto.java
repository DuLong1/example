package com.adultexample.manager.dto;

import com.adultexample.pojo.TQuestionWithBLOBs;

public class QuestionDto extends TQuestionWithBLOBs {
	private String subject;
	private String chapter;
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	
}
