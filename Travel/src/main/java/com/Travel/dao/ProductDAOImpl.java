package com.Travel.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Travel.domain.ProductBean;
import com.Travel.utill.Pagination;
import com.Travel.utill.Search;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.Travel.mapper.ProductMapper";
	
	@Override
	public ProductBean getPdt(Long pdt_id) {
		return sqlSession.selectOne(namespace + ".selectProduct", pdt_id);
	}

	@Override
	public void add(ProductBean pdt) {
		sqlSession.insert(namespace + ".insertProduct", pdt);
	}

	@Override
	public void update(ProductBean pdt) {
		sqlSession.update(namespace + ".updateProduct", pdt);
	}

	@Override
	public void delete(Long pdt_id) {
		sqlSession.delete(namespace + ".deleteProduct", pdt_id);
	}

	@Override
	public int countProduct(Search search) {
		return sqlSession.selectOne(namespace + ".countProduct", search);
	}

	@Override
	// Product 전체 목록 뽑아오기
	public List<ProductBean> selectProductListPage(Search search) {
		return sqlSession.selectList(namespace + ".pdtListPage", search);
	}

	@Override
	public List<ProductBean> getPdtList() {
		return sqlSession.selectList(namespace + ".selectPdtList");
	} 

}
