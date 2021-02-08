package com.Travel.dao;

import java.util.List;
import java.util.Map;

import com.Travel.domain.CategoryBean;

public interface CategoryDAO {

	
	public List<CategoryBean> getCtgList();

	public CategoryBean getCtg(String ctg_id);

	public List<CategoryBean> getCtgPdtList(Map<String, Object> map);
	

}
