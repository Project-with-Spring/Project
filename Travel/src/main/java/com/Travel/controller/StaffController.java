package com.Travel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Travel.domain.CommuteBean;
import com.Travel.domain.PositionBean;
import com.Travel.domain.StaffBean;
import com.Travel.service.PositionService;
import com.Travel.service.StaffService;


@Controller
public class StaffController {

	@Inject
	private StaffService staffService ;
	
	@Inject
	private PositionService positionService ;
	
	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);

	//직원리스트
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
	//직급등록
	//http://localhost:8080/go/staffInsert.jsp　　
	@RequestMapping(value = "/staffInsert", method = RequestMethod.GET)
	public String insertStaff(HttpServletRequest request,Model model){		
		List<PositionBean> positionList = positionService.getPositionList();
		model.addAttribute("positionList",positionList);
		return "sub3/staffInsert";
	}
	
	//직원등록
	//http://localhost:8080/go/staffInsert.jsp　　
	@RequestMapping(value = "/staffInsertPro", method = RequestMethod.POST)
	public String insertStaffPro(StaffBean sf, HttpServletRequest request) {		
		staffService.insertStaff(sf);
		// /WEB-INF/views/sub3/staffList.jsp
		return "redirect:staffList";
	}
	
	//직원삭제 
	//http://localhost:8080/go/positionDelete　　
	@RequestMapping(value = "/staffDelete", method = RequestMethod.GET)
	public String deletePosition(HttpServletRequest request,HttpServletResponse response) throws IOException{		
		int stf_id= Integer.parseInt(request.getParameter("stf_id"));
		int chksft_id = staffService.chkStaff(stf_id);
		if(chksft_id > 0) {
			staffService.deleteStaff(stf_id);
		}else {			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('이미 삭제된 직원입니다.')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이지로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
			
		}
		// /WEB-INF/views/sub3/staffList.jsp
		return "redirect:staffList";
	}

	//직원수정
	//http://localhost:8080/go/staffInsert.jsp　　
	@RequestMapping(value = "/staffModify", method = RequestMethod.GET)
	public String staffModify(HttpServletRequest request,Model model)throws IOException{		
		request.setCharacterEncoding("utf-8");
		int stf_id = Integer.parseInt(request.getParameter("stf_id"));
		StaffBean sb = staffService.getStaff(stf_id);
		List<PositionBean> positionList = positionService.getPositionList();
		model.addAttribute("sb",sb);		
		model.addAttribute("positionList",positionList);
		return "sub3/staffModify";
	}
	
	//직원수정  
	//http://localhost:8080/go/positionDelete　　
	@RequestMapping(value = "/staffModifyPro", method = RequestMethod.POST)
	public String staffModifyPro(StaffBean sb, HttpServletRequest request){		
		staffService.updateStaff(sb);
		// /WEB-INF/views/sub3/staffList.jsp
		return "redirect:staffModify?stf_id="+request.getParameter("stf_id");
	}
	
	
}
