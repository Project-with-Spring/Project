package com.Travel.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Travel.domain.CategoryBean;
import com.Travel.domain.OrdersBean;
import com.Travel.domain.OrderDetailBean;
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
		
		model.addAttribute("ctgList",ctgList); 
		model.addAttribute("pdtList",pdtList); // 챙기기
		return "sub1/sale";
	}
	
	//http://localhost:8080/go/payment　
		@RequestMapping(value = "/payment", method = RequestMethod.POST)
		public String payment(Model model, HttpServletRequest request) {
			
			// 배열로 보낸 파라미터 값들 받아오기
			String[] pdt_idList = request.getParameterValues("pdt_idList");
			String[] pdt_countList = request.getParameterValues("pdt_countList");
			String[] pdt_priceList = request.getParameterValues("pdt_priceList");
			
			// 이건 아직 안씀 쓸일없을수도.. 근데 orderDetail 보고있으면 이거 넣어야될것같기도..
//			String[] pdt_nameList = request.getParameterValues("pdt_nameList"); 
			
			int total = 0;
			// 총 금액 계산
			for(String i : pdt_priceList) {
				total += Integer.parseInt(i);
			}
			
			OrdersBean ordBean = new OrdersBean();
			ordBean.setOrd_date(new Timestamp(System.currentTimeMillis())); // 시간생성
			ordBean.setOrd_total(total+""); // 스트링으로 변경해줌
			ordBean.setPmt_name("카드"); // 추후에 제어할 예정
			saleService.insertOrder(ordBean); // order insert
			String order_id = saleService.getOrderId(ordBean); // orderdetail에 들어갈 ord_id값 찾아오기
			for(int i = 0 ; i < pdt_idList.length ; i++) {  // orderdetail에 구매한 상품들 넣기
				OrderDetailBean odtBean = new OrderDetailBean();
				odtBean.setOrd_id(order_id);
				odtBean.setPdt_id(pdt_idList[i]);
				odtBean.setOdt_count(pdt_countList[i]);
				saleService.insertDetail(odtBean);
			}
			return "sub1/sale"; 
		}
	
}
