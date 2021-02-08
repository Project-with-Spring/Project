package com.Travel.service;

import java.util.List;
import java.util.Map;

import com.Travel.domain.CategoryBean;

public interface CategoryService {

	public List<CategoryBean> getCtgList();

	public CategoryBean getCtg(String ctg_id);

	public List<CategoryBean> ctgPdtListPage(int start);
}
