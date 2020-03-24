package com.adultexample.door.dto;

import java.util.List;

import com.adultexample.pojo.TChapter;

public class DChapterDto extends TChapter {
	private List<DChapterDto> chapter;
	private String subname;
	private Integer subid;
	private Integer count;
	
	
	public List<DChapterDto> getChapter() {
		return chapter;
	}
	public void setChapter(List<DChapterDto> chapter) {
		this.chapter = chapter;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public Integer getId() {
		return subid;
	}
	public void setId(Integer subid) {
		this.subid = subid;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	
}
