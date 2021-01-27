package com.Travel.controller;


import java.util.HashMap;
import java.util.Map;

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
		pageBean.setPageSize(20);
		String page = request.getParameter("page");
		if(page==null) {
			pageBean.setPageNum("1");
		} else {
			pageBean.setPageNum(page);
		}
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("pageBean", pageBean);
		if(request.getParameter("search") != null && request.getParameter("search").equals("on")) {
			searchMap.put("search", true);
			searchMap.put("begin_date", request.getParameter("begin_date"));
			searchMap.put("end_date", request.getParameter("end_date"));
			searchMap.put("memo_search", request.getParameter("memo_search"));
			searchMap.put("phone_search", request.getParameter("phone_search"));
			searchMap.put("pmt_search", request.getParameter("pmt_search"));
			searchMap.put("staff_search", request.getParameter("staff_search"));
			searchMap.put("cancel_search", request.getParameter("cancel_search"));
		} else {
			searchMap.put("search", false);
		}
		pageBean.setCount(salesHistoryService.getListCount(searchMap));
		
		model.addAttribute("list", salesHistoryService.getList(searchMap));
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("staffList", staffService.getStaffList(""));
		return "sub1/salesHistory";
	}
}
