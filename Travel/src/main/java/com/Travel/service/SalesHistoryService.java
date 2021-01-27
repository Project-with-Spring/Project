package com.Travel.service;

import java.util.List;
import java.util.Map;

import com.Travel.domain.OrderBean;

public interface SalesHistoryService {

	int getListCount(Map<String, Object> searchMap);

	List<OrderBean> getList(Map<String, Object> searchMap);
	
}
