package com.Travel.dao;



import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Travel.domain.OrderBean;


@Repository
public class SalesHistoryDAOImpl implements SalesHistoryDAO {
	//mybatis 생성자 통해서 객체생성 
		@Inject
		private SqlSession sqlSession;
		private static final String namespace="com.Travel.mapper.SalesHistoryMapper";
		@Override
		public int getListCount(Map<String, Object> searchMap) {
			System.out.println("SalesHistoryDAOImpl getListCount()");
			return sqlSession.selectOne(namespace+".getListCount", searchMap);
		}
		@Override
		public List<OrderBean> getList(Map<String, Object> searchMap) {
			System.out.println("SalesHistoryDAOImpl getList()");
			return sqlSession.selectList(namespace+".getList", searchMap);
		}
		@Override
		public void updateMemo(OrderBean orderBean) {
			System.out.println("SalesHistoryDAOImpl updateMemo()");
			sqlSession.update(namespace+".updateMemo", orderBean);
		}
		@Override
		public List<OrderBean> getChartList(Map<String, Integer> chartType) {
			System.out.println("SalesHistoryDAOImpl getChartList()");
			return sqlSession.selectList(namespace+".getChartList", chartType);
		}

}
