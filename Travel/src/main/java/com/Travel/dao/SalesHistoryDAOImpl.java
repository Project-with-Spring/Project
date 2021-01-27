package com.Travel.dao;



import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Travel.domain.OrderBean;
import com.Travel.domain.PageBean;


@Repository
public class SalesHistoryDAOImpl implements SalesHistoryDAO {
	//mybatis 생성자 통해서 객체생성 
		@Inject
		private SqlSession sqlSession;
		private static final String namespace="com.Travel.mapper.SalesHistoryMapper";
		@Override
		public int getListCount() {
			System.out.println("SalesHistoryDAOImpl getListCount()");
			return sqlSession.selectOne(namespace+".getListCount");
		}
		@Override
		public List<OrderBean> getList(PageBean pageBean) {
			System.out.println("SalesHistoryDAOImpl getList()");
			return sqlSession.selectList(namespace+".getList", pageBean);
		}

}
