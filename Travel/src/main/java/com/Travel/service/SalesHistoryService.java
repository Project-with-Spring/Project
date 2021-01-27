package com.Travel.service;

import java.util.List;

import com.Travel.domain.OrderBean;
import com.Travel.domain.PageBean;

public interface SalesHistoryService {

	int getListCount();

	List<OrderBean> getList(PageBean pageBean);
	
}
