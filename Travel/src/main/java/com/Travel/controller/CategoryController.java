package com.Travel.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Travel.service.CategoryService;

import lombok.NoArgsConstructor;

@Controller
// http://localhost:8080/go/ctg
@RequestMapping("/ctg")
// 생성자 자동생성
@NoArgsConstructor
public class CategoryController {
	
	@Inject
	private CategoryService categoryService;
	
	// http://localhost:8080/go/ctg/list
	@RequestMapping("/list")
	public String ctgList(Model model) {
		model.addAttribute("ctgList", categoryService.getCtgList());
		return "sub2/itemCategories";
	}
	
	// http://localhost:8080/go/ctg/add-pdt
	@RequestMapping("/add-pdt")
	public String addPdt() {
		
		return "redirect:/ctg/list";
	}
}
