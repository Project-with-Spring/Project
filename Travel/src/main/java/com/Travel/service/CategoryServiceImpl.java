package com.Travel.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.Travel.dao.CategoryDAO;
import com.Travel.domain.CategoryBean;


@Service
public class CategoryServiceImpl implements CategoryService {

	private CategoryDAO categoryDAO;

	@Override
	public List<CategoryBean> getCtgList() {
		
		return categoryDAO.getCtgList();
	}
}
