package com.Travel.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Travel.domain.PageBean;
import com.Travel.service.SalesHistoryService;
import com.Travel.service.StaffService;

@Controller
public class SalesHistoryController {
	
	@Inject
	private SalesHistoryService salesHistoryService;
	
	@Inject
	private StaffService staffService;
	
	@RequestMapping(value = "/salesHistory", method = RequestMethod.GET)
	public String saleHistory(Model model, HttpServletRequest request) {
		System.out.println("SalesHistoryController saleHistory()");
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(50);
		String page = request.getParameter("page");
		if(page==null) {
			pageBean.setPageNum("1");
		} else {
			pageBean.setPageNum(page);
		}
		pageBean.setCount(salesHistoryService.getListCount());
		model.addAttribute("list", salesHistoryService.getList(pageBean));
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("staffList", staffService.getStaffList(""));
		return "sub1/salesHistory";
	}
}
