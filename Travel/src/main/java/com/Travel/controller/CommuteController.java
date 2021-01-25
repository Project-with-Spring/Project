package com.Travel.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Travel.domain.CommuteBean;
import com.Travel.service.CommuteService;

@Controller
public class CommuteController {

	@Inject
	private CommuteService commuteService;
	
	
	//급여리스트
	//http://localhost:8080/go/staffList　　
	@RequestMapping(value = "/staffCommuteList", method = RequestMethod.GET)
	public String staffList(Model model, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");		
			String stf_name = request.getParameter("stf_name") == null ? "" : request.getParameter("stf_name");
			System.out.println(stf_name);
			List<CommuteBean> staffCommutfList = commuteService.getStafCommutfList();
			model.addAttribute("staffCommutfList",staffCommutfList);
		} catch (Exception e) {			
			e.printStackTrace();
		}
		// /WEB-INF/views/sub3/staffList.jsp
		return "sub3/commuteList";
	}
	
}
