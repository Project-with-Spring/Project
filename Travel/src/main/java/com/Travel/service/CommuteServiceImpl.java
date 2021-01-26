package com.Travel.service;
import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.Travel.dao.CommuteDAO;
import com.Travel.domain.CommuteBean;



@Service
public class CommuteServiceImpl implements CommuteService{
	
	@Inject
	private CommuteDAO commuteDAO;

	@Override
	public List<CommuteBean> getStafCommutfList() {
		// TODO Auto-generated method stub
		return commuteDAO.getStafCommutfList();
	}
	
}
