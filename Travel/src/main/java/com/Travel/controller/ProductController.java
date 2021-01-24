package com.Travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//http://localhost:8080/go/pdt
@RequestMapping("/pdt")
public class ProductController {
	
	// http://localhost:8080/go/pdt/list
	@RequestMapping("/list")
	public String list() {
		return "sub2/productList";
	}

}
