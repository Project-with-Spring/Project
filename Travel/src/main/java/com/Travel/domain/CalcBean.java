package com.Travel.domain;


import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class CalcBean {
	private int calc_id;
	private Timestamp calc_date;
	private int calc_cash;
	private int calc_credit;
	private int calc_discount;
	private int calc_cash_50000;
	private int calc_cash_10000;
	private int calc_cash_5000;
	private int calc_cash_1000;
	private int calc_cash_500;
	private int calc_cash_100;
	private int calc_cash_50;
	private int calc_cash_10;
	private int calc_result;
	private int stf_id;
	private int vtc_id;
}
