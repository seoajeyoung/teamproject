package com.itwillbs.domain;

import java.sql.Timestamp;

public class CartDTO {
	
	private String cart_num;
    private String member_num;
    private String st_num;
    private String cart_quantity;
    private Timestamp cart_date;
    private String st_name;
    private String st_price;

    
	

	@Override
	public String toString() {
		return "CartDTO [cart_num=" + cart_num + ", member_num=" + member_num + ", st_num=" + st_num
				+ ", cart_quantity=" + cart_quantity + ", cart_date=" + cart_date + ", st_name=" + st_name
				+ ", st_price=" + st_price + "]";
	}


	public String getCart_num() {
		return cart_num;
	}


	public void setCart_num(String cart_num) {
		this.cart_num = cart_num;
	}


	public String getMember_num() {
		return member_num;
	}


	public void setMember_num(String member_num) {
		this.member_num = member_num;
	}


	public String getSt_num() {
		return st_num;
	}


	public void setSt_num(String st_num) {
		this.st_num = st_num;
	}


	public String getCart_quantity() {
		return cart_quantity;
	}


	public void setCart_quantity(String cart_quantity) {
		this.cart_quantity = cart_quantity;
	}


	public Timestamp getCart_date() {
		return cart_date;
	}


	public void setCart_date(Timestamp cart_date) {
		this.cart_date = cart_date;
	}


	public String getSt_name() {
		return st_name;
	}


	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}


	public String getSt_price() {
		return st_price;
	}


	public void setSt_price(String st_price) {
		this.st_price = st_price;
	}


	
    
    
	
	
	
    
}


