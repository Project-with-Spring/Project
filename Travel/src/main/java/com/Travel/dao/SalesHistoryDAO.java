package com.Travel.dao;

import java.util.List;

import com.Travel.domain.OrderBean;
import com.Travel.domain.PageBean;

public interface SalesHistoryDAO {

	int getListCount();

	List<OrderBean> getList(PageBean pageBean);


}
