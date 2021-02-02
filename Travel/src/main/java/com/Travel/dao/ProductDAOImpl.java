package com.Travel.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Travel.domain.ProductBean;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.Travel.mapper.ProductMapper";
	
	@Override
	// Product 전체 목록 뽑아오기
	public List<ProductBean> getPdtList() {
		return sqlSession.selectList(namespace + ".selectProductList");
	}

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

}
