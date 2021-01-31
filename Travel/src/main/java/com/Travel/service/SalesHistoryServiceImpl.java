package com.Travel.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.Travel.dao.SalesHistoryDAO;
import com.Travel.domain.OrderBean;
import com.Travel.domain.PageBean;

@Service
public class SalesHistoryServiceImpl implements SalesHistoryService {
	
	@Inject
	private SalesHistoryDAO salesHistoryDAO;

	@Override
	public int getListCount(Map<String, Object> searchMap) {
		System.out.println("SalesHistoryServiceImpl getListCount()");
		return salesHistoryDAO.getListCount(searchMap);
	}

	@Override
	public List<OrderBean> getList(Map<String, Object> searchMap) {
		System.out.println("SalesHistoryServiceImpl getList()");
		return salesHistoryDAO.getList(searchMap);
	}

	@Override
	public void updateMemo(OrderBean orderBean) {
		System.out.println("SalesHistoryServiceImpl updateMemo()");
		salesHistoryDAO.updateMemo(orderBean);
		
	}

	@Override
	public List<OrderBean> getChartList(Map<String, Integer> chartType) {
		System.out.println("SalesHistoryServiceImpl getChartList()");
		return salesHistoryDAO.getChartList(chartType);
	}

}
