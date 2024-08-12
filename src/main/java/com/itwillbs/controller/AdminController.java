package com.itwillbs.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.ScheduleDTO;
import com.itwillbs.service.AdminService;
import com.itwillbs.service.EmailService;
import com.itwillbs.service.KMDBApiService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MovieService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Inject
	private AdminService adminService;
	@Inject
	private MovieService movieService;
	@Autowired
	private EmailService emailService;

//	@Autowired
//    private KobisApiService kobisApiService;

// ===========================================================

	// 메인화면

	@GetMapping("/member/index")
	public String index() {

		return "/admin/member/index";
	}

// ===========================================================	

	// 회원가입

//	@GetMapping("/member/register")
//    public String showRegisterPage() {
//        return "/admin/member/register";
//    }
//	
//    @PostMapping("/member/registerPro")
//    public String registerMember(MemberDTO memberDTO) {
//    	
//    	System.out.println(memberDTO);
//    	
//    	adminService.registerMember(memberDTO);
//
//        return "redirect:/admin/index";
//    }

// => 회원가입 일단 안써서 주석	
// ===========================================================

	// 회원목록

	@GetMapping("/member/memberlist")
	public String membertables(Model model) {
		System.out.println("AdminController membertables()");

		List<MemberDTO> memberList = adminService.getMemberList();
		System.out.println(memberList);
		model.addAttribute("memberList", memberList);

		return "/admin/member/memberlist";
	}

// ===========================================================

	// 회원상세정보확인

	@GetMapping("/member/info")
	public String info(MemberDTO memberDTO, Model model) {

		MemberDTO memberDTO2 = adminService.getMemberInfo(memberDTO.getMember_num());

		model.addAttribute("memberDTO", memberDTO2);

		return "/admin/member/info";
	}

// ===========================================================

	// 회원정보수정 update

	@GetMapping("/member/update")
	public String update(@RequestParam("member_num") String member_num, Model model) {

		MemberDTO memberDTO2 = adminService.getMemberInfo(member_num);

		model.addAttribute("memberDTO", memberDTO2);

		List<MemberDTO> detailList = adminService.getDetailList();
		model.addAttribute("detailList", detailList);

		return "/admin/member/update";
	}

// ===========================================================

	// 회원정보수정 updatePro

	@PostMapping("/member/updatePro")
	public String updatePro(MemberDTO memberDTO, @RequestParam("point_detail") String pointDetail,
			@RequestParam("sPoint") int sPoint, RedirectAttributes redirectAttributes) {

		adminService.updatePoint(memberDTO);
		adminService.updatePointHistory(memberDTO.getMember_num(), pointDetail, sPoint);
		adminService.updateMember(memberDTO);

		redirectAttributes.addAttribute("member_num", memberDTO.getMember_num());
		return "redirect:/admin/member/info";
	}

// =========================================================== 

	// 회원탈퇴/복구 페이지 이동

	@GetMapping("/member/memberDelete")
	public String delete(MemberDTO memberDTO, Model model) {

		MemberDTO memberDTO2 = adminService.getMemberInfo(memberDTO.getMember_num());
		model.addAttribute("memberDTO", memberDTO2);

		return "/admin/member/memberdelete";
	}

// ===========================================================    

	// 회원탈퇴(6개월 유예)

	@PostMapping("/member/memberRespitePro")
	public String respitePro(MemberDTO memberDTO) {

//    	System.out.println(memberDTO);

		adminService.respiteMember(memberDTO);

//    	System.out.println(memberDTO);

		return "redirect:/admin/member/info?member_num=" + memberDTO.getMember_num();
	}

// ===========================================================

	// 회원정보복구

	@PostMapping("/member/memberRestorePro")
	public String deletePro(MemberDTO memberDTO) {

		adminService.restoreMember(memberDTO);

		return "redirect:/admin/member/info?member_num=" + memberDTO.getMember_num();
	}

// ===========================================================    

	// 메일 보내는 페이지

	@GetMapping("/member/setm")
	public String sendEmailToMember(Model model) {

		List<AdminDTO> emailList = adminService.getEmailList();
		model.addAttribute("emailList", emailList);

		return "/admin/member/setm";
	}

// =========================================================== 

	// 메일 보내기

	@PostMapping("/member/setmPro")
	public String sendEmailToMemberPro(@RequestParam("receiver") String receiver,
			@RequestParam("subject") String subject, @RequestParam("content") String content) {

		try {
			emailService.sendEmail(receiver, subject, content);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("전송실패");
		}

		return "redirect:/admin/member/index";
	}

// ===========================================================

	// 영화목록

	@GetMapping("/movie/movielist")
	public String movietables(Model model) {
		System.out.println("AdminController movietables()");

		List<MovieDTO> movieList = adminService.getMovieList();
		model.addAttribute("movieList", movieList);
//		System.out.println(movieList);

		return "/admin/movie/movielist";
	}

