package com.Travel.utill;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Search extends Pagination {
	private String searchText;
	private String searchType;
	
	private String ctgSort;
	private String pdtSort;
	private String stcSort;
	
	@Override
	public void calcLastPage(int total, int cntPerPage) {
		// TODO Auto-generated method stub
		super.calcLastPage(total, cntPerPage);
	}
	@Override
	public void calcStartEndPage(int nowPage, int cntPage) {
		// TODO Auto-generated method stub
		super.calcStartEndPage(nowPage, cntPage);
	}
	@Override
	public void calcStartEnd(int nowPage, int cntPerPage) {
		// TODO Auto-generated method stub
		super.calcStartEnd(nowPage, cntPerPage);
	}
	
	
	public Search(int total, int nowPage) {
		super(total, nowPage);
	}

	
}
