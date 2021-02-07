package com.Travel.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Travel.domain.CommuteBean;
import com.Travel.domain.StaffBean;

@Repository
public class CommuteDAOImpl implements CommuteDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.Travel.mapper.CommuteMapper";


	@Override
	public List<CommuteBean> getStafCommutfList(HashMap map) {
		return sqlSession.selectList(namespace + ".selectCommutList",map);
	}


	@Override
	public List<CommuteBean> getStaffCommut(HashMap map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".selectCommute",map);
	}

	@Override
	public int cmtgo(int stf_id) { 
		return sqlSession.insert(namespace + ".cmtgo",stf_id);
		
	}

	@Override
	public int cmtgoChk(int stf_id) {
		return sqlSession.selectOne(namespace + ".cmtgoChk",stf_id);
	}

	@Override
	public void insertcmtgoList(int stf_id) {
		sqlSession.insert(namespace + ".insertcmtgoList",stf_id);
	}
	
	@Override
	public void deletecmtgoList(int stf_id) {
		sqlSession.delete(namespace + ".deletecmtgoList",stf_id);
	}

	@Override
	public int cmt_leave(int stf_id) {
		return sqlSession.update(namespace + ".cmt_leave",stf_id);
		
	}

	@Override
	public int cmtleaveChk(int stf_id) {
		return sqlSession.selectOne(namespace + ".cmtleaveChk",stf_id);
	}
	
	@Override
	public void insertcmtleaveList(int stf_id) {
		sqlSession.insert(namespace + ".insertcmtleaveList",stf_id);
	}

	@Override
	public void deletecmtleaveList(int stf_id) {
		sqlSession.delete(namespace + ".deletecmtleaveList",stf_id);
		
	}


	@Override
	public CommuteBean getStaffCommutOne(HashMap map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getStaffCommutOne",map);
	}


	@Override
	public void comumteModify(CommuteBean cmb) {
		sqlSession.update(namespace + ".updateCmt",cmb);
		
	}


	@Override
	public void commuteDelete(int cm_id) {
		sqlSession.delete(namespace + ".commuteDelete",cm_id);
		
	}


	@Override
	public StaffBean getStaffCommutOnetotal(HashMap map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getStaffCommutOnetotal",map);
	}


	@Override
	public int countCommute(HashMap map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".countCommute",map);
	}


	

}
