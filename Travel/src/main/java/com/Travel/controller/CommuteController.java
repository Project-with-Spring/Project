package com.Travel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
	
	//전체 출근리스트 보기
	//http://localhost:8080/go/getCommuteList　　
	@RequestMapping(value = "/getCommuteListAll", method = RequestMethod.GET)
	public String getCommuteListAll(Model model, HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");		
			int stf_id = (int) session.getAttribute("stf_id");
			
			
			if(stf_id >= 0){
				String search= request.getParameter("stf_name")==null ? "" : request.getParameter("stf_name");
				SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
				Date time = new Date();
				String from = request.getParameter("from")== null ?  format1.format(time) : request.getParameter("from");
				String to = request.getParameter("to")== null ?  format1.format(time) : request.getParameter("to");

				HashMap map= new HashMap();
				map.put( "search", search);
				map.put( "from", from);
				map.put( "to", to);
				
				Calendar cal = Calendar.getInstance();
				Date date = new Date();
				cal.setTime(date);
				cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH),cal.getActualMinimum(Calendar.DAY_OF_MONTH));

				model.addAttribute("firstDay",cal.getTime());
				List<CommuteBean> cmtList = commuteService.getStafCommutfList(map);						
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
								
				SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
				Date time = new Date();
				String from1 = request.getParameter("from1")== null ?  format1.format(time) : request.getParameter("from1");
				String to1 = request.getParameter("to1")== null ?  format1.format(time) : request.getParameter("to1");
				String from2 = request.getParameter("from2")== null ?  format1.format(time) : request.getParameter("from2");
				String to2 = request.getParameter("to2")== null ?  format1.format(time) : request.getParameter("to2");
				//출근시간
				HashMap map1= new HashMap();
				map1.put( "stf_id", stf_id);
				map1.put( "from", from1);
				map1.put( "to", to1);
				//총일수 총출근시간
				HashMap map2= new HashMap();
				map2.put( "stf_id", stf_id);
				map2.put( "from", from2);
				map2.put( "to", to2);
				
				List<CommuteBean> cmtList = commuteService.getStaffCommut(map1);
				StaffBean stca = commuteService.getStaffCommutOnetotal(map2);
							
				model.addAttribute("cmtList",cmtList);
				model.addAttribute("stca",stca);
			}else{
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("로그인 후 사용가능 합니다.");	
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
			String erroCode= "success"; 
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			int stf_id = (int) session.getAttribute("stf_id");
			if(stf_id >= 0){
				int gocnt = commuteService.cmtgoChk(stf_id);
				if(gocnt  > 0) {
					 erroCode = "cmt01"; //cmt01 : 이미 출근하셨습니다.					
				}else {
					int goInsertcnt = commuteService.cmtgo(stf_id);
					
					if(goInsertcnt > 0){
						commuteService.insertcmtgoList(stf_id);
						
					}else {
						 erroCode = "cmt02"; //cmt02 : 출근등록에 실패하였습니다
					
					}
				}
			}else {
				 erroCode = "cmt3";//cmt03 : 로그인 후 사용가능 합니다
			}
			out.print(erroCode);

		} catch (Exception e) {			
			e.printStackTrace();
		}
		// /WEB-INF/views/sub3/commuteList.jsp
		return null;
	}
	
	//나의퇴근
	//http://localhost:8080/go/getCommuteList　　
	@RequestMapping(value = "/cmt_leave", method = RequestMethod.GET)
	public String cmt_leave(Model model,HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		
		try {

			String erroCode= "success"; 
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
						erroCode= "cmt04"; //cmt04 : 퇴근등록에 실패하였습니다. 오류사항 문의바랍니다.		
						
//						ScriptUtils.alertAndMovePage(response, "퇴근등록에 실패하였습니다. 오류사항 문의바랍니다.","/getCommuteList");
					}
				}else {
					erroCode="cmt05"; //cmt05 : 이미 퇴근하셨습니다.
				}
			}else {
				erroCode = "cmt03"; //cmt03 : 로그인 후 사용가능 합니다.
			}
			out.print(erroCode);
		} catch (Exception e) {			
			e.printStackTrace();
		}
		// /WEB-INF/views/sub3/commuteList.jsp
		return  null;
	}
	
	
	//근태수정
	//http://localhost:8080/go/commuteModify.jsp　　
	@RequestMapping(value = "/commuteModify", method = RequestMethod.GET)
	public String commuteModify(HttpServletRequest request,Model model)throws IOException{		
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
	//http://localhost:8080/go/commuteModifyPro　　
	@RequestMapping(value = "/commuteModifyPro", method = RequestMethod.POST)
	public String commuteModifyPro(StaffBean sb){		
		 commuteService.comumteModify(sb);
		// /WEB-INF/views/sub3/staffList.jsp
		return "redirect:/commuteModify";
	}
	
	//근태삭제
	//http://localhost:8080/go/commuteDelete
	@RequestMapping(value = "/commuteDelete", method = RequestMethod.GET)
	public String commuteDelete(HttpServletRequest request){		
		int cm_id = Integer.parseInt(request.getParameter("cmt_id"));
		commuteService.commuteDelete(cm_id);
		// /WEB-INF/views/sub3/staffList.jsp
		return "redirect:/getCommuteListAll";
	}
	
	
	

}
