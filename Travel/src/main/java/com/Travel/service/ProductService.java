package com.Travel.service;

import java.util.List;

import com.Travel.domain.ProductBean;

public interface ProductService {

	public List<ProductBean> getPdtList();

	public ProductBean getPdt(Long pdt_id);

	public void add(ProductBean pdt);

	public void update(ProductBean pdt);

	public void delete(Long pdt_id);

}
