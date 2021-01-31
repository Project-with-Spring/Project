package com.Travel.controller;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Travel.domain.OrderBean;
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
		String sizeStr = request.getParameter("size");
		if(sizeStr != null && !sizeStr.equals("")) {
			pageBean.setPageSize(Integer.parseInt(sizeStr));
		} else {
			pageBean.setPageSize(20);
		}
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
			searchMap.put("min_price", request.getParameter("min_price"));
			searchMap.put("max_price", request.getParameter("max_price"));
		} else {
			searchMap.put("search", false);
		}
		pageBean.setCount(salesHistoryService.getListCount(searchMap));
		
		model.addAttribute("list", salesHistoryService.getList(searchMap));
		model.addAttribute("pageBean", pageBean);
		
		HashMap map = new HashMap();
		map.put("pst_id", "");
		map.put("stf_name", "");
		
		model.addAttribute("staffList", staffService.getStaffList(map));
		return "sub1/salesHistory";
	}
	
	@RequestMapping(value = "/updateMemo", method = RequestMethod.GET)
	public ResponseEntity<String> updateMemo(HttpServletRequest request, OrderBean orderBean) {
		System.out.println("SalesHistoryController updateMemo()");

		ResponseEntity<String> entity=null;
		String result="";
		try {
//			String ord_id = request.getParameter("ord_id");
//			String ord_memo = request.getParameter("ord_memo");
			salesHistoryService.updateMemo(orderBean);
			result = "success";
			entity=new ResponseEntity<String>(result,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	@RequestMapping(value = "/saleInfo", method = RequestMethod.GET)
	public String salesInfo(Model model, HttpServletRequest request) {
		System.out.println("SalesHistoryController salesInfo()");
		request.getParameter("totalType");
		
		int dateType = 0;
		if(request.getParameter("dateType") != null && !request.getParameter("dateType").equals("")) {
			dateType = Integer.parseInt(request.getParameter("dateType"));
		}
		int totalType = 0;
		if(request.getParameter("totalType") != null && !request.getParameter("totalType").equals("")) {
			totalType = Integer.parseInt(request.getParameter("totalType"));
		}
		Map<String, Integer> chartType = new HashMap<String, Integer>();
		chartType.put("dateType", dateType);
		chartType.put("totalType", totalType);
		
		model.addAttribute("chartList", salesHistoryService.getChartList(chartType));
		
		return "sub1/saleInfo";
	}
	
}
