package com.Travel.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.Travel.dao.CommuteDAO;
import com.Travel.domain.CommuteBean;
import com.Travel.domain.StaffBean;



@Service
public class CommuteServiceImpl implements CommuteService{
	
	@Inject
	private CommuteDAO commuteDAO;

	@Override
	public List<CommuteBean> getStafCommutfList(HashMap map) {
		// TODO Auto-generated method stub
		return commuteDAO.getStafCommutfList(map);
	}

	@Override
	public List<CommuteBean> getStaffCommut(HashMap map) {
		return commuteDAO.getStaffCommut(map);
	}

	@Override
	public int cmtgo(int stf_id) {
		return commuteDAO.cmtgo(stf_id);
		
	}

	@Override
	public int cmtgoChk(int stf_id) {
		return commuteDAO.cmtgoChk(stf_id);
	}

	@Override
	public int cmtleaveChk(int stf_id) {
		// TODO Auto-generated method stub
		return commuteDAO.cmtleaveChk(stf_id);
	}

	@Override
	public int cmt_leave(int stf_id) {
		return commuteDAO.cmt_leave(stf_id);
		
	}

	@Override
	public void insertcmtgoList(int stf_id) {
		commuteDAO.insertcmtgoList(stf_id);
		
	}

	@Override
	public void deletecmtgoList(int stf_id) {
		commuteDAO.deletecmtgoList(stf_id);
		
	}

	@Override
	public void insertcmtleaveList(int stf_id) {
		commuteDAO.insertcmtleaveList(stf_id);
		
	}
	@Override
	public void deletecmtleaveList(int stf_id) {
		commuteDAO.deletecmtleaveList(stf_id);
		
	}

	@Override
	public CommuteBean getStaffCommutOne(HashMap map) {
		return commuteDAO.getStaffCommutOne(map);
	}

	@Override
	public void comumteModify(CommuteBean cmb) {
		 commuteDAO.comumteModify(cmb);
		
	}

	@Override
	public void commuteDelete(int cm_id) {
		 commuteDAO.commuteDelete(cm_id);
		
	}

	@Override
	public StaffBean getStaffCommutOnetotal(HashMap map) {
		// TODO Auto-generated method stub
		return commuteDAO.getStaffCommutOnetotal(map);
	}

	@Override
	public int countCommute(HashMap map) {
		return commuteDAO.countCommute(map);
	}

}
