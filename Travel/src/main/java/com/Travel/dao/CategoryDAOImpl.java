package com.Travel.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Travel.domain.CategoryBean;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.Travel.mapper.CategoryMapper"; 

	@Override
	public List<CategoryBean> getCtgList() {
		return sqlSession.selectList(namespace + ".selectCategoryList");
	}
	

}
