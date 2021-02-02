package com.Travel.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class OrderBean {
	private String ord_id;
	private Timestamp ord_date;
	private String ord_total;
	private String ord_discount;
	private String ord_cancel;
	private String pmt_name;
	private String pot_id;
	private int stf_id;
	private String ord_memo;
	private String stf_name;
	
	private String date;
}
