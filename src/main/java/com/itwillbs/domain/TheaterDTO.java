package com.itwillbs.domain;

public class TheaterDTO {
	
	private int th_num;
	private String th_name;
	private String th_region;
	private String th_addr;
	@Override
	public String toString() {
		return "TheatersDTO [th_num=" + th_num + ", th_name=" + th_name + ", th_region=" + th_region + ", th_addr="
				+ th_addr + "]";
	}
	public int getTh_num() {
		return th_num;
	}
	public void setTh_num(int th_num) {
		this.th_num = th_num;
	}
	public String getTh_name() {
		return th_name;
	}
	public void setTh_name(String th_name) {
		this.th_name = th_name;
	}
	public String getTh_region() {
		return th_region;
	}
	public void setTh_region(String th_region) {
		this.th_region = th_region;
	}
	public String getTh_addr() {
		return th_addr;
	}
	public void setTh_addr(String th_addr) {
		this.th_addr = th_addr;
	}
	
	
	
}//TheatersDTO2 클래스
