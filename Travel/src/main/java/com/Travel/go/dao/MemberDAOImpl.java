package com.Travel.go.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	//mybatis 생성자 통해서 객체생성 
		@Inject
		private SqlSession sqlSession;
		private static final String namespace="com.itwillbs.mapper.MemberMapper";

}
