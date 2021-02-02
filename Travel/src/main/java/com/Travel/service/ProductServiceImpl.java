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

	@Override
	public ProductBean getPdt(Long pdt_id) {
		return productDAO.getPdt(pdt_id);
	}

	@Override
	public void add(ProductBean pdt) {
		productDAO.add(pdt);
	}

	@Override
	public void update(ProductBean pdt) {
		productDAO.update(pdt);
		
	}

	@Override
	public void delete(Long pdt_id) {
		productDAO.delete(pdt_id);
	}
	
	
}
