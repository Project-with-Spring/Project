package com.Travel.dao;

import java.util.List;

import com.Travel.domain.StaffBean;

public interface StaffDAO {

	public List<StaffBean> getStaffList(String stf_name);

}
