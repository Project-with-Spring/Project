package com.Travel.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class OrderdetailBean {
	private int odt_id;
	private int odt_count;
	private int ord_id;
	private int pdt_id;
	private String pdt_name;
	private String odt_memo;
}
