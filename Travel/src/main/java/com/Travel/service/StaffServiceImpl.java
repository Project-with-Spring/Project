package com.Travel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.Travel.dao.StaffDAO;
import com.Travel.domain.StaffBean;

@Service
public class StaffServiceImpl implements StaffService{

	@Inject
	private StaffDAO staffDAO;

	@Override
	public List<StaffBean> getStaffList(String stf_name) {
		
		return  staffDAO.getStaffList(stf_name);
	}
	
}
