package com.Travel.service;

import java.util.List;

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
}
