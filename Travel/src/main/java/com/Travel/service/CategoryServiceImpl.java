package com.Travel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.Travel.dao.CategoryDAO;
import com.Travel.domain.CategoryBean;
import com.Travel.utill.Search;


@Service
public class CategoryServiceImpl implements CategoryService {

	@Inject
	private CategoryDAO categoryDAO;

	@Override
	public CategoryBean getCtg(String ctg_id) {
		return categoryDAO.getCtg(ctg_id);
	}
//
//	@Override
//	public List<CategoryBean> ctgPdtListPage(int start) {
//		Map<String, Object> map = new HashMap<>();
//		map.put("start", start);
//		
//		return categoryDAO.getCtgPdtList(map);
//	}

	@Override
	public int countCategory(Search search) {
		return categoryDAO.countCategory(search);
	}

	@Override
	public List<CategoryBean> getCtgList(Search search) {
		return categoryDAO.getCtgList(search);
	}

	@Override
	public void delete(Long ctg_id) {
		categoryDAO.delete(ctg_id);
	}

	@Override
	public void add(CategoryBean ctg) {
		categoryDAO.add(ctg);
	}

	@Override
	public void update(CategoryBean ctg) {
		categoryDAO.update(ctg);
	}

}
