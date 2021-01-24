package com.Travel.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Travel.domain.StaffBean;
import com.Travel.service.StaffService;


@Controller
public class StaffController {

	@Inject
	private StaffService staffService ;
	
	
	//직업리스트
	//http://localhost:8080/go/staffList　　
	@RequestMapping(value = "/staffList", method = RequestMethod.GET)
	public String staffList(Model model, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
			System.out.println(request.getParameter("stf_name"));			
			String stf_name = request.getParameter("stf_name")==null ? "" : request.getParameter("stf_name");
			System.out.println(stf_name);
			List<StaffBean> staffList = staffService.getStaffList(stf_name);
			model.addAttribute("staffList",staffList);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		// /WEB-INF/views/sub3/staffList.jsp
		return "sub3/staffList";
	}
	
	
	
}
