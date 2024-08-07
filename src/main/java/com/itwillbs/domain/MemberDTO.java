package com.itwillbs.domain;

public class MemberDTO {
	private String member_id; // 아이디
	private String member_pass; // 비밀번호
	private String member_name; // 이름
	private String member_gender; //성별
	private String member_phone; // 핸드폰 번호
	private String member_email; // 이메일
	private String member_birth; // 생년월일
	
	// 더 추가될 수 있음
	
	@Override
	public String toString() {
		return "MemberDTO [member_id=" + member_id + ", member_pass=" + member_pass + ", member_name=" + member_name
				+ ", member_gender=" + member_gender + ", member_phone=" + member_phone + ", member_email="
				+ member_email + ", member_birth=" + member_birth + "]";
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pass() {
		return member_pass;
	}
	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	
	
	
}
