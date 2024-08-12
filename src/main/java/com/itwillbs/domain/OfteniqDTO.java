package com.itwillbs.domain;

import java.sql.Timestamp;

public class OfteniqDTO {

	private String OF_NUM;
	private String OF_NAME;
	private String OF_DETAIL;
	private Timestamp OF_DATE;
	
	@Override
	public String toString() {
		return "OfteniqDTO [OF_NUM=" + OF_NUM + ", OF_NAME=" + OF_NAME + ", OF_DETAIL=" + OF_DETAIL + ", OF_DATE="
				+ OF_DATE + "]";
	}
	public String getOF_NUM() {
		return OF_NUM;
	}
	public void setOF_NUM(String oF_NUM) {
		OF_NUM = oF_NUM;
	}
	public String getOF_NAME() {
		return OF_NAME;
	}
	public void setOF_NAME(String oF_NAME) {
		OF_NAME = oF_NAME;
	}
	public String getOF_DETAIL() {
		return OF_DETAIL;
	}
	public void setOF_DETAIL(String oF_DETAIL) {
		OF_DETAIL = oF_DETAIL;
	}
	public Timestamp getOF_DATE() {
		return OF_DATE;
	}
	public void setOF_DATE(Timestamp oF_DATE) {
		OF_DATE = oF_DATE;
	}
	
	
}

