package com.Travel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.Travel.dao.PositionDAO;
import com.Travel.domain.PositionBean;

@Service 
public class PositionServiceImpl implements PositionService{

	private PositionDAO positionDAO;
	
	
	@Inject
	public void setPostion(PositionDAO positionDAO) {
		this.positionDAO = positionDAO;
	}

	
	@Override
	public List<PositionBean> getPositionList() {
		// TODO Auto-generated method stub
		return positionDAO.getPositionList();
	}

	@Override
	public PositionBean getPosition(String pst_id) {
		// TODO Auto-generated method stub
		return positionDAO.getPosition(pst_id);
	}


	@Override
	public void updatePostion(PositionBean pb) {	
		positionDAO.updatePosition(pb);
		
	}

	@Override
	public int chkPostion(String pst_id) {
		return positionDAO.chkPosition(pst_id);
	}


	@Override
	public void insertPostion(PositionBean pb) {
		positionDAO.insertPosition(pb);
		
	}


	@Override
	public void deletePostion(String pst_id) {
		positionDAO.deletePosition(pst_id);
		
	}

}
