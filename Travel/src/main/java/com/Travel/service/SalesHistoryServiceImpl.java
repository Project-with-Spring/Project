package com.Travel.service;

import java.util.List;

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
	public int getListCount() {
		System.out.println("SalesHistoryServiceImpl getListCount()");
		return salesHistoryDAO.getListCount();
	}

	@Override
	public List<OrderBean> getList(PageBean pageBean) {
		System.out.println("SalesHistoryServiceImpl getList()");
		return salesHistoryDAO.getList(pageBean);
	}

}
