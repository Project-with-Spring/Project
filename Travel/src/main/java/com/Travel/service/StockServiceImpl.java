package com.Travel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Travel.dao.StockDAO;
import com.Travel.domain.StockBean;
import com.Travel.utill.Pagination;
import com.Travel.utill.Search;

@Service
public class StockServiceImpl implements StockService {
	@Inject
	private StockDAO stockDAO;

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
	public int countStock(Search search) {
		return stockDAO.countStock(search);
	}

	@Override
	// 재고 전체 목록 뽑아오기
	public List<StockBean> selectStcListPage(Search search) {
		return stockDAO.selectStcListPage(search);
	}
	
	

}
