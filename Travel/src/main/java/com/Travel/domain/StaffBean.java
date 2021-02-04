package com.Travel.domain;

import lombok.Getter;
import lombok.Setter;


//lombok 라이브러리 @Getter @Setter 를 사용하면 getter,setter 를 정의안해도 설정된다.
@Getter
@Setter

public class StaffBean {

	private int stf_id;
	private String stf_name;
	private String stf_phone;
	private String pst_id;
	private String pst_name;
	private int cnt_go;
	private int total_time;
	private int hour;
	private String total_hour;
	
	@Override
	public String toString() {
		return "StaffBean [stf_id=" + stf_id + ", stf_name=" + stf_name + ", stf_phone=" + stf_phone + ", pst_id="
				+ pst_id + ", pst_name=" + pst_name + ", cnt_go=" + cnt_go + ", total_time=" + total_time + ", hour="
				+ hour + "]";
	}
	
	
}
