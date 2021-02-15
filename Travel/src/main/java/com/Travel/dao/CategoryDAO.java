package com.Travel.dao;

import java.util.List;
import java.util.Map;

import com.Travel.domain.CategoryBean;
import com.Travel.utill.Search;

public interface CategoryDAO {

	
	public List<CategoryBean> getCtgList(Search search);

	public CategoryBean getCtg(String ctg_id);

	public int countCategory(Search search);

	public void delete(Long ctg_id);

	public void add(CategoryBean ctg);

	public void update(CategoryBean ctg);
	

}
