package com.Travel.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.Travel.domain.CategoryBean;
import com.Travel.domain.ProductBean;
import com.Travel.service.CategoryService;
import com.Travel.service.ProductService;
import com.Travel.utill.Search;

@Controller
//http://localhost:8080/go/pdt
@RequestMapping("/pdt")
public class ProductController {
	
	@Inject
	private ProductService productService;
	@Inject
	private CategoryService categoryService;
	
	// http://localhost:8080/go/pdt/list
	@RequestMapping("/list")
	public String list(Model model,
			@RequestParam(value="nowPage", required=false, defaultValue="1")String nowPage,
			@RequestParam(value="searchText", required=false)String searchText,
			@RequestParam(value="ctgSort", required=false)String ctgSort,
			@RequestParam(value="pdtSort", required=false)String pdtSort) {
		
		Search search = new Search();
		search.setSearchType("pdt_name");
		
		int pdtTotal = productService.countProduct(search);

		search = new Search(pdtTotal, Integer.parseInt(nowPage));
		search.setSearchType("pdt_name");
		search.setSearchText(searchText);
		search.setCtgSort(ctgSort);
		search.setPdtSort(pdtSort);
		
		model.addAttribute("pdtPage", search);
		
		List<ProductBean> pdtList = productService.selectProductListPage(search);
		model.addAttribute("pdtList", pdtList);
		
		return "sub2/productList";
	}
	
	// http://localhost:8080/go/pdt/list/{pdt_id}
	@RequestMapping("/list/{pdt_id}")
	public String detail(Model model, @PathVariable Long pdt_id) {
		
		ProductBean pdt = productService.getPdt(pdt_id);
		CategoryBean ctg = categoryService.getCtg(pdt.getCtg_id());

		model.addAttribute("pdt", pdt);
		model.addAttribute("ctg", ctg);
		
		return "sub2/pdtDetail";
	}
	
	//http://localhost:8080/go/pdt/add
	@RequestMapping(value="/add", method = RequestMethod.POST)
	public String pdtAdd(ProductBean pdt) {
		productService.add(pdt);
		return "redirect:/ctg/list";
	}

	
	// http://localhost:8080/go/pdt/update/{pdt_id }
	@RequestMapping("/update/{pdt_id}")
	public String update(@PathVariable Long pdt_id, Model model) {
		ProductBean pdt = productService.getPdt(pdt_id);
		model.addAttribute("pdt", pdt);
		
		return "sub2/pdtUpdate";
	}
	
	//http://localhost:8080/go/pdt/update/{pdt_id}/post
	@RequestMapping(value="/update/{pdt_id}/post", method = RequestMethod.POST)
	public String updatePost(ProductBean pdt) {
		productService.update(pdt);
		return "redirect:/pdt/list";
	}

	//http://localhost:8080/go/pdt/delete/{pdt_id}	
	@RequestMapping("/delete/{pdt_id}")
	public String delete(@PathVariable Long pdt_id) {
		productService.delete(pdt_id);
		return "redirect:/pdt/list";
	}
	
	
	
	
	
	
	
	
	
}
