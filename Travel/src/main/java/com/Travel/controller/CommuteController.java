package com.Travel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Travel.domain.CommuteBean;
import com.Travel.domain.PositionBean;
import com.Travel.domain.StaffBean;
import com.Travel.service.CommuteService;
import com.Travel.utill.ScriptUtils;

@Controller
//@ResponseBody 
public class CommuteController {

	@Inject
	private CommuteService commuteService;
	
	
//	//급여리스트
//	//http://localhost:8080/go/staffList　　
//	@RequestMapping(value = "/staffCommuteList", method = RequestMethod.GET)
//	public String staffList(Model model, HttpServletRequest request) {
//		try {
//			request.setCharacterEncoding("utf-8");		
//			String stf_name = request.getParameter("stf_name") == null ? "" : request.getParameter("stf_name");
//			System.out.println(stf_name);
//			List<CommuteBean> staffCommutfList = commuteService.getStafCommutfList();
//			model.addAttribute("staffCommutfList",staffCommutfList);
//		} catch (Exception e) {			
//			e.printStackTrace();
//		}
//		// /WEB-INF/views/sub3/staffList.jsp
//		return "sub3/commuteList";
//	}
//	
	
	//전체 출근리스트 보기
	//http://localhost:8080/go/getCommuteList　　
	@RequestMapping(value = "/getCommuteListAll", method = RequestMethod.GET)
	public String getCommuteListAll(Model model, HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");		
			int stf_id = (int) session.getAttribute("stf_id");
			if(stf_id >= 0){
				String search= request.getParameter("stf_name")==null ? "" : request.getParameter("stf_name");
				List<CommuteBean> cmtList = commuteService.getStafCommutfList(search);
				model.addAttribute("cmtList",cmtList);
			}else{
				ScriptUtils.alertAndMovePage(response, "로그인 후 사용가능 합니다..","/go/login");	
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		// /WEB-INF/views/sub3/commuteList.jsp
		return "sub3/commuteListManager";
	}
	
	//나의출퇴근 
	//http://localhost:8080/go/getCommuteList　　
	@RequestMapping(value = "/getCommuteList", method = RequestMethod.GET)
	public String getCommuteList(Model model, HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");		
			int stf_id = (int) session.getAttribute("stf_id");
			if(stf_id >= 0){
				List<CommuteBean> cmtList = commuteService.getStaffCommut(stf_id);
				model.addAttribute("cmtList",cmtList);
			}else{
				ScriptUtils.alertAndMovePage(response, "로그인 후 사용가능 합니다..","/go/login");	
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		// /WEB-INF/views/sub3/commuteList.jsp
		return "sub3/commuteList";
	}
	
	//나의출근
	//http://localhost:8080/go/getCommuteList　　
	@RequestMapping(value = "/cmt_go", method = RequestMethod.GET)
	public String cmt_go(Model model,HttpServletRequest request,HttpSession session,HttpServletResponse response) {

		try {

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			int stf_id = (int) session.getAttribute("stf_id");
			if(stf_id >= 0){
				int gocnt = commuteService.cmtgoChk(stf_id);
				if(gocnt  > 0) {
					out.println("<script>alert('이미 출근하셨습니다.');  history.go(-1);</script>");
					out.flush();
//					ScriptUtils.alertAndMovePage(response, "이미 출근하셨습니다.","/go/getCommuteList");					
				}else {
					int goInsertcnt = commuteService.cmtgo(stf_id);
					
					if(goInsertcnt > 0){
						commuteService.insertcmtgoList(stf_id);
						
					}else {
						out.println("<script>alert('출근등록에 실패하였습니다.');  history.go(-1);</script>");
						out.flush();
//						ScriptUtils.alertAndMovePage(response, "출근등록에 실패하였습니다. 오류사항 문의바랍니다.","/go/getCommuteList");
					}
				}
			}else {
				out.println("<script>alert('로그인 후 사용가능 합니다.');  location.href='/login'</script>");
				out.flush();
//				ScriptUtils.alertAndMovePage(response, "로그인 후 사용가능 합니다..","/go/login");
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		// /WEB-INF/views/sub3/commuteList.jsp
		return "redirect:/getCommuteList";
	}
	
	//나의퇴근
	//http://localhost:8080/go/getCommuteList　　
	@RequestMapping(value = "/cmt_leave", method = RequestMethod.GET)
	public String cmt_leave(Model model,HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			int stf_id = (int) session.getAttribute("stf_id");
			if(stf_id >= 0) {
				int gocnt = commuteService.cmtgoChk(stf_id);
				if(gocnt  > 0) {
					int leaveInsertcnt = commuteService.cmt_leave(stf_id);
					if(leaveInsertcnt > 0) {
						commuteService.deletecmtgoList(stf_id);
//							commuteService.insertcmtleaveList(stf_id);							
					}else {
						out.println("<script>alert('퇴근등록에 실패하였습니다. 오류사항 문의바랍니다.');  history.go(-1);</script>");
						out.flush();
						 
//						ScriptUtils.alertAndMovePage(response, "퇴근등록에 실패하였습니다. 오류사항 문의바랍니다.","/getCommuteList");
					}
				}else {
					out.println("<script>alert('이미 퇴근하셨습니다.');  history.go(-1);</script>");
					out.flush();
//					ScriptUtils.alertAndMovePage(response, "이미 퇴근하셨습니다.","/getCommuteList");
				}
			}else {
				out.println("<script>alert('로그인 후 사용가능 합니다.');  location.href='/login'</script>");
				out.flush();
//				ScriptUtils.alertAndMovePage(response, "로그인 후 사용가능 합니다.","/go/login");
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		// /WEB-INF/views/sub3/commuteList.jsp
		return  "redirect:/getCommuteList";
	}
	
	
	//근태수정
	//http://localhost:8080/go/commuteModify.jsp　　
	@RequestMapping(value = "/commuteModify", method = RequestMethod.GET)
	public String staffModify(HttpServletRequest request,Model model)throws IOException{		
		request.setCharacterEncoding("utf-8");
		int cmt_id = Integer.parseInt(request.getParameter("cmt_id"));
		int stf_id = Integer.parseInt(request.getParameter("stf_id"));
		HashMap map= new HashMap();
		map.put( "cmt_id", cmt_id);
		map.put( "stf_id", stf_id);
		
		CommuteBean commuteBean = commuteService.getStaffCommutOne(map);
			
		model.addAttribute("commuteBean",commuteBean);
		return "sub3/commuteModify";
	}
	
	//근태수정  
	//http://localhost:8080/go/positionDelete　　
	@RequestMapping(value = "/commuteModifyPro", method = RequestMethod.POST)
	public String staffModifyPro(StaffBean sb, HttpServletRequest request){		
//		 commuteService.comumteModify(sb);
		// /WEB-INF/views/sub3/staffList.jsp
		return "redirect:/commuteModif";
	}
	
	
	
	

}
