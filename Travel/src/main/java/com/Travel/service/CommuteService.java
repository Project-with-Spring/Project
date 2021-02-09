package com.Travel.service;

import java.util.HashMap;
import java.util.List;

import com.Travel.domain.CommuteBean;
import com.Travel.domain.StaffBean;

public interface CommuteService {

	public  List<CommuteBean> getStafCommutfList(HashMap map);

	public List<CommuteBean> getStaffCommut(HashMap map);

	public int cmtgo(int stf_id);

	public int cmtgoChk(int stf_id);

	public int cmtleaveChk(int stf_id);

	public int cmt_leave(int stf_id);

	public void insertcmtgoList(int stf_id);

	public void deletecmtgoList(int stf_id);

	public void insertcmtleaveList(int stf_id);

	public void deletecmtleaveList(int stf_id);

	public CommuteBean getStaffCommutOne(HashMap map);

	public void comumteModify(CommuteBean cmb);

	public void commuteDelete(int cm_id);

	public StaffBean getStaffCommutOnetotal(HashMap map);

	public int countCommute(HashMap map);

	

}
