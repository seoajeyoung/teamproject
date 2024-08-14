package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.MypageDTO;
import com.itwillbs.service.MypageService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Inject
	private MypageService mypageService;

	@GetMapping("/mymain") // 마이페이지 메인
	public String mytest() {
		System.out.println("MypageController mymain()");

//		HttpSession session, Model model
//		String id = (String) session.getAttribute("id");
//		MypageDTO mypageDTO = mypageService.getMyInfo(id);
//
//		model.addAttribute("mypageDTO", mypageDTO);

		return "/mypage/mymain";
	}

	@GetMapping("/myinfo") // 나의 정보
	public String myinfo() {
		System.out.println("MypageController myinfo()");

		return "/mypage/myinfo";
	}

}
