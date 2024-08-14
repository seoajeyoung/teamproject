package com.itwillbs.domain;

public class CodeDetailDTO {
	
	private String code_id;
	private String codeValue;
	private String detail_code;
	private String detail_value;
	private String code_yn;

	// 기본 생성자
	public CodeDetailDTO() {
	}
	
	// 생성자
	public CodeDetailDTO(String code_id, String codeValue, String detail_code, String detail_value, String codeYn) {
		super();
		this.code_id = code_id;
		this.codeValue = codeValue;
		this.detail_code = detail_code;
		this.detail_value = detail_value;
		this.code_yn = codeYn;
	}

	public String getCode_id() {
		return code_id;
	}

	public void setCode_id(String code_id) {
		this.code_id = code_id;
	}

	public String getCodeValue() {
		return codeValue;
	}

	public void setCodeValue(String codeValue) {
		this.codeValue = codeValue;
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
