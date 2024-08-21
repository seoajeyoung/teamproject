package com.itwillbs.domain;

import java.sql.Timestamp;
import java.util.List;

public class StorePaymentDTO {

//	private String sp_num;
//	private String member_num;
//	private String st_num;
	
	private String imp_uid;
    private String merchant_uid;
    private int payment_total_price;
    private String member_num;
    private List<String> st_num;  // 상품 번호 배열
    private List<Integer> cart_quantity;  // 수량 배열
    private List<String> cart_num;  // 장바구니 번호 배열
    
    
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public int getPayment_total_price() {
		return payment_total_price;
	}
	public void setPayment_total_price(int payment_total_price) {
		this.payment_total_price = payment_total_price;
	}
	public String getMember_num() {
		return member_num;
	}
	public void setMember_num(String member_num) {
		this.member_num = member_num;
	}
	public List<String> getSt_num() {
		return st_num;
	}
	public void setSt_num(List<String> st_num) {
		this.st_num = st_num;
	}
	public List<Integer> getCart_quantity() {
		return cart_quantity;
	}
	public void setCart_quantity(List<Integer> cart_quantity) {
		this.cart_quantity = cart_quantity;
	}
	public List<String> getCart_num() {
		return cart_num;
	}
	public void setCart_num(List<String> cart_num) {
		this.cart_num = cart_num;
	}

    
	
	
	
}
