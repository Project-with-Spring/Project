package com.Travel.dao;

import java.util.HashMap;
import java.util.List;

import com.Travel.domain.StaffBean;

public interface StaffDAO {

	public List<StaffBean> getStaffList(HashMap<String, Object> map);

	public void insertStaff(StaffBean sf);

	public int chkStf(int stf_id);

	public void deleteStaff(int stf_id);

	public StaffBean getStaff(int stf_id);

	public void updateStaff(StaffBean sb);
	
	public int countStaff(HashMap map);

	public List<StaffBean> getLoginStaffList();

}
