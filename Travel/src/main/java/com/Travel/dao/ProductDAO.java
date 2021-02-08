package com.Travel.dao;

import java.util.List;

import com.Travel.domain.ProductBean;
import com.Travel.utill.Pagination;

public interface ProductDAO {

	public List<ProductBean> getPdtList();

	public ProductBean getPdt(Long pst_id);

	public void add(ProductBean pdt);

	public void update(ProductBean pdt);

	public void delete(Long pdt_id);

	public int countProduct();

	public List<ProductBean> selectProductListPage(Pagination pagination);

}
