package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@RestController
public class MemberAjaxController {
	
	@Inject
	private MemberService memberService;
	
	@GetMapping("/member/idCheck") // 아이디 중복확인 버튼 눌렀을 때
	public ResponseEntity<String> idCheck(@RequestParam("member_id") String id) {
		
		MemberDTO memberDTO = memberService.getMemberId(id); // 아이디값 memberDTO에 저장
		
		String result = "";
		if(memberDTO != null) { // 아이디값 중복될 시
			result = "iddup";
		}else {
			result = "idok";
		}
		ResponseEntity<String> entity =
				new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;
	}
	
	@GetMapping("/member/nickCheck") // 닉네임 중복확인 버튼 눌렀을 때(이하 내용 idCheck와 같음)
	public ResponseEntity<String> nickCheck(@RequestParam("member_nickname") String nickname) {
		
		MemberDTO memberDTO = memberService.getMemberNickname(nickname);
		
		String result = "";
		if(memberDTO != null) {
			result = "nickdup";
		}else {
			result = "nickok";
		}
		ResponseEntity<String> entity =
				new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;
	}
	
	@GetMapping("/member/phoneCheck") // 핸드폰 번호 중복확인 버튼 눌렀을 때(이하 내용 idCheck와 같음)
	public ResponseEntity<String> phoneCheck(@RequestParam("member_phone") String phone) {
		
		MemberDTO memberDTO = memberService.getMemberPhone(phone);
		
		String result = "";
		if(memberDTO != null) {
			result = "phonedup";
		}else {
			result = "phoneok";
		}
		ResponseEntity<String> entity =
				new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;
	}
	

}
