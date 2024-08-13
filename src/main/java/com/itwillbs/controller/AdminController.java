package com.itwillbs.controller;

import java.io.File;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	
	// servlet-context.xml에서 (id="uploadPath") 정의
	@Resource(name = "uploadPath")
	private String uploadPath;


// ===========================================================

	// 메인화면

	@GetMapping("/member/index")
	public String index() {

		return "/admin/member/index";
	}

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

	@GetMapping("/member/memberdelete")
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

	// 영화정보삭제
	@RequestMapping(value = "/movie/moviedelete", method = RequestMethod.POST)
	@ResponseBody
	public void moviedeletePro(MovieDTO movieDTO) {

		adminService.moviedelete(movieDTO);
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
			@RequestParam String TH_NUMBER) {
		System.out.println("getSchedule");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("TH_REGION", TH_REGION);
		params.put("TH_NAME", TH_NAME);
		params.put("TH_NUMBER", TH_NUMBER);
		return adminService.getScheduleByCinema(params);
	}

	// 영화 상영 등록
	@PostMapping("/movie/movieschedulePro")
	public String insertSchdule(@RequestParam("TH_REGION") String region, @RequestParam("TH_NAME") String theater,
			@RequestParam("TH_NUMBER") String cinemaNumber, @RequestParam("title") String movie,
			@RequestParam(value = "titleEng", required = false) String titleEng,
			@RequestParam(value = "runtime", required = false) String runtime,
			@RequestParam("runningDts") @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date runningDts,
			@RequestParam("runningDte") @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date runningDte) {

		// CI_NUM 생성
		int ciNum = new Random().nextInt(1000000);

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("TH_REGION", region);
		params.put("TH_NAME", theater);
		params.put("TH_NUMBER", cinemaNumber);
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

	@PostMapping("/movie/deleteSchedule")
	@ResponseBody
	public void deleteSchedule(@RequestParam("CI_NUM") int ciNum) {
		// SCREEN 테이블에서 관련된 데이터를 삭제
		adminService.deleteScreenByCINum(ciNum);
		// CINEMA 테이블에서 관련된 데이터를 삭제
		adminService.deleteCinemaByCINum(ciNum);
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

//// ===========================================================

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
		params.put("TH_NUMBER", CI_NT);
		params.put("TH_NUM", THNum);
		params.put("TH_ORDER", THNum);
		System.out.println("Params Map: " + params);

		adminService.insertTheater(params);

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

////===========================================================

	// 스토어

	@GetMapping("/store/controlstore")
	public String controlstore(Model model) {

		// 상품타입 리스트
		List<AdminDTO> typeList = adminService.getTypeList();
		model.addAttribute("typeList", typeList);
		
		// 상품 리스트
		List<AdminDTO> storeList = adminService.getStoreList();
		model.addAttribute("storeList", storeList);

		return "/admin/store/controlstore";
	}

	@PostMapping("/store/check-store-details")
	@ResponseBody
	public Map<String, Boolean> checkStoreDetails(@RequestParam("ST_NUM") String ST_NUM,
			@RequestParam("ST_NAME") String ST_NAME, @RequestParam("ST_DETAIL") String ST_DETAIL) {

		Map<String, String> storeDetails = new HashMap<>();
		storeDetails.put("ST_NUM", ST_NUM);
		storeDetails.put("ST_NAME", ST_NAME);
		storeDetails.put("ST_DETAIL", ST_DETAIL);

		return adminService.checkStoreDetails(storeDetails);
	}
	
	@PostMapping("/store/controlstorePro")
	public String insertStore(HttpServletRequest request, MultipartFile store_picture) throws Exception {
		
		UUID uuid = UUID.randomUUID();
		String file = uuid.toString() + "_" + store_picture.getOriginalFilename();
		System.out.println("파일이름 : " + file);
		
		String desktopPath = "C:\\Users\\ITWILL\\Desktop\\upload";
		FileCopyUtils.copy(store_picture.getBytes(), new File(desktopPath, file));
//		FileCopyUtils.copy(store_picture.getBytes(), new File(uploadPath, file)); 이미지 업로드 가능하면
		
		AdminDTO adminDTO = new AdminDTO();
		adminDTO.setST_NUM(request.getParameter("ST_NUM"));
		adminDTO.setST_NAME(request.getParameter("ST_NAME"));
		adminDTO.setST_PRICE(request.getParameter("ST_PRICE"));
		adminDTO.setST_TYPE(request.getParameter("ST_TYPE"));
		adminDTO.setST_DETAIL(request.getParameter("ST_DETAIL"));
		adminDTO.setST_PICTURE(file);
		System.out.println(adminDTO);
		adminService.insertStore(adminDTO);

		return "redirect:/admin/store/controlstore";
	}

}
