package com.Travel.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Travel.domain.CategoryBean;
import com.Travel.utill.Search;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.Travel.mapper.CategoryMapper"; 

	@Override
	public CategoryBean getCtg(String ctg_id) {
		return sqlSession.selectOne(namespace + ".selectCategory", ctg_id);
	}

	@Override
	public int countCategory(Search search) {
		return sqlSession.selectOne(namespace + ".countCategory", search);
	}

	@Override
	public List<CategoryBean> getCtgList(Search search) {
		return sqlSession.selectList(namespace + ".selectCategoryList", search);
	}

	@Override
	public void delete(Long ctg_id) {
		sqlSession.delete(namespace + ".deleteCtg", ctg_id);
	}

	@Override
	public void add(CategoryBean ctg) {
		sqlSession.insert(namespace + ".insertCtg", ctg);
	}

	@Override
	public void update(CategoryBean ctg) {
		sqlSession.update(namespace + ".updateCtg", ctg);
	}
	

}
