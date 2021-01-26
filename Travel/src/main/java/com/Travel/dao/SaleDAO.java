package com.Travel.dao;

import java.util.List;

import com.Travel.domain.CategoryBean;
import com.Travel.domain.ProductBean;

public interface SaleDAO {

	List<CategoryBean> getCategoryList(String ctg_type);

	List<ProductBean> getProductList();

}
