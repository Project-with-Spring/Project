package com.Travel.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Travel.domain.StockBean;
import com.Travel.utill.Pagination;

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

	@Override
	public void add(StockBean stc) {
		sqlSession.insert(namespace + ".insertStock", stc);
	}

	@Override
	public StockBean getStc(Long stc_id) {
		return sqlSession.selectOne(namespace + ".selectStock", stc_id);
	}

	@Override
	public void update(StockBean stc) {
		sqlSession.update(namespace + ".updateStock", stc);
	}

	@Override
	public void delete(Long stc_id) {
		sqlSession.delete(namespace + ".deleteStock", stc_id);
	}

	@Override
	public int countStock() {
		return sqlSession.selectOne(namespace + ".countStock");
	}

	@Override
	public List<StockBean> selectStcListPage(Pagination pagination) {
		return sqlSession.selectList(namespace + ".stcListPage", pagination);
	} 
	
	

}
