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

import net.sf.json.JSONArray;


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
	@RequestMapping("/list")
	public String ctgList(Model model) {
		// 카테고리 목록 불러오기
		List<CategoryBean> ctgList = categoryService.getCtgList();
		model.addAttribute("ctgList", ctgList);
		// 카테고리 목록을 json형태로 넘겨주기
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("ctgListByJson", jsonArray.fromObject(ctgList));
		
		List<ProductBean> pdtList = productService.getPdtList();
		model.addAttribute("pdtList", pdtList);
		
		List<StockBean> stcList = stockService.getStcList();
		model.addAttribute("stcList", stcList);
		
		return "sub2/categoryList";
	}
	
	
}
