package com.Travel.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class OrderBean {
	private int ord_id;
	private Timestamp ord_date;
	private int ord_total;
	private int ord_discount;
	private int ord_cancel;
	private String pmt_name;
	private String pot_id;
	private int stf_id;
	private String ord_memo;
}
