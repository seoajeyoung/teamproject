package com.itwillbs.domain;

public class CodeDetailDTO {
	
	private String detail_code_num;
	private String code_id;
	private String code_value;
	private String detail_code;
	private String detail_value;
	private String code_yn;

	// 기본 생성자
	public CodeDetailDTO() {
	}

	public CodeDetailDTO(String detail_code_num, String code_id, String code_value, String detail_code,
			String detail_value, String code_yn) {
		super();
		this.detail_code_num = detail_code_num;
		this.code_id = code_id;
		this.code_value = code_value;
		this.detail_code = detail_code;
		this.detail_value = detail_value;
		this.code_yn = code_yn;
	}

	public String getDetail_code_num() {
		return detail_code_num;
	}

	public void setDetail_code_num(String detail_code_num) {
		this.detail_code_num = detail_code_num;
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

	public void setCode_value(String codeValue) {
		this.code_value = codeValue;
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

	public String getCode_yn() {
		return code_yn;
	}

	public void setCode_yn(String code_yn) {
		this.code_yn = code_yn;
	}

	
	

}
