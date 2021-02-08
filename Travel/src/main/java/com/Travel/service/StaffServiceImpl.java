package com.Travel.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.Travel.dao.StaffDAO;
import com.Travel.domain.PageBean;
import com.Travel.domain.StaffBean;

@Service
public class StaffServiceImpl implements StaffService{

	@Inject
	private StaffDAO staffDAO;

	@Override
	public List<StaffBean> getStaffList(HashMap<String, Object> map) {		
		return  staffDAO.getStaffList(map);
	}

	@Override
	public void insertStaff(StaffBean sf) {
		staffDAO.insertStaff(sf);
	}

	@Override
	public int chkStaff(int stf_id) {
		return staffDAO.chkStf(stf_id);
	}

	@Override
	public void deleteStaff(int stf_id) {
		staffDAO.deleteStaff(stf_id);
		
	}

	@Override
	public StaffBean getStaff(int stf_id) {	
		return  staffDAO.getStaff(stf_id);
	}

	@Override
	public void updateStaff(StaffBean sb) {
		staffDAO.updateStaff(sb);
		
	}

	@Override
	public int countStaff(HashMap map) {
		return staffDAO.countStaff(map);
	}

	@Override
	public List<StaffBean> getLoginStaffList() {
		// TODO Auto-generated method stub
		return staffDAO.getLoginStaffList();
	}
	
}
