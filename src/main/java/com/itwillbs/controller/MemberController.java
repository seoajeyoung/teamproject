package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	private MemberService memberService;

	@GetMapping("/register") // 회원가입페이지로 이동
	public String register() {
		System.out.println("MemberController register()");

		return "/member/register";
	}

	@PostMapping("/registerPro") // 회원가입페이지에 입력한 정보 memberDTO에 저장 
	public String registerPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController registerPro()");
		System.out.println(memberDTO);
		memberService.registerMember(memberDTO);
		
		session.setAttribute("member_id", memberDTO.getMember_id()); // 세션에 아이디값 저장
		return "redirect:/member/login";
	}

	/*
	 * @GetMapping("/registerComplete") // 회원가입완료화면 // session에 저장된 id값으로 아이디 조회,
	 * id있으면 memberDTO값 가져옴 public String registerComplete(HttpSession session,
	 * Model model) { System.out.println("MemberController registerComplete()");
	 * 
	 * String member_id = (String)session.getAttribute("member_id");
	 * System.out.println(member_id); MemberDTO memberDTO =
	 * memberService.getMember(member_id); // 세션에 저장된 아이디값에 해당하는 회원정보
	 * 
	 * model.addAttribute("memberDTO", memberDTO); //model에 저장 -> jsp에서 사용
	 * 
	 * return "member/registerComplete"; }
	 */

	@GetMapping("/login") // 로그인 페이지로 이동
	public String login() {
		System.out.println("MemberController login()");

		return "member/login";
	}
	
	
	@PostMapping("/loginPro") // post방식, 실제 로그인 진행
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController loginPro()");
		
		MemberDTO memberDTO2 = memberService.memberCheck(memberDTO); // 로그인 처리 (아이디 비밀번호 일치하는지 정보 조회)
		System.out.println(memberDTO2);
		
		if(memberDTO2 != null) {
			// 아이디 비밀번호 일치 -> 로그인표시값을 session 저장 -> /member/main 이동
			session.setAttribute("id", memberDTO.getMember_id());
			
			// /member/main 주소변경하면서 이동
			return "redirect:/member/main";
		}else {
			// 아이디 비밀번호 틀림 => 주소변경하면서 /member/login 이동
			// /member/login 주소변경하면서 이동
			return "redirect:/member/login";
		}
	}
	
	@GetMapping("/logout") // 로그아웃 진행
	public String logout(HttpSession session) {
		System.out.println("MemberController logout()");
		
		session.invalidate(); // 로그아웃처리 
		
		return "redirect:/member/main";
	}
}
