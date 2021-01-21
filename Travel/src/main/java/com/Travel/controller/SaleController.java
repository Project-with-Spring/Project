package com.Travel.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Travel.domain.CategoryBean;
import com.Travel.domain.ProductBean;
import com.Travel.service.SaleService;

@Controller
public class SaleController {
	
	@Inject
	private SaleService saleService ;
	
	//http://localhost:8080/go/sale　　
	@RequestMapping(value = "/sale", method = RequestMethod.GET)
	public String sale(Model model, HttpServletRequest request) {
		String ctg_type = request.getParameter("ctg_type");
		String ctg_id = request.getParameter("ctg_id");
		if(ctg_type == null) {
			ctg_type ="1";
		}
		if(ctg_id == null) {
			ctg_id ="1";
		}
		
		List<CategoryBean> ctgList = saleService.getCategoryList(ctg_type);
		List<ProductBean> pdtList = saleService.getProductList(ctg_id);
		
		model.addAttribute("ctgList",ctgList);
		model.addAttribute("pdtList",pdtList);
		return "sub1/sale";
	}
	
	//http://localhost:8080/go/sale　　
	@RequestMapping(value = "/salesHistory", method = RequestMethod.GET)
	public String saleHistory() {
//		/WEB-INF/views/main/login.jsp
		return "sub1/salesHistory";
	}
}
