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
	
}
