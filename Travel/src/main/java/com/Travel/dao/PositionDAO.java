package com.Travel.dao;

import java.util.List;

import com.Travel.domain.PositionBean;

public interface PositionDAO {
	
	//직급List
	public List<PositionBean> getPositionList();
	//직급별정보 
	public PositionBean getPosition(String pst_id);
	public void updatePosition(PositionBean pb);
	public int chkPosition(String pst_id);
	public void insertPosition(PositionBean pb);
	public void deletePosition(String pst_id);
	
}
