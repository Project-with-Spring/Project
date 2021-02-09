package com.Travel.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Travel.domain.CategoryBean;
import com.Travel.domain.OrderBean;
import com.Travel.domain.OrderDetailBean;
import com.Travel.domain.PointBean;
import com.Travel.domain.ProductBean;
import com.Travel.service.SaleService;

@Controller
public class SaleController {
	
	@Inject
	private SaleService saleService ;
	
	//http://localhost:8080/go/sale　　
	@RequestMapping(value = "/sale", method = RequestMethod.GET)
	public String sale(Model model, HttpServletRequest request) {
		
		
		String ctg_type = request.getParameter("ctg_type");
		if(ctg_type == null) { // 받아온 카테고리 타입값이 없다면?
			ctg_type ="1";  // 디폴트 상품 카테고리 가져오기위해서 1 세팅
		}
		
		List<CategoryBean> ctgList = saleService.getCategoryList(ctg_type); // 타입에 따른 카테고리 리스트 가져오기
		List<ProductBean> pdtList = saleService.getProductList(); // 상품 리스트 가져오기
		List<OrderBean> ordList = saleService.getSaveOrderList();
		model.addAttribute("ctgList",ctgList); 
		model.addAttribute("pdtList",pdtList); // 챙기기
		model.addAttribute("ordList",ordList);
		return "sub1/sale";
	}
	
	//http://localhost:8080/go/payment　
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String payment(Model model, HttpServletRequest request) {
		// 판매자 정보받아오기
		int stf_id = Integer.parseInt(request.getParameter("stf_id"));
		// 배열로 보낸 파라미터 값들 받아오기
		String[] pdt_idList = request.getParameterValues("pdt_idList");
		String[] pdt_countList = request.getParameterValues("pdt_countList");
		String[] pdt_priceList = request.getParameterValues("pdt_priceList");
		String[] pdt_nameList = request.getParameterValues("pdt_nameList"); 
		String[] dt_pdt_id = request.getParameterValues("dt_pdt_id");
		String[] dt_count = request.getParameterValues("dt_count");
		String[] dt_price = request.getParameterValues("dt_price");
		String[] dt_name = request.getParameterValues("dt_name");
		int total = 0;
		// 총 금액 계산
		for(String i : pdt_priceList) {
			total += Integer.parseInt(i);
		}
		if(dt_price != null) {
			for(String i : dt_price) {
				total += Integer.parseInt(i);
			}
		}
		int sale_point = Integer.parseInt(request.getParameter("sale_point"));
		OrderBean ordBean = new OrderBean();
		ordBean.setOrd_discount(sale_point+"");
		ordBean.setOrd_date(new Timestamp(System.currentTimeMillis())); // 시간생성
		ordBean.setOrd_total(total-sale_point+""); // 스트링으로 변경해줌
		ordBean.setStf_id(stf_id);
		ordBean.setPmt_name(request.getParameter("pay_method"));
		ordBean.setOrd_memo(request.getParameter("ord_memo"));
		saleService.insertOrder(ordBean); // order insert
		String order_id = saleService.getOrderId(ordBean); // orderdetail에 들어갈 ord_id값 찾아오기
		for(int i = 0 ; i < pdt_idList.length ; i++) {  // orderdetail에 구매한 상품들 넣기
			String odt_memo = "";
			int odt_price = 0;
			OrderDetailBean odtBean = new OrderDetailBean();
			if(dt_pdt_id != null) {
				for(int j = 0 ; j < dt_pdt_id.length ; j ++) {
					if(pdt_idList[i].equals(dt_pdt_id[j])) {
						odt_price += Integer.parseInt(dt_price[j]);
						odt_memo += dt_name[j]+"("+dt_count[j]+")"; 
					}
				}
				odtBean.setOdt_memo(odt_memo);
				odtBean.setDt_price(odt_price);
			}
			odtBean.setOrd_id(order_id);
			odtBean.setPdt_id(pdt_idList[i]);
			odtBean.setOdt_count(pdt_countList[i]); 
			odtBean.setPdt_name(pdt_nameList[i]);
			saleService.insertDetail(odtBean);
		}
		String pot_id = request.getParameter("pot_id");
		if(pot_id != "") {
			String pot_point = request.getParameter("pot_point");
			PointBean potBean = new PointBean();
			if(pot_point.equals("아이디 없음")) {
				potBean.setPot_id(pot_id);
				potBean.setPot_point(total/20); //5% 적립
				saleService.insertPointId(potBean);
			}else {
				potBean.setPot_id(pot_id);
				potBean.setPot_point((Integer.parseInt(pot_point)-sale_point) + (total-sale_point)/20);
				potBean.setOrd_id(order_id);
				saleService.updatePoint(potBean);
			}
			saleService.updateOrdPoint(potBean);
		}
		return "sub1/sale"; 
	}
	
