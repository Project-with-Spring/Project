package com.Travel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.Travel.dao.SaleDAO;
import com.Travel.domain.CategoryBean;
import com.Travel.domain.OrderBean;
import com.Travel.domain.OrderDetailBean;
import com.Travel.domain.PointBean;
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

	@Override
	public String getPoint(PointBean potBean) {
		return saleDAO.getPoint(potBean);
	}

	@Override
	public void insertPointId(PointBean potBean) {
		saleDAO.insertPointId(potBean);
		
	}

	@Override
	public void updatePoint(PointBean potBean) {
		saleDAO.updatePoint(potBean);
	}

	@Override
	public void updateOrdPoint(PointBean potBean) {
		saleDAO.updateOrdPoint(potBean);
	}

	@Override
	public List<OrderBean> getSaveOrderList() {
		return saleDAO.getSaveOrderList();
	}

	@Override
	public void deleteOrder(String ord_id) {
		saleDAO.deleteOrder(ord_id);
		
	}

	@Override
	public OrderBean getSaveOrder(String ord_id) {
		return saleDAO.getSaveOrder(ord_id);
	}

	@Override
	public List<OrderDetailBean> getOrderDetail(String ord_id) {
		// TODO Auto-generated method stub
		return saleDAO.getSaveOrderDetail(ord_id);
	}

}
