package com.itwillbs.domain;

import java.sql.Timestamp;
import java.util.Map;

public class MemberDTO {
	private String member_num;
	private String member_id;
	private String member_pass;
	private String member_name;
	private String member_nickname;
	private String member_gender;
	private String member_phone;
	private Timestamp member_input;
	private Timestamp member_out;
	private Timestamp member_respite;
	private String member_status;
	private String member_address;
	private String member_admin;
	private String member_grade;
	private String member_birth;
	private String member_email;
	private int point_currentP;
	private int point_cumulativeP;
	private int sPoint;
	private String point_detail;
	private Timestamp point_date;
	private String point_history;
	private String member_sns; // sns 로그인 유무
	private String MEM_ID;
	private String MEM_PASS;
	
	
	
	// 더 추가될 수 있음
	
	public String getMEM_ID() {
		return MEM_ID;
	}

	public void setMEM_ID(String mEM_ID) {
		MEM_ID = mEM_ID;
	}

	public String getMEM_PASS() {
		return MEM_PASS;
	}

	public void setMEM_PASS(String mEM_PASS) {
		MEM_PASS = mEM_PASS;
	}

	// 기본 생성자
	public MemberDTO() {
		
	}
	
	// Map을 받아 필드에 일괄적으로 값 세팅하는 생성자
    public MemberDTO(Map<String, Object> responseMap) {
        this.member_id = (String) responseMap.get("id");
        this.member_name = (String) responseMap.get("name");
        this.member_email = (String) responseMap.get("email");
 
        if (responseMap.get("gender").equals("M")) {
        	this.member_gender = "남";
        } else {
        	this.member_gender = "여";
        }
        
        String birthyear = (String) responseMap.get("birthyear");
        String birthday = ((String) responseMap.get("birthday")).replace("-", "");
        this.member_birth = birthyear + birthday;
        this.member_phone = ((String) responseMap.get("mobile")).replace("-", "");

    }

	
    
    

	@Override
	public String toString() {
		return "MemberDTO [member_id=" + member_id + ", member_pass=" + member_pass + "]";
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

	public String getMember_num() {
		return member_num;
	}

	public void setMember_num(String member_num) {
		this.member_num = member_num;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getMember_sns() {
		return member_sns;
	}

	public void setMember_sns(String member_sns) {
		this.member_sns = member_sns;
	}

	public Timestamp getMember_input() {
		return member_input;
	}

	public void setMember_input(Timestamp member_input) {
		this.member_input = member_input;
	}

	public Timestamp getMember_out() {
		return member_out;
	}

	public void setMember_out(Timestamp member_out) {
		this.member_out = member_out;
	}

	public Timestamp getMember_respite() {
		return member_respite;
	}

	public void setMember_respite(Timestamp member_respite) {
		this.member_respite = member_respite;
	}

	public String getMember_status() {
		return member_status;
	}

	public void setMember_status(String member_status) {
		this.member_status = member_status;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_admin() {
		return member_admin;
	}

	public void setMember_admin(String member_admin) {
		this.member_admin = member_admin;
	}

	public String getMember_grade() {
		return member_grade;
	}

	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}

	public int getPoint_currentP() {
		return point_currentP;
	}

	public void setPoint_currentP(int point_currentP) {
		this.point_currentP = point_currentP;
	}

	public int getPoint_cumulativeP() {
		return point_cumulativeP;
	}

	public void setPoint_cumulativeP(int point_cumulativeP) {
		this.point_cumulativeP = point_cumulativeP;
	}

	public int getsPoint() {
		return sPoint;
	}

	public void setsPoint(int sPoint) {
		this.sPoint = sPoint;
	}

	public String getPoint_detail() {
		return point_detail;
	}

	public void setPoint_detail(String point_detail) {
		this.point_detail = point_detail;
	}

	public Timestamp getPoint_date() {
		return point_date;
	}

	public void setPoint_date(Timestamp point_date) {
		this.point_date = point_date;
	}

	public String getPoint_history() {
		return point_history;
	}

	public void setPoint_history(String point_history) {
		this.point_history = point_history;
	}
	
	
	
	
	
	
}
