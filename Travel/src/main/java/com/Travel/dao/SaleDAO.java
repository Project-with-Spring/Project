package com.Travel.dao;

import java.util.List;

import com.Travel.domain.CategoryBean;
import com.Travel.domain.OrderBean;
import com.Travel.domain.OrderDetailBean;
import com.Travel.domain.PointBean;
import com.Travel.domain.ProductBean;

public interface SaleDAO {

	public List<CategoryBean> getCategoryList(String ctg_type);

	public List<ProductBean> getProductList();

	public void insertOrder(OrderBean orderBean);

	public String getOrderId(OrderBean orderBean);

	public void insertDetail(OrderDetailBean odtBean);

	public String getPoint(PointBean potBean);

	public void insertPointId(PointBean potBean);

	public void updatePoint(PointBean potBean);

	public void updateOrdPoint(PointBean potBean);

}
