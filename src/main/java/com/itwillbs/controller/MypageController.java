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
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.MypageService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	@Inject
	private MypageService mypageService;

	@GetMapping("/mymain") // 마이페이지 메인
	public String mymain(HttpSession session, Model model) {

		String id = (String) session.getAttribute("member_id");
		
		MypageDTO mypageDTO = mypageService.getMyInfo(id);
		model.addAttribute("mypageDTO", mypageDTO);

		// 멤버num을 참조하는 포인트 테이블의 포인트 가져오기
		String memberNum = mypageDTO.getMember_num();
		MypageDTO mypageDTO2 = mypageService.getPointByMemberNum(memberNum);
		model.addAttribute("point", mypageDTO2);

		return "/mypage/mymain";
	}

	@GetMapping("/myinfo") // 나의 정보
	public String myinfo(HttpSession session, Model model) throws ParseException {

		String id = (String) session.getAttribute("member_id");
		MypageDTO mypageDTO = mypageService.getMyInfo(id);
		model.addAttribute("mypageDTO", mypageDTO);

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date birthDate = dateFormat.parse(mypageDTO.getMember_birth());
		model.addAttribute("member_birth", birthDate);

		return "/mypage/myinfo";
	}

	@GetMapping("/myupdate")
	public String update(HttpSession session, Model model) throws ParseException {

		String id = (String) session.getAttribute("member_id");
		MypageDTO mypageDTO = mypageService.getMyInfo(id);
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

		boolean isValid = mypageService.checkPassword(memberId, originalPwd);

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

		return "redirect:/main/main";
	}

	@GetMapping("/mypoint")
	public String mypoint(HttpSession session, Model model) {

		String id = (String) session.getAttribute("member_id");
		MypageDTO mypageDTO = mypageService.getMyInfo(id);
		model.addAttribute("mypageDTO", mypageDTO);

		// 멤버num을 참조하는 포인트 테이블의 포인트 가져오기
		String memberNum = mypageDTO.getMember_num();
		MypageDTO mypageDTO2 = mypageService.getPointByMemberNum(memberNum);
		model.addAttribute("point", mypageDTO2);

		return "/mypage/mypoint";
	}

	@GetMapping("/mypayment")
	public String mypayment(HttpServletRequest request, HttpSession session, Model model) {

		int pageSize = 10;
		String pageNum = (String) request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		
		String search = request.getParameter("search");
		
		String id = (String) session.getAttribute("member_id");
		
		int memberNum = mypageService.getMemberNumByMemberId(id);

		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setSearch(search);

		
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("memberId", id);
	    paramMap.put("memberNum", memberNum);
	    paramMap.put("pageDTO", pageDTO);
	    
	    int count = mypageService.getBoardCount(paramMap);

		// 한 화면에 보여줄 페이지 개수
		int pageBlock = 10;
		// 시작하는 페이지번호 구하기
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		// 끝나는 페이지번호 구하기
		int endPage = startPage + pageBlock - 1;
		// 전체페이지수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		if (endPage > pageCount) {
			endPage = pageCount;
		}

		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		List<MypageDTO> myBookingList = mypageService.getMyBookingList(paramMap);
		
		model.addAttribute("myBookingList", myBookingList);
		model.addAttribute("pageDTO", pageDTO);

		return "/mypage/mypayment";
	}

	@GetMapping("/mypaymentinfo")
	public String mypaymentinfo(MypageDTO mypageDTO, Model model) {

		MypageDTO mypageDTO2 = mypageService.getMyBookingInfo(mypageDTO.getTP_NUM());

		model.addAttribute("mypageDTO", mypageDTO2);

		return "/mypage/mypaymentinfo";
	}
	
	@GetMapping("/mystorepayment")
	public String mystorepayment(HttpServletRequest request, HttpSession session, Model model) {

		int pageSize = 10;
		String pageNum = (String) request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		
		String search = request.getParameter("search");
		
		String id = (String) session.getAttribute("member_id");
		
		int memberNum = mypageService.getMemberNumByMemberId(id);

		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setSearch(search);

		
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("memberId", id);
	    paramMap.put("memberNum", memberNum);
	    paramMap.put("pageDTO", pageDTO);
	    
	    int count = mypageService.getStoreBoardCount(paramMap);

		// 한 화면에 보여줄 페이지 개수
		int pageBlock = 10;
		// 시작하는 페이지번호 구하기
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		// 끝나는 페이지번호 구하기
		int endPage = startPage + pageBlock - 1;
		// 전체페이지수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		if (endPage > pageCount) {
			endPage = pageCount;
		}

		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		List<MypageDTO> myStorePaymentList = mypageService.getMyStorePaymentList(paramMap);
		
		model.addAttribute("myStorePaymentList", myStorePaymentList);
		model.addAttribute("pageDTO", pageDTO);

		return "/mypage/mystorepayment";
	}
	
	@GetMapping("/mystorepaymentinfo")
	public String mystorepaymentinfo(MypageDTO mypageDTO, Model model) {

		MypageDTO mypageDTO2 = mypageService.getMyStorePaymentInfo(mypageDTO.getSp_num());

		model.addAttribute("mypageDTO", mypageDTO2);

		return "/mypage/mystorepaymentinfo";
	}

}
