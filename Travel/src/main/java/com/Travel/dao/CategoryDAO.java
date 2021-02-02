package com.Travel.dao;

import java.util.List;

import com.Travel.domain.CategoryBean;

public interface CategoryDAO {

	
	public List<CategoryBean> getCtgList();

	public CategoryBean getCtg(String ctg_id);
	

}
