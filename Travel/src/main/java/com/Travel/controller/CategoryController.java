package com.Travel.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.Travel.domain.CategoryBean;
import com.Travel.domain.ProductBean;
import com.Travel.domain.StockBean;
import com.Travel.service.CategoryService;
import com.Travel.service.ProductService;
import com.Travel.service.StockService;
import com.Travel.utill.Pagination;
import com.Travel.utill.Search;

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
			@RequestParam(value="nowPage", required=false, defaultValue="1")String nowPage,
			@RequestParam(value="searchType", required=false, defaultValue="none")String searchType,
			@RequestParam(value="searchText", required=false)String searchText) {

		
		// 검색 설정
		Search search = new Search();
		search.setSearchType(searchType);
		
		// 카테고리, 상품, 재고 의 저장된 총 갯수를 저장할 변수
		int ctgTotal = 0, pdtTotal = 0, stcTotal = 0;
		if(search.getSearchType().equals("ctg_name") || search.getSearchType().equals("ctg_type")) {
			ctgTotal = categoryService.countCategory(search);
		} else if(search.getSearchType().equals("pdt_name")) {
			pdtTotal = productService.countProduct(search);
			
		} else if(search.getSearchType().equals("stc_name")) {
			stcTotal = stockService.countStock(search);
			
		} else if(search.getSearchType().equals("none")) {
			search.setSearchType("ctg_name");
			ctgTotal = categoryService.countCategory(search);
			
			search.setSearchType("pdt_name");
			pdtTotal = productService.countProduct(search);
			

			search.setSearchType("stc_name");
			stcTotal = stockService.countStock(search);
		}
		
		// 카테고리 목록 불러오기
		// 페이징
		search = new Search(ctgTotal, Integer.parseInt(nowPage));
		
		search.setSearchType(searchType);
		if(searchType.equals("ctg_type")) {
			if(searchText.equals("재고")) searchText = "2";
			else searchText = "1";
		}
		search.setSearchText(searchText);
		
		model.addAttribute("ctgPage", search);
		
		List<CategoryBean> ctgList = categoryService.getCtgList(search);
		model.addAttribute("ctgList", ctgList);
		
		// 카테고리 목록을 json형태로 넘겨주기
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("ctgListByJson", jsonArray.fromObject(ctgList));
		
		
		// 검색 설정
		search = new Search(pdtTotal, Integer.parseInt(nowPage));
		search.setSearchType("pdt_name");
		search.setSearchText(searchText);
		
		model.addAttribute("pdtPage", search);
		
		
		List<ProductBean> pdtList = productService.selectProductListPage(search);
		model.addAttribute("pdtList", pdtList);
		
		// 검색 설정
		search = new Search(stcTotal, Integer.parseInt(nowPage));
		search.setSearchType("stc_name");
		search.setSearchText(searchText);
		
		model.addAttribute("stcPage", search);
		
		
		List<StockBean> stcList = stockService.selectStcListPage(search);
		model.addAttribute("stcList", stcList);
		
		return "sub2/categoryList";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String ctgAdd(CategoryBean ctg) {
//		ctg.setCtg_name((String) request.getAttribute("ctgName"));
//		ctg.setCtg_type((String) request.getAttribute("ctgType"));
		categoryService.add(ctg);
		return "redirect:/ctg/list";
	}
	
	@RequestMapping(value="/update/{ctg_id}", method=RequestMethod.POST)
	public String update(@PathVariable Long ctg_id, CategoryBean ctg) {
		if(ctg_id == ctg.getCtg_id()) {
			categoryService.update(ctg);
		}
		
		return "redirect:/ctg/list";
	}
	
	@RequestMapping("/delete/{ctg_id}")
	public String delete(@PathVariable Long ctg_id) {
		categoryService.delete(ctg_id);
		
		return "redirect:/ctg/list";
	}

	
}
