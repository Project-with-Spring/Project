package com.Travel.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Travel.domain.StockBean;

@Repository
public class StockDAOImpl implements StockDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.Travel.mapper.StockMapper";
	
	@Override
	// 재고 전체 목록 뽑아오기
	public List<StockBean> getStcList() {
		return sqlSession.selectList(namespace + ".selectStockList");
	} 
	
	

}
