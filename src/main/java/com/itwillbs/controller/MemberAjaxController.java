package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
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
		System.out.println("AjaxController idCheck() @@@@@@@@@@@@@@@@@@");
		
		MemberDTO memberDTO = memberService.getMemberId(id); // 아이디값 memberDTO에 저장
		System.out.println("체크: " + memberDTO); // 테스트
		
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
		System.out.println("AjaxController nickCheck() @@@@@@@@@@@@@@@@@@");
		
		MemberDTO memberDTO = memberService.getMemberNickname(nickname);
		System.out.println("체크: " + memberDTO);
		
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

}
