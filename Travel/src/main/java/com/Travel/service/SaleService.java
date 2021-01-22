package com.Travel.service;

import java.util.List;

import com.Travel.domain.CategoryBean;
import com.Travel.domain.ProductBean;

public interface SaleService {
	public List<CategoryBean> getCategoryList(String ctg_type);
	
	public List<ProductBean> getProductList();
	
}
