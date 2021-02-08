package com.Travel.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Travel.domain.CategoryBean;
import com.Travel.domain.ProductBean;
import com.Travel.domain.StockBean;
import com.Travel.service.CategoryService;
import com.Travel.service.ProductService;
import com.Travel.service.StockService;
import com.Travel.utill.Pagination;

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
	public String ctgList( Model model,
			@RequestParam(value="nowPage", required=false)String nowPage) {

		Pagination pdtPage, stcPage;
		// 카테고리 목록 불러오기
		List<CategoryBean> ctgList = categoryService.getCtgList();
		model.addAttribute("ctgList", ctgList);
		// 카테고리 목록을 json형태로 넘겨주기
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("ctgListByJson", jsonArray.fromObject(ctgList));
		
		// tabs-1 Product List 페이징
		int pdtTotal = productService.countProduct();
		if(nowPage == null) {
			nowPage = "1";
		}
		pdtPage = new Pagination(pdtTotal, Integer.parseInt(nowPage), 20);
		model.addAttribute("pdtPage", pdtPage);
		
		List<ProductBean> pdtList = productService.selectProductListPage(pdtPage);
		model.addAttribute("pdtList", pdtList);
		
		// tabs-2 Stock List 페이징
		int stcTotal = stockService.countStock();
		if(nowPage == null) {
			nowPage = "1";
		}
		stcPage = new Pagination(stcTotal, Integer.parseInt(nowPage), 20);
		model.addAttribute("stcPage", stcPage);
		
		
		List<StockBean> stcList = stockService.selectStcListPage(stcPage);
		model.addAttribute("stcList", stcList);
		
		return "sub2/categoryList";
	}

	
}
