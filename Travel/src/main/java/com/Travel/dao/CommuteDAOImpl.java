package com.Travel.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Travel.domain.CommuteBean;

@Repository
public class CommuteDAOImpl implements CommuteDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.Travel.mapper.CommuteMapper";


	@Override
	public List<CommuteBean> getStafCommutfList() {
		System.out.println("getStafCommutfList");
		
		return sqlSession.selectList(namespace + ".selectCommutList");
	}
	

}
