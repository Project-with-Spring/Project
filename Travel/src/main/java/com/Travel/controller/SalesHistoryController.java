package com.Travel.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Travel.service.SalesHistoryService;

@Controller
public class SalesHistoryController {
	
	@Inject
	private SalesHistoryService salesHistoryService ;
	
	//http://localhost:8080/go/salesalesHistory　　
	@RequestMapping(value = "/salesHistory", method = RequestMethod.GET)
	public String saleHistory() {
//		/WEB-INF/views/main/login.jsp
		return "sub1/salesHistory";
	}
}
