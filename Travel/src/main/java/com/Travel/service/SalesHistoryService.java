package com.Travel.service;

import java.util.List;

import com.Travel.domain.OrdersBean;
import com.Travel.domain.PageBean;

public interface SalesHistoryService {

	int getListCount();

	List<OrdersBean> getList(PageBean pageBean);
	
}
