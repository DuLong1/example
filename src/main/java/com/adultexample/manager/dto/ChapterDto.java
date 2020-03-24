package com.adultexample.manager.dto;

import com.adultexample.pojo.TChapter;

public class ChapterDto extends TChapter{
	private TChapter parchapter;
	private String subname;
	public TChapter getParchapter() {
		return parchapter;
	}
	public void setParchapter(TChapter parchapter) {
		this.parchapter = parchapter;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	

}
