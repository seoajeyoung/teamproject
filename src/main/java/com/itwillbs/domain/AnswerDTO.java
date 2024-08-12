package com.itwillbs.domain;

import java.sql.Timestamp;

public class AnswerDTO {

	private String AS_NUM;
	private String IQ_NUM;
	private String AS_DETAIL;
	private Timestamp AS_DATE;
	
	@Override
	public String toString() {
		return "AnswerDTO [AS_NUM=" + AS_NUM + ", IQ_NUM=" + IQ_NUM + ", AS_DETAIL=" + AS_DETAIL + ", AS_DATE="
				+ AS_DATE + "]";
	}
	public String getAS_NUM() {
		return AS_NUM;
	}
	public void setAS_NUM(String aS_NUM) {
		AS_NUM = aS_NUM;
	}
	public String getIQ_NUM() {
		return IQ_NUM;
	}
	public void setIQ_NUM(String iQ_NUM) {
		IQ_NUM = iQ_NUM;
	}
	public String getAS_DETAIL() {
		return AS_DETAIL;
	}
	public void setAS_DETAIL(String aS_DETAIL) {
		AS_DETAIL = aS_DETAIL;
	}
	public Timestamp getAS_DATE() {
		return AS_DATE;
	}
	public void setAS_DATE(Timestamp aS_DATE) {
		AS_DATE = aS_DATE;
	}
	
	
	
	
}

