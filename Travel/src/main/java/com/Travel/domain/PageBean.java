package com.Travel.domain;
// 페이징 처리를 위한 정보를 저장하는 클래스

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageBean {
	private String pageNum;
	private String maxPage;
	private String startPage;
	private int pageSize;
	private int count;
	
	public PageBean() {}
	
	public PageBean(String pageNum, String maxPage, String startPage, int pageSize, int count) {
		this.pageNum = pageNum;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.pageSize = pageSize;
		this.count = count;
	}
	
}
