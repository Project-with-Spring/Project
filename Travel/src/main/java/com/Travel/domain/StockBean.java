package com.Travel.domain;

import java.sql.Timestamp;

import lombok.Data;


@Data
public class StockBean {
	private Long stc_id;
	private String stc_name;
	private int stc_count;
	private int stc_cost;
	private Timestamp stc_in;
	private String ctg_id;
	
}
