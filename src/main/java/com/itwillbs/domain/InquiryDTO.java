package com.itwillbs.domain;

import java.sql.Timestamp;

public class InquiryDTO {
	private String IQ_NUM;
	private String MEM_NUM;//회원넘버
	private String IQ_NAME;//문의 제목
	private String IQ_DETAIL;//파일,사진 추가
	private String IQ_PICTURE;
	private Timestamp IQ_DATE;
	private String IQ_TYPE;//비밀글/공개글
	private String IQ_DATE_format;
	private String rn;
	//private String member_nickname;
	
	@Override
	public String toString() {
		return "InquiryDTO [IQ_NUM=" + IQ_NUM + ", MEM_NUM=" + MEM_NUM + ", IQ_NAME="
				+ IQ_NAME + ", IQ_DETAIL=" + IQ_DETAIL + ", IQ_PICTURE=" + IQ_PICTURE
				+ ", IQ_DATE=" + IQ_DATE + ", IQ_TYPE=" + IQ_TYPE 
				+ ", IQ_DATE_format=" + IQ_DATE_format + ", rn=" + rn + "]";
	}
	public String getIQ_NUM() {
		return IQ_NUM;
	}
	public void setIQ_NUM(String IQ_NUM) {
		this.IQ_NUM = IQ_NUM;
	}
	public String getMEM_NUM() {
		return MEM_NUM;
	}
	public void setMEM_NUM(String MEM_NUM) {
		this.MEM_NUM = MEM_NUM;
	}
	public String getIQ_NAME() {
		return IQ_NAME;
	}
	public void setIQ_NAME(String IQ_NAME) {
		this.IQ_NAME = IQ_NAME;
	}
	public String getIQ_DETAIL() {
		return IQ_DETAIL;
	}
	public void setIQ_DETAIL(String IQ_DETAIL) {
		this.IQ_DETAIL = IQ_DETAIL;
	}
	public String getIQ_PICTURE() {
		return IQ_PICTURE;
	}
	public void setIQ_PICTURE(String IQ_PICTURE) {
		this.IQ_PICTURE = IQ_PICTURE;
	}
	public String getIQ_TYPE() {
		return IQ_TYPE;
	}
	public void setIQ_TYPE(String IQ_TYPE) {
		this.IQ_TYPE = IQ_TYPE;
	}
	public Timestamp getIQ_DATE() {
		return IQ_DATE;
	}
	public void setIQ_DATE(Timestamp IQ_DATE) {
		this.IQ_DATE = IQ_DATE;
	}
	public String getIQ_DATE_format() {
		return IQ_DATE_format;
	}
	public void setIQ_DATE_format(String IQ_DATE_format) {
		this.IQ_DATE_format = IQ_DATE_format;
	}
	public String getRn() {
		return rn;
	}
	public void setRn(String rn) {
		this.rn = rn;
	}
	
}
