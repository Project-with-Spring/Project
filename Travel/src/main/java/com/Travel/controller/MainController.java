package com.Travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {
	

	//http://localhost:8080/go/main　　
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
//		/WEB-INF/views/main/main.jsp
		return "main/main";
	}
	
	//http://localhost:8080/go/login　　
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
//		/WEB-INF/views/main/login.jsp
		return "main/login";
	}
	
	
}
