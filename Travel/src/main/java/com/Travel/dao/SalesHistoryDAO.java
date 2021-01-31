package com.Travel.dao;

import java.util.List;
import java.util.Map;

import com.Travel.domain.OrderBean;
import com.Travel.domain.OrderDetailBean;

public interface SalesHistoryDAO {

	int getListCount(Map<String, Object> searchMap);

	List<OrderBean> getList(Map<String, Object> searchMap);

	void updateMemo(OrderBean orderBean);

	List<OrderBean> getChartList(Map<String, Integer> chartType);

	List<OrderDetailBean> getPopularityList();

	List<OrderDetailBean> getChartBarList(String pdt_name);



}
