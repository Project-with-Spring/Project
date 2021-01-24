package com.Travel.service;

import java.util.List;

import com.Travel.domain.PositionBean;


public interface PositionService {
	
	//직급List
	public List<PositionBean> getPositionList();
	//직급별 정보
	public PositionBean getPosition(String pst_id);
	//직급 수정 
	public void updatePostion(PositionBean pb);
	//직급코드확인 
	public int chkPostion(String pst_id);
	//직급 등록 
	public void insertPostion(PositionBean pb);
	//직급 삭제  
	public void deletePostion(String pst_id);


}
