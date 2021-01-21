package com.Travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SaleController {
	
	//http://localhost:8080/go/sale　　
	@RequestMapping(value = "/sale", method = RequestMethod.GET)
	public String sale() {
//		/WEB-INF/views/main/login.jsp
		return "sub1/sale";
	}
	
	//http://localhost:8080/go/sale　　
	@RequestMapping(value = "/salesHistory", method = RequestMethod.GET)
	public String saleHistory() {
//		/WEB-INF/views/main/login.jsp
		return "sub1/salesHistory";
	}
}
