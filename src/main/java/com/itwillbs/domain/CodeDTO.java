package com.itwillbs.domain;

public class CodeDTO {

	private String code_num;
	private String code_id;
	private String code_value;

	// 기본 생성자
	public CodeDTO() {
	}

	// 생성자
	public CodeDTO(String code_num, String code_id, String code_value) {
		this.code_num = code_num;
		this.code_id = code_id;
		this.code_value = code_value;
	}

	public String getCode_num() {
		return code_num;
	}

	public void setCode_num(String code_num) {
		this.code_num = code_num;
	}

	public String getCode_id() {
		return code_id;
	}

	public void setCode_id(String code_id) {
		this.code_id = code_id;
	}

	public String getCode_value() {
		return code_value;
	}

	public void setCode_value(String code_value) {
		this.code_value = code_value;
	}

	// Getter 및 Setter 메서드
	
	
}