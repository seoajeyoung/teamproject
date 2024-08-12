package com.itwillbs.domain;

import java.sql.Timestamp;

public class NewsDTO {

	private String NEWS_NUM;
	private String NEWS_SECTION;
	private String NEWS_NAME;
	private String NEWS_CONTENT;
	private Timestamp NEWS_DATE;
	
	
	public String getNEWS_NUM() {
		return NEWS_NUM;
	}
	public void setNEWS_NUM(String nEWS_NUM) {
		NEWS_NUM = nEWS_NUM;
	}
	public String getNEWS_SECTION() {
		return NEWS_SECTION;
	}
	public void setNEWS_SECTION(String nEWS_SECTION) {
		NEWS_SECTION = nEWS_SECTION;
	}
	public String getNEWS_NAME() {
		return NEWS_NAME;
	}
	public void setNEWS_NAME(String nEWS_NAME) {
		NEWS_NAME = nEWS_NAME;
	}
	public String getNEWS_CONTENT() {
		return NEWS_CONTENT;
	}
	public void setNEWS_CONTENT(String nEWS_CONTENT) {
		NEWS_CONTENT = nEWS_CONTENT;
	}
	public Timestamp getNEWS_DATE() {
		return NEWS_DATE;
	}
	public void setNEWS_DATE(Timestamp nEWS_DATE) {
		NEWS_DATE = nEWS_DATE;
	}
	@Override
	public String toString() {
		return "NewsDTO [NEWS_NUM=" + NEWS_NUM + ", NEWS_SECTION=" + NEWS_SECTION + ", NEWS_NAME=" + NEWS_NAME
				+ ", NEWS_CONTENT=" + NEWS_CONTENT + ", NEWS_DATE=" + NEWS_DATE + "]";
	}
	

	
	
	
	
}

