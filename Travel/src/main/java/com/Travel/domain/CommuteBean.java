package com.Travel.domain;


import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommuteBean {
	
	private int cmt_id;
	private Timestamp cmt_go;
	private Timestamp cmt_leave;
	private int stf_id;
	private String stf_name;
	private String pst_name;

}
