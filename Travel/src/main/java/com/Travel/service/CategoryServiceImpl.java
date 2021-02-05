package com.Travel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.Travel.dao.CategoryDAO;
import com.Travel.domain.CategoryBean;


@Service
public class CategoryServiceImpl implements CategoryService {

	@Inject
	private CategoryDAO categoryDAO;

	@Override
	public List<CategoryBean> getCtgList() {
		
		return categoryDAO.getCtgList();
	}

	@Override
	public CategoryBean getCtg(String ctg_id) {
		return categoryDAO.getCtg(ctg_id);
	}

	@Override
	public List<CategoryBean> ctgPdtListPage(int start) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		
		return categoryDAO.getCtgPdtList(map);
	}
}
