package com.itwillbs.domain;

public class CodeDetailDTO {
	
	private String detail_code_num;
	private String code_num;
	private String detail_code;
	private String detail_value;

	// 추가
	private String code_id;
	private String code_value;

	
	// 기본 생성자
	public CodeDetailDTO() {
	}

	public CodeDetailDTO(String detail_code_num, String code_num, String detail_code, String detail_value) {
		this.detail_code_num = detail_code_num;
		this.code_num = code_num;
		this.detail_code = detail_code;
		this.detail_value = detail_value;
	}

	public String getDetail_code_num() {
		return detail_code_num;
	}

	public void setDetail_code_num(String detail_code_num) {
		this.detail_code_num = detail_code_num;
	}

	public String getCode_num() {
		return code_num;
	}

	public void setCode_num(String code_num) {
		this.code_num = code_num;
	}

	public String getDetail_code() {
		return detail_code;
	}

	public void setDetail_code(String detail_code) {
		this.detail_code = detail_code;
	}

	public String getDetail_value() {
		return detail_value;
	}

	public void setDetail_value(String detail_value) {
		this.detail_value = detail_value;
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

	
	
	
	

}