	//http://localhost:8080/go/saveOrder　
		@RequestMapping(value = "/saveOrder", method = RequestMethod.POST)
		public String saveOrder(Model model, HttpServletRequest request) {
			// 판매자 정보받아오기
			int stf_id = Integer.parseInt(request.getParameter("stf_id"));
			// 배열로 보낸 파라미터 값들 받아오기
			String[] pdt_idList = request.getParameterValues("pdt_idList");
			String[] pdt_countList = request.getParameterValues("pdt_countList");
			String[] pdt_priceList = request.getParameterValues("pdt_priceList");
			String[] pdt_nameList = request.getParameterValues("pdt_nameList"); 
			int total = 0;
			// 총 금액 계산
			for(String i : pdt_priceList) {
				total += Integer.parseInt(i);
			}
			OrderBean ordBean = new OrderBean();
			System.out.println(ordBean.getOrd_cancel());
			ordBean.setOrd_date(new Timestamp(System.currentTimeMillis())); // 시간생성
			ordBean.setOrd_total(total+""); // 스트링으로 변경해줌
			ordBean.setStf_id(stf_id);
			ordBean.setPmt_name(request.getParameter("pay_method"));
			ordBean.setOrd_memo(request.getParameter("ord_memo"));
			ordBean.setOrd_cancel("1");
			saleService.insertOrder(ordBean); // order insert
			String order_id = saleService.getOrderId(ordBean); // orderdetail에 들어갈 ord_id값 찾아오기
			for(int i = 0 ; i < pdt_idList.length ; i++) {  // orderdetail에 구매한 상품들 넣기
				OrderDetailBean odtBean = new OrderDetailBean();
				odtBean.setOrd_id(order_id);
				odtBean.setPdt_id(pdt_idList[i]);
				odtBean.setOdt_count(pdt_countList[i]); 
				odtBean.setPdt_name(pdt_nameList[i]);
				saleService.insertDetail(odtBean);
			}
			return "sub1/sale"; 
		}
	//http://localhost:8080/go/pointCheck　　
	@RequestMapping(value = "/pointCheck", method = RequestMethod.POST,produces = "application/json; charset:utf-8")
	@ResponseBody
	public String pointCheck(Model model, HttpServletRequest request) {
		String phoneNumber = request.getParameter("phoneNumber");
		PointBean potBean = new PointBean();
		potBean.setPot_id(phoneNumber);
		String point = saleService.getPoint(potBean);
		return point;
	}
	@RequestMapping(value = "/deleteOrder", method = RequestMethod.POST,produces = "application/json; charset:utf-8")
	@ResponseBody
	public void deleteOrder(Model model, HttpServletRequest request) {
		System.out.println("도착");
		String ord_id = request.getParameter("ord_id");
		System.out.println(ord_id);
		saleService.deleteOrder(ord_id);
	}
	@RequestMapping(value = "/getSaveOrder", method = RequestMethod.POST,produces = "application/json; charset:utf-8")
	@ResponseBody
	public Map<String, Object> getSaveOrder(Model model, HttpServletRequest request) {
		System.out.println("saveOrder도착");
		String ord_id = request.getParameter("ord_id");
//		OrderBean ordBean = saleService.getSaveOrder(ord_id);
		List<OrderDetailBean> odtBean = saleService.getOrderDetail(ord_id);
		
		Map<String, Object> bean = new HashMap<>();
		bean.put("odtBean",odtBean);
//		bean.put("ordBean",ordBean);
		return bean;
		
	}
	
}