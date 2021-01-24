package com.Travel.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Travel.domain.StaffBean;

@Repository
public class StaffDAOImpl implements StaffDAO{

	//mybatis 생성자 통해서 객체생성 
		@Inject
		private SqlSession sqlSession;
		private static final String namespace="com.Travel.mapper.StaffMapper";
		
		@Override
		public List<StaffBean> getStaffList(String stf_name) {
			// TODO Auto-generated method stub
			return sqlSession.selectList(namespace+".getStaffList",stf_name);
		}
}
