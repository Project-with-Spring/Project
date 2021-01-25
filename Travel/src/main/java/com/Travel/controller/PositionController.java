package com.Travel.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.Travel.domain.PositionBean;
import com.Travel.service.PositionService;


@Controller
public class PositionController {

	private PositionService positionService ;


	@Inject
	public void setPositionService(PositionService positionService) {
		this.positionService = positionService;
	}

	
	private static final Logger logger = LoggerFactory.getLogger(PositionController.class);
	
	//직급관리	
	//http://localhost:8080/go/positionmanage　　
	@RequestMapping(value = "/positionList", method = RequestMethod.GET)
	public String positionList(Model model, HttpServletRequest request) {
		try {
			List<PositionBean> positionList = positionService.getPositionList();
			model.addAttribute("positionList",positionList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// /WEB-INF/views/sub3/positionList.jsp
		return "sub3/positionList";
	}
	
	//직급상세보기
	//http://localhost:8080/go/positionModify　　
	@RequestMapping(value = "/positionModify", method = RequestMethod.GET)
	public String positionModify(Model model, HttpServletRequest request) {
		
		String pst_id = request.getParameter("pst_id")==null ? "" : request.getParameter("pst_id");
		PositionBean pb = positionService.getPosition(pst_id);
		model.addAttribute("pb",pb);
	
		// /WEB-INF/views/sub3/positionModify.jsp
		return "sub3/positionModify";
	}
	
	//직급등록
	//http://localhost:8080/go/positionModify　　
	@RequestMapping(value = "/positionRegist", method = RequestMethod.POST)
	public String insertPosition(PositionBean pb,HttpServletResponse response) throws IOException{		
		int chkPst_id = positionService.chkPostion(pb.getPst_id());
		if(chkPst_id == 0) {
			positionService.insertPostion(pb);
		}else {
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('이미 등록된 코드입니다.')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이지로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
			
		}
//			model.addAttribute("pb",pb);		
		// /WEB-INF/views/sub3/positionModify.jsp
		return "redirect:positionList";
	}
	
	//직급수정 
	//http://localhost:8080/go/positionModify　　
	@RequestMapping(value = "/positionModifyPro", method = RequestMethod.POST)
	public String positionModifyPro(PositionBean pb ){	
		positionService.updatePostion(pb);
		// /WEB-INF/views/sub3/positionModify.jsp
		return "redirect:positionList";
	}
	
	//직급삭제 
	//http://localhost:8080/go/positionDelete　　
	@RequestMapping(value = "/positionDelete", method = RequestMethod.GET)
	public String deletePosition(PositionBean pb ,HttpServletRequest request,HttpServletResponse response) throws IOException{		
		String pst_id= request.getParameter("pst_id");
		int chkPst_id = positionService.chkPostion(pst_id);
		if(chkPst_id != 0) {
			positionService.deletePostion(pst_id);
		}else {
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('이미 삭제된 코드입니다.')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이지로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
			
		}
//			model.addAttribute("pb",pb);		
		// /WEB-INF/views/sub3/positionModify.jsp
		return "redirect:positionList";
	}
	
	
	
	
	
}
