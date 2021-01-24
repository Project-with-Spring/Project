package com.Travel.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class StaffDAOImpl implements StaffDAO{

	//mybatis 생성자 통해서 객체생성 
		@Inject
		private SqlSession sqlSession;
		private static final String namespace="com.Travel.mapper.StaffMapper";
}