// ===========================================================

	// 영화상세정보확인

	@GetMapping("/movie/movieinfo")
	public String movieinfo(MovieDTO movieDTO, Model model) {

		int movienum = Integer.parseInt(movieDTO.getMOVIE_NUM());
		MovieDTO movieDTO2 = adminService.movieInfo(movienum);

		model.addAttribute("movieDTO", movieDTO2);

		return "/admin/movie/movieinfo";
	}

// ===========================================================

	// 영화정보수정

	@GetMapping("/movie/movieupdate")
	public String mupdate(@RequestParam("MOVIE_NUM") int movie_num, Model model) {

		MovieDTO movieDTO2 = movieService.movieInfo(movie_num);
		model.addAttribute("movieDTO", movieDTO2);

		return "/admin/movie/movieupdate";
	}

// ===========================================================

	// 영화정보수정 movieupdatePro

	@PostMapping("/movie/movieupdatePro")
	public String movieupdatePro(MovieDTO movieDTO) {

		adminService.movieupdate(movieDTO);
		return "redirect:/admin/movie/movieinfo?MOVIE_NUM=" + movieDTO.getMOVIE_NUM();

	}

// ===========================================================

	@PostMapping("/movie/moviedeletePro")
	public String moviedeletePro(MovieDTO movieDTO) {

		adminService.moviedelete(movieDTO);
		return "redirect:/admin/movie/movielist";
	}

