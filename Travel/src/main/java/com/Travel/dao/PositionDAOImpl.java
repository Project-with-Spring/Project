package com.Travel.dao;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.Travel.domain.PositionBean;


@Repository
public class PositionDAOImpl implements PositionDAO{


	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.Travel.mapper.PositionMapper"; 

	@Override
	public List<PositionBean> getPositionList() {
		return sqlSession.selectList(namespace+".getPositionList");
	}
	
	@Override
	public PositionBean getPosition(String pst_id) {
		return sqlSession.selectOne(namespace+".getPosition",pst_id);
	}

	@Override
	public void updatePosition(PositionBean pb) {
		sqlSession.update(namespace+".updatePosition",pb);
		
	}

	@Override
	public int chkPosition(String pst_id) {
		return sqlSession.selectOne(namespace+".chkPosition",pst_id);
	}

	@Override
	public void insertPosition(PositionBean pb) {
		sqlSession.insert(namespace+".insertPosition",pb);
		
	}

	@Override
	public void deletePosition(String pst_id) {
		sqlSession.insert(namespace+".deletePosition",pst_id);
		
	}
	
}
