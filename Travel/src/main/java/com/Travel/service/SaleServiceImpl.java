package com.Travel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.Travel.dao.SaleDAO;
import com.Travel.domain.CategoryBean;
import com.Travel.domain.OrderBean;
import com.Travel.domain.OrderDetailBean;
import com.Travel.domain.ProductBean;

@Service
public class SaleServiceImpl implements SaleService {
	
	@Inject
	private SaleDAO saleDAO;
	@Override
	public List<CategoryBean> getCategoryList(String ctg_type) {
		return saleDAO.getCategoryList(ctg_type);
	}

	@Override
	public List<ProductBean> getProductList() {
		return saleDAO.getProductList();
	}

	@Override
	public void insertOrder(OrderBean orderBean) {
		saleDAO.insertOrder(orderBean);
	}

	@Override
	public String getOrderId(OrderBean orderBean) {
		
		return saleDAO.getOrderId(orderBean);
	}

	@Override
	public void insertDetail(OrderDetailBean odtBean) {
		saleDAO.insertDetail(odtBean);
		
	}

}