// ===========================================================

	// 지역 리스트
	@GetMapping("/movie/movieschedule")
	public String schdule(Model model) {
		System.out.println("AdminController schdule()");

		List<AdminDTO> regionList = adminService.getRegionList();
		model.addAttribute("regionList", regionList);

		// 저장된 상영일정 리스트
		List<ScheduleDTO> scheduleList = adminService.getScheduleList();
		System.out.println("등록된 상영 일정: " + scheduleList);
		model.addAttribute("scheduleList", scheduleList);

		return "/admin/movie/movieschedule";
	}

	// 지점명 리스트
	@RequestMapping(value = "/movie/getTheaterList", method = RequestMethod.POST)
	@ResponseBody
	public List<String> getTheaterList(@RequestParam("TH_REGION") String TH_REGION) {
		List<String> theaterNames = adminService.getNameList(TH_REGION);
		return theaterNames;
	}

	// 상영관 리스트
	@RequestMapping(value = "/movie/getCinemaList", method = RequestMethod.POST)
	@ResponseBody
	public List<String> getCinemaList(@RequestParam("TH_NAME") String TH_NAME) {
		List<String> cinemaList = adminService.getCinemaList(TH_NAME);
		return cinemaList;
	}

	// 영화명 리스트
	@RequestMapping(value = "/movie/getMovieNameList", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, String>> getMovieNameList(
			@RequestParam("releaseDate") @DateTimeFormat(pattern = "yyyy-MM-dd") String releaseDateStr) {
		// releaseDate와 3개월 전 날짜 계산
		LocalDate releaseDate = LocalDate.parse(releaseDateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		LocalDate threeMonthsAgo = releaseDate.minusMonths(3);

		// 파라미터 설정
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("releaseDate", releaseDateStr.replace("-", ""));
		params.put("threeMonthsAgo", threeMonthsAgo.format(DateTimeFormatter.ofPattern("yyyyMMdd")));

		return adminService.getMovieNameList(params);
	}

	// 겹치는 일정 검색
	@RequestMapping(value = "/movie/getSchedule", method = RequestMethod.POST)
	@ResponseBody
	public List<ScheduleDTO> getSchedule(@RequestParam String TH_REGION, @RequestParam String TH_NAME,
			@RequestParam String CI_NUMBER) {
		System.out.println("getSchedule");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("TH_REGION", TH_REGION);
		params.put("TH_NAME", TH_NAME);
		params.put("CI_NUMBER", CI_NUMBER);
		return adminService.getScheduleByCinema(params);
	}

	// 영화 상영 등록
	@PostMapping("/movie/movieschedulePro")
	public String insertSchdule(@RequestParam("TH_REGION") String region, @RequestParam("TH_NAME") String theater,
			@RequestParam("CI_NUMBER") String cinemaNumber, @RequestParam("title") String movie,
			@RequestParam(value = "titleEng", required = false) String titleEng,
			@RequestParam(value = "runtime", required = false) String runtime,
			@RequestParam("runningDts") @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date runningDts,
			@RequestParam("runningDte") @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date runningDte) {

		// CI_NUM 생성
		int ciNum = new Random().nextInt(1000000);

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("TH_REGION", region);
		params.put("TH_NAME", theater);
		params.put("CI_NUMBER", cinemaNumber);
		params.put("title", movie);
		params.put("titleEng", titleEng);
		params.put("runtime", runtime);
		params.put("SC_TIME", runningDts);
		params.put("SC_TIME_END", runningDte);
		params.put("CI_NUM", ciNum);

		// 영문명이 비어있는 것 찾고 비어있으면 저장
		String existingTitleEng = adminService.findTitleEng(movie);
		if (existingTitleEng == null || existingTitleEng.isEmpty()) {
			adminService.updateTitleEng(params);
		}

		// 런타임이 비어있는 것 찾고 비어있으면 저장
		String existingRuntime = adminService.findRuntime(movie);
		if (existingRuntime == null || existingRuntime.isEmpty()) {
			adminService.updateRuntime(params);
		}

		adminService.insertScreenTime(params);
		adminService.insertSchedule(params);

		return "redirect:/admin/movie/movieschedule";
	}

	@PostMapping("/movie/updateSchedule")
	@ResponseBody
	public void updateSchedule(@RequestParam Map<String, String> params) {
		adminService.updateTheater(params);
	}

	@PostMapping("/movie/deleteSchedule")
	@ResponseBody
	public void deleteSchedule(@RequestParam("CI_NUMBER") int ciNumber) {
		adminService.deleteTheater(ciNumber);
	}

// ===========================================================

	@GetMapping("/movie/theaterinsert")
	public String theaterlist(Model model) {
		System.out.println("AdminController theaterinsert()");

		// 지역 리스트
		List<AdminDTO> regionList = adminService.getRegionList();
		model.addAttribute("regionList", regionList);

		// 등록 지점 리스트
		List<AdminDTO> branchList = adminService.getBranchList();
		System.out.println("등록된 지점: " + branchList);
		model.addAttribute("branchList", branchList);

		return "/admin/movie/theaterinsert";
	}

// ===========================================================

	@RequestMapping(value = "/movie/findRegionEng", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminDTO> getfindAll(@RequestParam("TH_REGION") String region) {
		System.out.println("Received region: " + region);
		return adminService.getfindAll(region);
	}

	@PostMapping("/movie/theaterinsertPro")
	public String insertTheater(@RequestParam("RegionT") String RegionT,
			@RequestParam("TH_REGIONEngT") String REGIONEngT, @RequestParam("NameT") String NameT,
			@RequestParam("TH_NAMEEngT") String NAMEEngT, @RequestParam("TH_ADDRT") String ADDRT,
			@RequestParam("CI_NT") String CI_NT) {

		int THNum = new Random().nextInt(1000000);

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("TH_REGION", RegionT);
		params.put("TH_REGIONEng", REGIONEngT);
		params.put("TH_NAME", NameT);
		params.put("TH_NAMEEng", NAMEEngT);
		params.put("TH_ADDR", ADDRT);
		params.put("CI_NUMBER", CI_NT);
		params.put("TH_NUM", THNum);
		System.out.println("Params Map: " + params);

		adminService.insertTheater(params);
		adminService.insertCInumber(params);

		return "redirect:/admin/movie/theaterinsert";
	}

	@PostMapping("/movie/updateTheater")
	@ResponseBody
	public void updateTheater(@RequestParam Map<String, String> params) {
		adminService.updateTheater(params);
	}

	@PostMapping("/movie/deleteTheater")
	@ResponseBody
	public void deleteTheater(@RequestParam("TH_NUM") int thNum) {
		adminService.deleteTheater(thNum);
	}

	// 영화 검색 결과 페이지

//    @GetMapping("/admin/movie/search-result")
//    public String searchResults(@RequestParam("keyword") String keyword, Model model) {
//        try {
//            List<MovieDTO> movies = apiService.searchMoviesByKeyword(keyword);
//            model.addAttribute("movies", movies);
//        } catch (Exception e) {
//            model.addAttribute("error", "검색 중 오류가 발생했습니다.");
//        }
//        return "/admin/movie/search-result"; // 결과를 표시할 JSP 파일
//    }

//    @GetMapping("/movie/movie-details")
//    public String mmmm() {
//    	
//		
//        return "/admin/movie/movie-details";
//    }  

//	@GetMapping("/tables")
//	public String tables() {
//		
//		return "/admin/tables";
//	}
//	
//	@GetMapping("/login")
//	public String login() {
//		
//		return "/admin/login";
//	}
//	
//	@GetMapping("/404")
//	public String e404() {
//		
//		return "/admin/404";
//	}
//	
//	@GetMapping("/blank")
//	public String blank() {
//		
//		return "/admin/blank";
//	}
//	
//	@GetMapping("/buttons")
//	public String buttons() {
//		
//		return "/admin/buttons";
//	}
//	
//	@GetMapping("/cards")
//	public String cards() {
//		
//		return "/admin/cards";
//	}
//	
//	@GetMapping("/charts")
//	public String charts() {
//		
//		return "/admin/charts";
//	}
//	
//	@GetMapping("/forgot-password")
//	public String forgotpassword() {
//		
//		return "/admin/forgot-password";
//	}
//	
//		
//	@GetMapping("/register")
//	public String register() {
//		
//		return "/admin/register";
//	}
//	
//	@GetMapping("/utilities-animation")
//	public String utilitiesanimation() {
//		
//		return "/admin/utilities-animation";
//	}
//	
//	@GetMapping("/utilities-border")
//	public String utilitiesborder() {
//		
//		return "/admin/utilities-border";
//	}
//	
//	@GetMapping("/utilities-color")
//	public String utilitiescolor() {
//		
//		return "/admin/utilities-color";
//	}
//	
//	@GetMapping("/utilities-other")
//	public String utilitiesother() {
//		
//		return "/admin/utilities-other";
//	}

}
