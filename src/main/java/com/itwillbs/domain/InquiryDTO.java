package com.itwillbs.domain;

import java.sql.Timestamp;

public class InquiryDTO {
	private String inquiry_num;
	private String member_num;//회원넘버
	private String inquiry_name;//문의 제목
	private String inquiry_detail;//파일,사진 추가
	private String inquiry_picture;
	private Timestamp inquiry_date;
	private String inquiry_type;//비밀글/공개글
	private String theater_num;//영화번호
	private String inquiry_date_format;
	private String rn;
	//private String member_nickname;
	
	@Override
	public String toString() {
		return "InquiryDTO [inquiry_num=" + inquiry_num + ", member_num=" + member_num + ", inquiry_name="
				+ inquiry_name + ", inquiry_detail=" + inquiry_detail + ", inquiry_picture=" + inquiry_picture
				+ ", inquiry_date=" + inquiry_date + ", inquiry_type=" + inquiry_type + ", theater_num=" + theater_num
				+ ", inquiry_date_format=" + inquiry_date_format + ", rn=" + rn + "]";
	}
	public String getInquiry_num() {
		return inquiry_num;
	}
	public void setInquiry_num(String inquiry_num) {
		this.inquiry_num = inquiry_num;
	}
	public String getMember_num() {
		return member_num;
	}
	public void setMember_num(String member_num) {
		this.member_num = member_num;
	}
	public String getInquiry_name() {
		return inquiry_name;
	}
	public void setInquiry_name(String inquiry_name) {
		this.inquiry_name = inquiry_name;
	}
	public String getInquiry_detail() {
		return inquiry_detail;
	}
	public void setInquiry_detail(String inquiry_detail) {
		this.inquiry_detail = inquiry_detail;
	}
	public String getInquiry_picture() {
		return inquiry_picture;
	}
	public void setInquiry_picture(String inquiry_picture) {
		this.inquiry_picture = inquiry_picture;
	}
	public String getInquiry_type() {
		return inquiry_type;
	}
	public void setInquiry_type(String inquiry_type) {
		this.inquiry_type = inquiry_type;
	}
	public Timestamp getInquiry_date() {
		return inquiry_date;
	}
	public void setInquiry_date(Timestamp inquiry_date) {
		this.inquiry_date = inquiry_date;
	}
	public String getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(String theater_num) {
		this.theater_num = theater_num;
	}
	public String getInquiry_date_format() {
		return inquiry_date_format;
	}
	public void setInquiry_date_format(String inquiry_date_format) {
		this.inquiry_date_format = inquiry_date_format;
	}
	public String getRn() {
		return rn;
	}
	public void setRn(String rn) {
		this.rn = rn;
	}
	
}
