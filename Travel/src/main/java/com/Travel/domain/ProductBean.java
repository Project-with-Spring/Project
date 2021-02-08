package com.Travel.domain;

import lombok.Setter;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Setter
@NoArgsConstructor
public class ProductBean {
	private Long pdt_id;
	private String pdt_name;
	private int pdt_cost;
	private String ctg_id;
	private int pdt_status;
}
