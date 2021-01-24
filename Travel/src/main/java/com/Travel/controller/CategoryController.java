package com.Travel.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Travel.domain.CategoryBean;
import com.Travel.domain.ProductBean;
import com.Travel.domain.StockBean;
import com.Travel.service.CategoryService;
import com.Travel.service.ProductService;
import com.Travel.service.StockService;


@Controller
// http://localhost:8080/go/ctg
@RequestMapping("/ctg")
public class CategoryController {
	
	@Inject
	private CategoryService categoryService;
	@Inject
	private ProductService productService;
	@Inject
	private StockService stockService;
	
	// http://localhost:8080/go/ctg/list
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String ctgList(Model model) {
		// 카테고리 목록 불러오기
		List<CategoryBean> ctgList = categoryService.getCtgList();
		model.addAttribute("ctgList", ctgList);
		
		List<ProductBean> pdtList = productService.getPdtList();
		model.addAttribute("pdtList", pdtList);
		
		List<StockBean> stcList = stockService.getStcList();
		model.addAttribute("stcList", stcList);
		
		return "sub2/categoryList";
	}
	
	// http://localhost:8080/go/ctg/add-pdt
	@RequestMapping("/add-pdt")
	public String addPdt() {
		
		return "redirect:/ctg/list";
	}
	
	
}
