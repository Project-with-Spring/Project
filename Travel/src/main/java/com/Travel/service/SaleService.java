package com.Travel.service;

import java.util.List;

import com.Travel.domain.CategoryBean;
import com.Travel.domain.OrdersBean;
import com.Travel.domain.OrderDetailBean;
import com.Travel.domain.ProductBean;

public interface SaleService {
	public List<CategoryBean> getCategoryList(String ctg_type);
	
	public List<ProductBean> getProductList();
	
	public void insertOrder(OrdersBean orderBean);
	
	public String getOrderId(OrdersBean orderBean);
	
	public void insertDetail(OrderDetailBean odtBean);
}
