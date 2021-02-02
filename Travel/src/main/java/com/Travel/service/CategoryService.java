package com.Travel.service;

import java.util.List;

import com.Travel.domain.CategoryBean;

public interface CategoryService {

	public List<CategoryBean> getCtgList();

	public CategoryBean getCtg(String ctg_id);

}
