package com.itwillbs.domain;

import java.sql.Timestamp;

public class MypageDTO {
	
	private String MEM_NUM;
	private String MEM_ID;
	private String MEM_PASS;
	private String MEM_NAME;
	private String MEM_NICKNAME;
	private String MEM_GENDER;
	private String MEM_PHONE;
	private Timestamp MEM_INPUT;
	private Timestamp MEM_RESPITE;
	private Timestamp MEM_OUT;
	private String MEM_STATUS;
	private String MEM_ADMIN;
	private String MEM_GRADE;
	private String MEM_BIRTH;
	private String MEM_EMAIL;
	private String MEM_SNS;
	
	
	private int PO_CURP;
	private int PO_CUMP;
	private int sPoint;
	private String PO_HIS;
	private Timestamp point_date;
	
	
	
	// ================================================================
	
	public String getMEM_NUM() {
		return MEM_NUM;
	}
	public void setMEM_NUM(String MEM_NUM) {
		this.MEM_NUM = MEM_NUM;
	}
	public String getMEM_ID() {
		return MEM_ID;
	}
	public void setMEM_ID(String MEM_ID) {
		this.MEM_ID = MEM_ID;
	}
	public String getMEM_PASS() {
		return MEM_PASS;
	}
	public void setMEM_PASS(String MEM_PASS) {
		this.MEM_PASS = MEM_PASS;
	}
	public String getMEM_NAME() {
		return MEM_NAME;
	}
	public void setMEM_NAME(String MEM_NAME) {
		this.MEM_NAME = MEM_NAME;
	}
	public String getMEM_NICKNAME() {
		return MEM_NICKNAME;
	}
	public void setMEM_NICKNAME(String MEM_NICKNAME) {
		this.MEM_NICKNAME = MEM_NICKNAME;
	}
	public String getMEM_GENDER() {
		return MEM_GENDER;
	}
	public void setMEM_GENDER(String MEM_GENDER) {
		this.MEM_GENDER = MEM_GENDER;
	}
	public String getMEM_PHONE() {
		return MEM_PHONE;
	}
	public void setMEM_PHONE(String MEM_PHONE) {
		this.MEM_PHONE = MEM_PHONE;
	}
	public Timestamp getMEM_INPUT() {
		return MEM_INPUT;
	}
	public void setMEM_INPUT(Timestamp MEM_INPUT) {
		this.MEM_INPUT = MEM_INPUT;
	}
	public Timestamp getMEM_RESPITE() {
		return MEM_RESPITE;
	}
	public void setMEM_RESPITE(Timestamp MEM_RESPITE) {
		this.MEM_RESPITE = MEM_RESPITE;
	}
	public Timestamp getMEM_OUT() {
		return MEM_OUT;
	}
	public void setMEM_OUT(Timestamp MEM_OUT) {
		this.MEM_OUT = MEM_OUT;
	}
	public String getMEM_STATUS() {
		return MEM_STATUS;
	}
	public void setMEM_STATUS(String MEM_STATUS) {
		this.MEM_STATUS = MEM_STATUS;
	}
	public String getMEM_ADMIN() {
		return MEM_ADMIN;
	}
	public void setMEM_ADMIN(String MEM_ADMIN) {
		this.MEM_ADMIN = MEM_ADMIN;
	}
	public String getMEM_GRADE() {
		return MEM_GRADE;
	}
	public void setMEM_GRADE(String MEM_GRADE) {
		this.MEM_GRADE = MEM_GRADE;
	}
	public String getMEM_BIRTH() {
		return MEM_BIRTH;
	}
	public void setMEM_BIRTH(String MEM_BIRTH) {
		this.MEM_BIRTH = MEM_BIRTH;
	}
	public String getMEM_EMAIL() {
		return MEM_EMAIL;
	}
	public void setMEM_EMAIL(String MEM_EMAIL) {
		this.MEM_EMAIL = MEM_EMAIL;
	}
	public String getMEM_SNS() {
		return MEM_SNS;
	}
	public void setMEM_SNS(String MEM_SNS) {
		this.MEM_SNS = MEM_SNS;
	}
	public int getPO_CURP() {
		return PO_CURP;
	}
	public void setPO_CURP(int PO_CURP) {
		this.PO_CURP = PO_CURP;
	}
	public int getPO_CUMP() {
		return PO_CUMP;
	}
	public void setPO_CUMP(int PO_CUMP) {
		this.PO_CUMP = PO_CUMP;
	}
	public int getsPoint() {
		return sPoint;
	}
	public void setsPoint(int sPoint) {
		this.sPoint = sPoint;
	}
	public String getPO_HIS() {
		return PO_HIS;
	}
	public void setPO_HIS(String PO_HIS) {
		this.PO_HIS = PO_HIS;
	}
	public Timestamp getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Timestamp point_date) {
		this.point_date = point_date;
	}
	
	
	
	
	
	
	// ===========================================================================================================================	
	
	private String title;
	private String TH_NAME;
	private String TH_REGION;
	private String TH_NUMBER;
	private String TP_SEAT;
	private String SC_TIME;
	private String SC_TIME_END;
	private String TP_NUM;
	private String TP_PRICE;
	private String TP_TYPE;
	private String TP_PAYMENT;
	private String TP_TIME;
	
	

	public String getTP_TIME() {
		return TP_TIME;
	}
	public void setTP_TIME(String TP_TIME) {
		this.TP_TIME = TP_TIME;
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
	
	public String getTP_SEAT() {
		return TP_SEAT;
	}
	public void setTP_SEAT(String TP_SEAT) {
		this.TP_SEAT = TP_SEAT;
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
	public String getTP_NUM() {
		return TP_NUM;
	}
	public void setTP_NUM(String TP_NUM) {
		this.TP_NUM = TP_NUM;
	}
	public String getTP_PRICE() {
		return TP_PRICE;
	}
	public void setTP_PRICE(String TP_PRICE) {
		this.TP_PRICE = TP_PRICE;
	}
	public String getTP_TYPE() {
		return TP_TYPE;
	}
	public void setTP_TYPE(String TP_TYPE) {
		this.TP_TYPE = TP_TYPE;
	}
	public String getTP_PAYMENT() {
		return TP_PAYMENT;
	}
	public void setTP_PAYMENT(String TP_PAYMENT) {
		this.TP_PAYMENT = TP_PAYMENT;
	}
	
	// ================================================================
	
	private String SP_NUM;
	private String PRODUCT_TOTAL_PRICE;
	private String PAYMENT_DATE;
	private String ST_NAME;
	private String ST_TYPE;
	private String ST_CONST;
	
	
	public String getSP_NUM() {
		return SP_NUM;
	}
	public void setSP_NUM(String SP_NUM) {
		this.SP_NUM = SP_NUM;
	}
	public String getPRODUCT_TOTAL_PRICE() {
		return PRODUCT_TOTAL_PRICE;
	}
	public void setPRODUCT_TOTAL_PRICE(String PRODUCT_TOTAL_PRICE) {
		this.PRODUCT_TOTAL_PRICE = PRODUCT_TOTAL_PRICE;
	}
	public String getPAYMENT_DATE() {
		return PAYMENT_DATE;
	}
	public void setPAYMENT_DATE(String PAYMENT_DATE) {
		this.PAYMENT_DATE = PAYMENT_DATE;
	}
	public String getST_NAME() {
		return ST_NAME;
	}
	public void setST_NAME(String ST_NAME) {
		this.ST_NAME = ST_NAME;
	}
	public String getST_TYPE() {
		return ST_TYPE;
	}
	public void setST_TYPE(String ST_TYPE) {
		this.ST_TYPE = ST_TYPE;
	}
	public String getST_CONST() {
		return ST_CONST;
	}
	public void setST_CONST(String ST_CONST) {
		this.ST_CONST = ST_CONST;
	}
	
	
	
	

}
