package com.Travel.dao;

import java.util.HashMap;
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
		public List<StaffBean> getStaffList(HashMap<String, Object> map) {
			return sqlSession.selectList(namespace+".getStaffList",map);
		}

		@Override
		public void insertStaff(StaffBean sf) {
			sqlSession.insert(namespace+".insertStaff",sf);
		}

		@Override
		public int chkStf(int stf_id) {
			return sqlSession.selectOne(namespace+".chkStaff",stf_id);
		}

		@Override
		public void deleteStaff(int stf_id) {
			sqlSession.delete(namespace+".deleteStaff",stf_id);
		}

		@Override
		public StaffBean getStaff(int stf_id) {
			return sqlSession.selectOne(namespace+".getStaff",stf_id);
		}

		@Override
		public void updateStaff(StaffBean sb) {
			sqlSession.update(namespace+".updateStaff",sb);
			
		}

		@Override
		public int countStaff(HashMap map) {
			int countStaff = 0;
			return sqlSession.selectOne(namespace+".countStaff",map);
		}

		@Override
		public List<StaffBean> getLoginStaffList() {
			return sqlSession.selectList(namespace+".getLoginStaffList");
		}
}
