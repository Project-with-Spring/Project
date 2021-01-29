package com.Travel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.Travel.dao.ProductDAO;
import com.Travel.domain.ProductBean;

@Service
public class ProductServiceImpl implements ProductService {
	@Inject
	private ProductDAO productDAO;

	@Override
	// Product 전체 목록 뽑아오기
	public List<ProductBean> getPdtList() {
		return productDAO.getPdtList();
	}
	
	
}
