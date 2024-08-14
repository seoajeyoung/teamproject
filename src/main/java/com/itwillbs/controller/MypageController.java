package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@GetMapping("/mymain") // 마이페이지 메인
	public String mymain() {
		System.out.println("MypageController mymain()");

		return "/mypage/mymain";
	}
	
	
	@GetMapping("/mytest") // 테스트
	public String mytest() {
		System.out.println("MypageController mytest()");

		return "/mypage/mytest";
	}

}
