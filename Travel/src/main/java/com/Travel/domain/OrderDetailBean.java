package com.Travel.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class OrderDetailBean {
	private String odt_id;
	private String odt_count;
	private String ord_id;
	private String pdt_id;
	private String pdt_name;
	private String odt_memo;
	private int dt_price;
	
	private String date; // 차트에 날짜 포매팅을 넣기 위한 항목
	private int pdt_cost; // 판매내역에 가격을 넣기 위한 항목
}
