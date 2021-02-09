package com.Travel.service;

import java.util.List;

import com.Travel.domain.ProductBean;
import com.Travel.utill.Pagination;
import com.Travel.utill.Search;

public interface ProductService {


	public ProductBean getPdt(Long pdt_id);

	public void add(ProductBean pdt);

	public void update(ProductBean pdt);

	public void delete(Long pdt_id);

	public int countProduct(Search search);

	public List<ProductBean> selectProductListPage(Search search);

	public List<ProductBean> getPdtList();

}
