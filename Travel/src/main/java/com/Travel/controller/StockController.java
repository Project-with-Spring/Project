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
import com.Travel.domain.StockBean;
import com.Travel.service.CategoryService;
import com.Travel.service.StockService;
import com.Travel.utill.Search;

@Controller
//http://localhost:8080/go/stc
@RequestMapping("/stc")
public class StockController {
	
	@Inject
	private StockService stockService;
	@Inject
	private CategoryService categoryService;
	
	//http://localhost:8080/go/stc/list
	@RequestMapping("/list")
	public String list(Model model,
			@RequestParam(value="nowPage", required=false, defaultValue="1")String nowPage,
			@RequestParam(value="searchText", required=false)String searchText) {
		
		Search search = new Search();
		search.setSearchType("stc_name");
		
		int stcTotal = stockService.countStock(search);
		
		search = new Search(stcTotal, Integer.parseInt(nowPage));
		search.setSearchType("stc_name");
		search.setSearchText(searchText);
		
		model.addAttribute("stcPage", search);

		List<StockBean> stcList = stockService.selectStcListPage(search);
		model.addAttribute("stcList", stcList);
		
		return "sub2/stockList";
	}
	

	// http://localhost:8080/go/pdt/list/{stc_id}
	@RequestMapping("/list/{stc_id}")
	public String detail(Model model, @PathVariable Long stc_id) {
		StockBean stc = stockService.getStc(stc_id);
		CategoryBean ctg = categoryService.getCtg(stc.getCtg_id());
		
		model.addAttribute("stc", stc);
		model.addAttribute("ctg", ctg);
		
		return "sub2/stcDetail";
	}
	
	//http://localhost:8080/go/stc/add
	@RequestMapping(value="/add", method = RequestMethod.POST)
	public String stcAdd(StockBean stc) {
		stockService.add(stc);
		return "redirect:/ctg/list";
	}
	
	
	
	// http://localhost:8080/go/stc/update/{stc_id }
	@RequestMapping("/update/{stc_id}")
	public String update(@PathVariable Long stc_id, Model model) {
		StockBean stc = stockService.getStc(stc_id);
		model.addAttribute("stc", stc);
		
		return "sub2/stcUpdate";
	}
	
	//http://localhost:8080/go/stc/update/{stc_id}/post
	@RequestMapping(value="/update/{stc_id}/post", method = RequestMethod.POST)
	public String updatePost(StockBean stc) {
		stockService.update(stc);
		return "redirect:/stc/list";
	}

	//http://localhost:8080/go/stc/delete/{stc_id}	
	@RequestMapping("/delete/{stc_id}")
	public String delete(@PathVariable Long stc_id) {
		stockService.delete(stc_id);
		return "redirect:/stc/list";
	}

}
