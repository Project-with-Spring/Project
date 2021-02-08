package com.Travel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Travel.dao.StockDAO;
import com.Travel.domain.StockBean;
import com.Travel.utill.Pagination;

@Service
public class StockServiceImpl implements StockService {
	@Inject
	private StockDAO stockDAO;

	@Override
	// 재고 전체 목록 뽑아오기
	public List<StockBean> getStcList() {
		return stockDAO.getStcList();
	}

	@Override
	@Transactional
	public void add(StockBean stc) {
		stockDAO.add(stc);
	}

	@Override
	public StockBean getStc(Long stc_id) {
		return stockDAO.getStc(stc_id);
	}

	@Override
	public void update(StockBean stc) {
		stockDAO.update(stc);
	}

	@Override
	public void delete(Long stc_id) {
		stockDAO.delete(stc_id);
	}

	@Override
	public int countStock() {
		return stockDAO.countStock();
	}

	@Override
	public List<StockBean> selectStcListPage(Pagination pagination) {
		return stockDAO.selectStcListPage(pagination);
	}
	
	

}
