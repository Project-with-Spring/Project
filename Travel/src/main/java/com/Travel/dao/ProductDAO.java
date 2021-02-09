package com.Travel.dao;

import java.util.List;

import com.Travel.domain.ProductBean;
import com.Travel.utill.Pagination;
import com.Travel.utill.Search;

public interface ProductDAO {

	public ProductBean getPdt(Long pst_id);

	public void add(ProductBean pdt);

	public void update(ProductBean pdt);

	public void delete(Long pdt_id);

	public int countProduct(Search search);

	public List<ProductBean> selectProductListPage(Search search);

	public List<ProductBean> getPdtList();

}
