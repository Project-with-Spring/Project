package com.Travel.service;

import java.util.List;

import com.Travel.domain.StaffBean;

public interface StaffService {

	public List<StaffBean> getStaffList(String stf_name);

	public void insertStaff(StaffBean sf);

	public int chkStaff(int stf_id);

	public void deleteStaff(int stf_id);

	public StaffBean getStaff(int stf_id);

	public void updateStaff(StaffBean sb);


}
