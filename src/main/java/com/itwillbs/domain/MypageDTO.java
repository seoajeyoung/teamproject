package com.itwillbs.domain;

import java.sql.Timestamp;

public class MypageDTO {
	
	private String member_num;
	private String member_id;
	private String member_pass;
	private String member_name;
	private String member_nickname;
	private String member_gender;
	private String member_phone;
	private Timestamp member_input;
	private Timestamp member_out;
	private Timestamp member_respite;
	private String member_status;
	private String member_address;
	private String member_admin;
	private String member_grade;
	private String member_birth;
	private String member_email;
	private int point_currentP;
	private int point_cumulativeP;
	private int sPoint;
	private String point_detail;
	private Timestamp point_date;
	private String point_history;
	private String member_sns;
	
	// ================================================================
	
	
	
	public String getMember_num() {
		return member_num;
	}
	public void setMember_num(String member_num) {
		this.member_num = member_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pass() {
		return member_pass;
	}
	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public Timestamp getMember_input() {
		return member_input;
	}
	public void setMember_input(Timestamp member_input) {
		this.member_input = member_input;
	}
	public Timestamp getMember_out() {
		return member_out;
	}
	public void setMember_out(Timestamp member_out) {
		this.member_out = member_out;
	}
	public Timestamp getMember_respite() {
		return member_respite;
	}
	public void setMember_respite(Timestamp member_respite) {
		this.member_respite = member_respite;
	}
	public String getMember_status() {
		return member_status;
	}
	public void setMember_status(String member_status) {
		this.member_status = member_status;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getMember_admin() {
		return member_admin;
	}
	public void setMember_admin(String member_admin) {
		this.member_admin = member_admin;
	}
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public int getPoint_currentP() {
		return point_currentP;
	}
	public void setPoint_currentP(int point_currentP) {
		this.point_currentP = point_currentP;
	}
	public int getPoint_cumulativeP() {
		return point_cumulativeP;
	}
	public void setPoint_cumulativeP(int point_cumulativeP) {
		this.point_cumulativeP = point_cumulativeP;
	}
	public int getsPoint() {
		return sPoint;
	}
	public void setsPoint(int sPoint) {
		this.sPoint = sPoint;
	}
	public String getPoint_detail() {
		return point_detail;
	}
	public void setPoint_detail(String point_detail) {
		this.point_detail = point_detail;
	}
	public Timestamp getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Timestamp point_date) {
		this.point_date = point_date;
	}
	public String getPoint_history() {
		return point_history;
	}
	public void setPoint_history(String point_history) {
		this.point_history = point_history;
	}
	public String getMember_sns() {
		return member_sns;
	}
	public void setMember_sns(String member_sns) {
		this.member_sns = member_sns;
	}
	
	@Override
	public String toString() {
		return "MypageDTO [member_num=" + member_num + ", member_id=" + member_id + ", member_pass=" + member_pass
				+ ", member_name=" + member_name + ", member_nickname=" + member_nickname + ", member_gender="
				+ member_gender + ", member_phone=" + member_phone + ", member_input=" + member_input + ", member_out="
				+ member_out + ", member_respite=" + member_respite + ", member_status=" + member_status
				+ ", member_address=" + member_address + ", member_admin=" + member_admin + ", member_grade="
				+ member_grade + ", member_birth=" + member_birth + ", member_email=" + member_email
				+ ", point_currentP=" + point_currentP + ", point_cumulativeP=" + point_cumulativeP + ", sPoint="
				+ sPoint + ", point_detail=" + point_detail + ", point_date=" + point_date + ", point_history="
				+ point_history + ", member_sns=" + member_sns + "]";
	}
	
	// ===========================================================================================================================	
	
	private String title;
	private String TH_NAME;
	private String TH_REGION;
	private String TH_NUMBER;
	private String SP_NUM;
	private String SP_SEAT;
	private String SC_TIME;
	private String SC_TIME_END;
	private String TP_NUM;
	private String TOTAL_PRICE;
	
	
	public String getTP_NUM() {
		return TP_NUM;
	}
	public void setTP_NUM(String TP_NUM) {
		this.TP_NUM = TP_NUM;
	}
	public String getTOTAL_PRICE() {
		return TOTAL_PRICE;
	}
	public void setTOTAL_PRICE(String TOTAL_PRICE) {
		this.TOTAL_PRICE = TOTAL_PRICE;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTH_NAME() {
		return TH_NAME;
	}
	public void setTH_NAME(String TH_NAME) {
		this.TH_NAME = TH_NAME;
	}
	public String getTH_REGION() {
		return TH_REGION;
	}
	public void setTH_REGION(String TH_REGION) {
		this.TH_REGION = TH_REGION;
	}
	public String getTH_NUMBER() {
		return TH_NUMBER;
	}
	public void setTH_NUMBER(String TH_NUMBER) {
		this.TH_NUMBER = TH_NUMBER;
	}
	public String getSP_NUM() {
		return SP_NUM;
	}
	public void setSP_NUM(String SP_NUM) {
		this.SP_NUM = SP_NUM;
	}
	public String getSP_SEAT() {
		return SP_SEAT;
	}
	public void setSP_SEAT(String SP_SEAT) {
		this.SP_SEAT = SP_SEAT;
	}
	public String getSC_TIME() {
		return SC_TIME;
	}
	public void setSC_TIME(String SC_TIME) {
		this.SC_TIME = SC_TIME;
	}
	public String getSC_TIME_END() {
		return SC_TIME_END;
	}
	public void setSC_TIME_END(String SC_TIME_END) {
		this.SC_TIME_END = SC_TIME_END;
	}
	
	

}
