package com.Travel.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Travel.service.StaffService;


@Controller
public class StaffController {

	@Inject
	private StaffService staffService ;
	
	//http://localhost:8080/go/sale　　
	@RequestMapping(value = "/staff", method = RequestMethod.GET)
	public String saleHistory() {
//		/WEB-INF/views/main/login.jsp
		return "sub3/staffList";
	}
}
