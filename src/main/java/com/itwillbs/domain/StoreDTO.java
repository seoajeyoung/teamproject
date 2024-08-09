package com.itwillbs.domain;

import org.springframework.stereotype.Repository;

public class StoreDTO {
	
	private String st_num;
	private String st_name;
	private String st_detail;
	private String st_price;
	private String st_picture;
	private String st_type;
	
	
	@Override
	public String toString() {
		return "StoreDTO [st_num=" + st_num + ", st_name=" + st_name + ", st_detail=" + st_detail + ", st_price="
				+ st_price + ", st_picture=" + st_picture + ", st_type=" + st_type + "]";
	}


	public String getSt_num() {
		return st_num;
	}


	public void setSt_num(String st_num) {
		this.st_num = st_num;
	}


	public String getSt_name() {
		return st_name;
	}


	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}


	public String getSt_detail() {
		return st_detail;
	}


	public void setSt_detail(String st_detail) {
		this.st_detail = st_detail;
	}


	public String getSt_price() {
		return st_price;
	}


	public void setSt_price(String st_price) {
		this.st_price = st_price;
	}


	public String getSt_picture() {
		return st_picture;
	}


	public void setSt_picture(String st_picture) {
		this.st_picture = st_picture;
	}


	public String getSt_type() {
		return st_type;
	}


	public void setSt_type(String st_type) {
		this.st_type = st_type;
	}

	
}
