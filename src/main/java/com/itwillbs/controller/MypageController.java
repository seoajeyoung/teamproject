package com.itwillbs.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.MypageDTO;
import com.itwillbs.service.MypageService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Inject
	private MypageService mypageService;

	@GetMapping("/mymain") // 마이페이지 메인
	public String mymain(HttpSession session, Model model) {
		System.out.println("MypageController mymain()");
		
		String id = (String) session.getAttribute("member_id");
		MypageDTO mypageDTO = mypageService.getMyInfo(id);
		System.out.println(mypageDTO);
		model.addAttribute("mypageDTO", mypageDTO);
		
		// 멤버num을 참조하는 포인트 테이블의 포인트 가져오기
		String memberNum = mypageDTO.getMember_num();
        MypageDTO mypageDTO2 = mypageService.getPointByMemberNum(memberNum);  
        model.addAttribute("point", mypageDTO2);

		return "/mypage/mymain";
	}

	@GetMapping("/myinfo") // 나의 정보
	public String myinfo(HttpSession session, Model model) throws ParseException {
		System.out.println("MypageController myinfo()");
		
		String id = (String) session.getAttribute("member_id");
		MypageDTO mypageDTO = mypageService.getMyInfo(id);
		System.out.println(mypageDTO);
		model.addAttribute("mypageDTO", mypageDTO);
		
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthDate = dateFormat.parse(mypageDTO.getMember_birth());
        model.addAttribute("member_birth", birthDate);

		return "/mypage/myinfo";
	}
	
	@GetMapping("/myupdate")
	public String update(HttpSession session, Model model) throws ParseException {
		System.out.println("MypageController myupdate()");
		
		String id = (String) session.getAttribute("member_id");
		MypageDTO mypageDTO = mypageService.getMyInfo(id);
		System.out.println(mypageDTO);
		model.addAttribute("mypageDTO", mypageDTO);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthDate = dateFormat.parse(mypageDTO.getMember_birth());
        model.addAttribute("member_birth", birthDate);
	
	return "/mypage/myupdate";
	}
	
	@PostMapping("/mypage/checkPassword")
	@ResponseBody
	public Map<String, Boolean> checkPassword(@RequestParam("originalpwd") String originalPwd, HttpSession session) {
	    String memberId = (String) session.getAttribute("member_id");

	    System.out.println("User ID: " + memberId);
	    System.out.println("Entered password: " + originalPwd);

	    boolean isValid = mypageService.checkPassword(memberId, originalPwd);

	    System.out.println("Password validation result: " + isValid);

	    Map<String, Boolean> result = new HashMap<>();
	    result.put("valid", isValid);
	    return result;
	}
	
	@PostMapping("/mypage/myupdatePro")
	public String myUpdate(MypageDTO mypageDTO) {

		mypageService.updateMypage(mypageDTO);

		return "redirect:/mypage/myinfo";
	}
	
	@PostMapping("/mypage/mydelete")
	public String myDelete(@RequestParam("member_id") String id, HttpSession session) {
		
		mypageService.updateMystatus(id);
		session.invalidate();
		
		
	    return "redirect:/mypage/mymain";
	}
	
	@GetMapping("/mypoint") 
	public String mypoint(HttpSession session, Model model) {
		System.out.println("MypageController mymain()");
		
		String id = (String) session.getAttribute("member_id");
		MypageDTO mypageDTO = mypageService.getMyInfo(id);
		System.out.println(mypageDTO);
		model.addAttribute("mypageDTO", mypageDTO);
		
		// 멤버num을 참조하는 포인트 테이블의 포인트 가져오기
		String memberNum = mypageDTO.getMember_num();
        MypageDTO mypageDTO2 = mypageService.getPointByMemberNum(memberNum);  
        model.addAttribute("point", mypageDTO2);

		return "/mypage/mypoint";
	}
	
	@GetMapping("/mypayment")
	public String mypayment(HttpSession session, Model model) {
		System.out.println("MypageController mymain()");
		
		String id = (String) session.getAttribute("member_id");
		MypageDTO mypageDTO = mypageService.getMyInfo(id);
		System.out.println(mypageDTO);
		model.addAttribute("mypageDTO", mypageDTO);
		
		// 멤버num을 참조하는 포인트 테이블의 포인트 가져오기
		String memberNum = mypageDTO.getMember_num();
        MypageDTO mypageDTO2 = mypageService.getPointByMemberNum(memberNum);  
        model.addAttribute("point", mypageDTO2);

		return "/mypage/mypayment";
	}
}
