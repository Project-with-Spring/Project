package com.Travel.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class StockBean {
	private Long stc_id;		// 재고 id
	private String stc_name;	// 재고 이름
	private int stc_cost;		// 재고 가격
	private int stc_count;		// 재고 수량
	private Timestamp stc_in;	// 입고 날짜
	private String ctg_id;		// 카테고리 id
	
	
}
