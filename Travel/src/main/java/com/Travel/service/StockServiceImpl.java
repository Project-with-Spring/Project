package com.Travel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.Travel.dao.StockDAO;
import com.Travel.domain.StockBean;

@Service
public class StockServiceImpl implements StockService {
	@Inject
	private StockDAO stockDAO;

	@Override
	// 재고 전체 목록 뽑아오기
	public List<StockBean> getStcList() {
		return stockDAO.getStcList();
	}
	
	

}
