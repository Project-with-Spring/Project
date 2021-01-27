package com.Travel.dao;

import java.util.List;

import com.Travel.domain.OrdersBean;
import com.Travel.domain.PageBean;

public interface SalesHistoryDAO {

	int getListCount();

	List<OrdersBean> getList(PageBean pageBean);


}
