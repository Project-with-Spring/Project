package com.Travel.service;

import java.util.List;
import java.util.Map;

import com.Travel.domain.OrderBean;
import com.Travel.domain.OrderDetailBean;

public interface SalesHistoryService {

	int getListCount(Map<String, Object> searchMap);

	List<OrderBean> getList(Map<String, Object> searchMap);

	void updateMemo(OrderBean orderBean);

	List<OrderBean> getChartList(Map<String, Object> chartType);

	List<OrderDetailBean> getPopularityList();

	List<OrderDetailBean> getChartBarList(Map<String, Object> chartType);

	List<OrderDetailBean> getOdtList(int ord_id);

	OrderBean getOrdList(int ord_id);
	
}
