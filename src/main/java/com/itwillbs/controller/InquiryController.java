package com.itwillbs.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.AnswerDTO;
import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.NewsDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.AnswerService;
import com.itwillbs.service.InquiryService;
import com.itwillbs.service.NewsService;
import com.mysql.cj.Session;
import com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream;


@Controller
@RequestMapping("/inquiry/*")
public class InquiryController {

	@Inject
	private InquiryService inquiryService;
	@Inject
	private AnswerService answerService;
	@Inject
	private NewsService newsService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@GetMapping("/Imain")//고객센터 메인
	public String Imain(HttpSession session, Model model) {
		
        // 세션에 임의의 사용자 이름 설정@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		session.setAttribute("member_num", "10");
        session.setAttribute("member_name", "admin");
        session.setAttribute("member_phone", "010-1234-5678");
        session.setAttribute("member_email", "aaa1234@gmail.com");
        

		return "inquiry/Imain";
	}

	@GetMapping("/often") //자주찾는 질문
	public String often() {
		return "inquiry/often";
	}

	@GetMapping("/news")//공지/뉴스
	public String news(HttpServletRequest request,HttpSession session, Model model) {
		String member_name = (String)session.getAttribute("member_name");
		model.addAttribute("MEMBER_NAME", member_name);
		return "inquiry/news";
	}
	
	@GetMapping("/newswrite")
	public String newswrite() {
		return "inquiry/newswrite";
	}

	@GetMapping("/complete")//문의글 쓴뒤에 다썻다고 알려주는 페이지
	public String complete(@RequestParam String inquiry_type, @RequestParam String inquiry_date, Model model) {
		model.addAttribute("inquiry_type", inquiry_type);
		model.addAttribute("inquiry_date", inquiry_date);
		return "inquiry/complete";
	}

	@GetMapping("/me")//나의문의내역
	public String me(HttpServletRequest request, HttpSession session, Model model) {
		String member_num = (String)session.getAttribute("member_num");
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 10;

		// request에서 "pageNum"을 가져와서 변수에 String pageNum 저장
		String pageNum = request.getParameter("pageNum");
		// pageNum == null 이면 => pageNum = 1 설정
		if (pageNum == null) {
			pageNum = "1";
		}
		// int currentPage = pageNum을 정수형으로 변경해서 변수에 저장
		int currentPage = Integer.parseInt(pageNum);
		// PageDTO 객체생성
		PageDTO pageDTO = new PageDTO();
		// PageDTO에 pageSize, pageNum, currentPage 저장
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		//넘버값으로 들어가서 본인이 쓴 글 DB에서 찾아서 뿌리기
		
		//검색어
		String search = request.getParameter("search");
		pageDTO.setSearch(search);
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_num", member_num);
		params.put("pageDTO", pageDTO);
		System.out.println("###############################");
		System.out.println(pageDTO.getSearch());
		
		//List<Map<String, Object>> mylist = inquiryService.getMyInquiryList(params);
		//model.addAttribute("mylist", mylist);
		
		String memberName = (String) session.getAttribute("member_name");
		if(memberName != null && memberName.equals("admin")) {
			System.out.println("admin");
			List<Map<String, Object>> mylist = inquiryService.getAdminListF(pageDTO);
			System.out.println("1111111111111111");
			int count = inquiryService.getAdminCountF(pageDTO);
			System.out.println("222222222222222");
			// 한 화면에 보여줄 페이지 개수
			int pageBlock = 10;
			// 시작하는 페이지 번호 구하기
			int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
			// 끝나는 페이지 번호 구하기
			int endPage = startPage + pageBlock - 1;
			// 전체페이지 수 구하기
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

			if (endPage > pageCount) {
				endPage = pageCount;
			}

			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			//model.addAttribute("inquiryList", inquiryList);// 스프링에서 get,set자동제공
			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("mylist", mylist);
		}else {
			List<Map<String, Object>> mylist = inquiryService.getMyInquiryList(params);
			model.addAttribute("mylist", mylist);
			// -----------------------------------------------------------------
			int count = inquiryService.getMyInquiryCount(params);
			// 한 화면에 보여줄 페이지 개수
			int pageBlock = 10;
			// 시작하는 페이지 번호 구하기
			int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
			// 끝나는 페이지 번호 구하기
			int endPage = startPage + pageBlock - 1;
			// 전체페이지 수 구하기
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

			if (endPage > pageCount) {
				endPage = pageCount;
			}

			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);

			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("mylist", mylist);
		}
			
		
		return "inquiry/me";
	}
	
	@GetMapping("/mycontent")//내가 쓴 글 하나씩 뿌려줌
	public String myconcent(InquiryDTO inquiryDTO, HttpSession session, Model model) {
		
		String inquiry_num = inquiryDTO.getInquiry_num();
		String member_num = (String)session.getAttribute("member_num");
		
		Map<String, Object> params = new HashMap<String, Object>();
	    params.put("INQUIRY_NUM", inquiry_num);
	    params.put("MEMBER_NUM", member_num);
		
		Map<String, Object> inquiryDTO2 = inquiryService.getInquiry(inquiry_num);
		Map<String, Object> inquiryDTO3 = inquiryService.getMyPrev(params);
		Map<String, Object> inquiryDTO4 = inquiryService.getMyNext(params);
		
		model.addAttribute("content", inquiryDTO2);
		model.addAttribute("prev", inquiryDTO3);
		model.addAttribute("next", inquiryDTO4);
		
		session.setAttribute("inquiry_num", inquiryDTO2);
		
		return "inquiry/mycontent";
		
	}

	// 세션값 받아와서 글쓸때 회원정보 확인 차 뿌릴거임 일단 보류
	@GetMapping("/write")
	public String write(HttpSession session, Model model) {
		
		String member_name = (String)session.getAttribute("member_name");
		String member_phone = (String)session.getAttribute("member_phone");
		String member_email = (String)session.getAttribute("member_email");
		
		model.addAttribute("member_name", member_name);
		model.addAttribute("member_phone", member_phone);
		model.addAttribute("member_email", member_email);
		
		return "inquiry/write";
	}

	@PostMapping("/writePro")
	public String writePro(HttpServletRequest request, MultipartFile inquiry_picture, RedirectAttributes redirectAttributes, HttpSession session) throws Exception {
		System.out.println("InquiryController writePro()");

		UUID uuid = UUID.randomUUID();
		String file = uuid.toString() + "_" + inquiry_picture.getOriginalFilename();
		System.out.println("파일이름 : " + file);

		// 업로드 원본파일 => upload 폴더에 복사(파일 업로드)
		System.out.println("파일경로 :" + uploadPath);
		FileCopyUtils.copy(inquiry_picture.getBytes(), new File(uploadPath, file));

		InquiryDTO inquiryDTO = new InquiryDTO();
		String member_num = (String)session.getAttribute("member_num");

		inquiryDTO.setMember_num(member_num);
		inquiryDTO.setInquiry_name(request.getParameter("inquiry_name"));
		inquiryDTO.setInquiry_detail(request.getParameter("inquiry_detail"));
		inquiryDTO.setInquiry_type(request.getParameter("inquiry_type"));
		inquiryDTO.setInquiry_picture(file);
		System.out.println(inquiryDTO);
		
		inquiryService.insertInquiry(inquiryDTO);
		String inquiry_type = inquiryDTO.getInquiry_type();
        Timestamp inquiry_date = inquiryDTO.getInquiry_date();
        
        String formattedInquiryDate = inquiry_date.toString();

        // RedirectAttributes를 사용하여 값 전달
        redirectAttributes.addAttribute("inquiry_type", inquiry_type);
        redirectAttributes.addAttribute("inquiry_date", inquiry_date);
		

		return "redirect:/inquiry/complete";
	}

	@GetMapping("/list")//문의내역
	public String list(HttpServletRequest request, Model model, HttpSession session) {
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 10;

		// request에서 "pageNum"을 가져와서 변수에 String pageNum 저장
		String pageNum = request.getParameter("pageNum");
		// pageNum == null 이면 => pageNum = 1 설정
		if (pageNum == null) {
			pageNum = "1";
		}
		// int currentPage = pageNum을 정수형으로 변경해서 변수에 저장
		int currentPage = Integer.parseInt(pageNum);
		// PageDTO 객체생성
		PageDTO pageDTO = new PageDTO();
		// PageDTO에 pageSize, pageNum, currentPage 저장
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		//검색어
		String search = request.getParameter("search");
		pageDTO.setSearch(search);
		
		String memberName = (String) session.getAttribute("member_name");
		
		//@@@@@@@@@@@@@@@@@@@@@@관리자만 모든 게시글 보이게################################안에 세션값 수정
		if(memberName != null && memberName.equals("admin")) {
			List<Map<String, Object>> inquiryList = inquiryService.getAdminList(pageDTO);
			int count = inquiryService.getAdminCount(pageDTO);
			// 한 화면에 보여줄 페이지 개수
			int pageBlock = 10;
			// 시작하는 페이지 번호 구하기
			int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
			// 끝나는 페이지 번호 구하기
			int endPage = startPage + pageBlock - 1;
			// 전체페이지 수 구하기
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

			if (endPage > pageCount) {
				endPage = pageCount;
			}

			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);

			model.addAttribute("inquiryList", inquiryList);// 스프링에서 get,set자동제공
			model.addAttribute("pageDTO", pageDTO);
		}else {
			List<Map<String, Object>> inquiryList = inquiryService.getInquiryList(pageDTO);
			// -----------------------------------------------------------------
			// 전체 글 개수 int count = getBoardCount() 메서드 호출
			int count = inquiryService.getInquiryCount(pageDTO);
			// 한 화면에 보여줄 페이지 개수
			int pageBlock = 10;
			// 시작하는 페이지 번호 구하기
			int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
			// 끝나는 페이지 번호 구하기
			int endPage = startPage + pageBlock - 1;
			// 전체페이지 수 구하기
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

				if (endPage > pageCount) {
				endPage = pageCount;
				}

			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);

			model.addAttribute("inquiryList", inquiryList);// 스프링에서 get,set자동제공
			model.addAttribute("pageDTO", pageDTO);
		}

		return "inquiry/list";
	}

	@GetMapping("/content")
	public String content(InquiryDTO inquiryDTO, Model model, HttpSession session) {
		System.out.println("글 목록에서 제목 눌러가꼬 한건 들고오는 컨트롤러");

		String clickNo = inquiryDTO.getInquiry_num();
		Map<String, Object> inquiryDTO2 = inquiryService.getInquiry(clickNo);
		Map<String, Object> inquiryDTO3 = inquiryService.getInquiryPrev(clickNo);
		Map<String, Object> inquiryDTO4 = inquiryService.getInquiryNext(clickNo);

		model.addAttribute("inquiryDTO", inquiryDTO2);
		model.addAttribute("prev", inquiryDTO3);
		model.addAttribute("next", inquiryDTO4);
		
		return "/inquiry/content";
	}

	@GetMapping("/update")
	public String update(@RequestParam(name = "num")String inquiry_num, HttpSession session, Model model) {
		
		String member_name = (String)session.getAttribute("member_name");
		String member_phone = (String)session.getAttribute("member_phone");
		String member_email = (String)session.getAttribute("member_email");
		
		model.addAttribute("member_name", member_name);
		model.addAttribute("member_phone", member_phone);
		model.addAttribute("member_email", member_email);
		
		Map<String, Object> inquiryDTO2 = inquiryService.getInquiry(inquiry_num);
		model.addAttribute("inquiryDTO", inquiryDTO2);
		
		return "/inquiry/update";
	}

	@PostMapping("/updatePro")
	public String updatePro(@RequestParam(value = "num", required = false) String num, HttpServletRequest request, Model model) {
		System.out.println();
		InquiryDTO inquiryDTO = new InquiryDTO();
		inquiryDTO.setInquiry_name(request.getParameter("inquiry_name"));
		inquiryDTO.setInquiry_detail(request.getParameter("inquiry_detail"));
		inquiryDTO.setInquiry_num(num);
		System.out.println(inquiryDTO);
		
		inquiryService.updateInquiry(inquiryDTO);
		model.addAttribute("InquiryDTO", inquiryDTO);

		return "redirect:/inquiry/me";
	}

	@GetMapping("/delete")//게시글, 답변 동시 삭제// MYCONENT에서 오면 ME로 이동
	public String deleteInquiry(@RequestParam("num")String num,HttpSession session, Model model) {
		System.out.println(num);
//        Map<String, Object> inquiryDTO = (Map<String, Object>) session.getAttribute("inquiryDTO");
//              
//        if (inquiryDTO != null) {
//            String INQUIRY_NUM = (String) inquiryDTO.get("INQUIRY_NUM");
//            model.addAttribute("INQUIRY_NUM", INQUIRY_NUM);
//            inquiryService.deleteInquiry(INQUIRY_NUM);
//        }
		
		inquiryService.deleteInquiry(num);
		
		// MYCONENT에서 오면 ME로 이동
		// ANSWER에서 오면LIST로 이동..

		return "redirect:/inquiry/me";
	}
	
	@GetMapping("/answer")//@@TODO@@@answer jsp에서 if문 admin아이디 대소문자 수정해야함!
	public String answer(@RequestParam("inquiry_num") String inquiryNum, Model model, HttpSession session) {
		
		//System.out.println(session.getAttribute("member_name"));
		Map<String, Object> inquiryDTO2 = inquiryService.getInquiry(inquiryNum);
		Map<String, Object> inquiryDTO3 = inquiryService.getInquiryPrev(inquiryNum);
		Map<String, Object> inquiryDTO4 = inquiryService.getInquiryNext(inquiryNum);

		model.addAttribute("inquiryDTO", inquiryDTO2);
		model.addAttribute("AS_NUM", inquiryDTO2.get("AS_NUM"));
		//session.setAttribute("inquiryDTO2", inquiryDTO2);
		model.addAttribute("prev", inquiryDTO3);
		model.addAttribute("next", inquiryDTO4);
		
		return "/inquiry/answer";
	}
	
	@PostMapping("/answerPro")
	public String answerPro(@RequestParam("IQ_NUM") String num, AnswerDTO answerDTO, HttpServletRequest request, Model model, HttpSession session) {
		//session.getAttribute("inquiryDTO2");
		Map<String, Object> dataMap = (Map<String, Object>)session.getAttribute("inquiryDTO2");
		InquiryDTO inquiryDTO = new InquiryDTO();
		inquiryDTO.setInquiry_name(request.getParameter("inquiry_name"));
		inquiryDTO.setInquiry_detail(request.getParameter("inquiry_detail"));
		inquiryDTO.setInquiry_num(num);
		
		//System.out.println(inquiryDTO);
		
		//model.addAttribute("InquiryDTO", inquiryDTO);
		answerDTO.setIQ_NUM(num);
		answerService.insertAnswer(answerDTO);
		
		return "redirect:/inquiry/list";
	}
	
	
	@PostMapping("/updateAsPro")//답변수정
	public String qna(AnswerDTO answerDTO) {
		answerService.updateAnswer(answerDTO);
		
		return "redirect:/inquiry/list";
	}
	
	@PostMapping("/deleteAs")
	public String deleteAs(AnswerDTO answerDTO) {
		answerService.deleteAs(answerDTO.getAS_NUM());
		return "redirect:/inquiry/list";
	}
			
	@GetMapping("/deletelist")//게시글, 답변 동시 삭제// ANSWER에서 오면LIST로 이동
	public String deletelist(@RequestParam("num")String num,HttpSession session, Model model) {

		inquiryService.deleteInquiry(num);
		
		return "redirect:/inquiry/list";
	}
	
	@PostMapping("/newswritePro")
	public String newswritePro(NewsDTO newsDTO) {
		newsService.insertNews(newsDTO);
		System.out.println(newsDTO);
		
		
		return "redirect:/inquiry/news";
	}
	
	@GetMapping("/newscontent")
	public String newscontent(NewsDTO newsDTO, Model model, HttpSession session) {

		String clickNo = newsDTO.getNEWS_NUM();
		Map<String, Object> newsDTO2 = newsService.getNews(clickNo);
		Map<String, Object> newsDTO3 = newsService.getNewsPrev(clickNo);
		Map<String, Object> newsDTO4 = newsService.getNewsNext(clickNo);

		model.addAttribute("newsDTO", newsDTO2);
		model.addAttribute("prev", newsDTO3);
		model.addAttribute("next", newsDTO4);
		
		String member_name = (String)session.getAttribute("member_name");
		model.addAttribute("MEMBER_NAME", member_name);
		
		return "/inquiry/newscontent";
	
	}
	
	@GetMapping("/updatenews")//공지 수정전 보여주기
	public String updateNews(@RequestParam("NEWS_NUM")String NEWS_NUM, Model model) {
		model.addAttribute("NEWS_NUM", NEWS_NUM);
		
		Map<String, Object> news = newsService.getNews(NEWS_NUM);
		model.addAttribute("news", news);
		
		return "/inquiry/updatenews";
	}
	
	@PostMapping("/newsUpdatePro")//답변수정
	public String newsUpdatePro(NewsDTO newsDTO) {
		newsService.updateNews(newsDTO);
		
		return "redirect:/inquiry/news";
	}
	
	@GetMapping("/deletenews")//공지 삭제
	public String deletenews(@RequestParam("NEWS_NUM")String NEWS_NUM, Model model) {

		newsService.deleteNews(NEWS_NUM);

		return "redirect:/inquiry/news";
	}
	
	@ResponseBody
	@PostMapping("/newssection")
	public Map<String, Object> newssection(HttpServletRequest request, @RequestBody Map<String, String> param) {
		System.out.println("!@#!@#");
		System.out.println(param);
		
		System.out.println("###################");
	
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 10;

		// request에서 "pageNum"을 가져와서 변수에 String pageNum 저장
//		String pageNum = request.getParameter("pageNum");
		String pageNum = "1";
		// pageNum == null 이면 => pageNum = 1 설정
		if (pageNum == null) {
			pageNum = "1";
		}
		// int currentPage = pageNum을 정수형으로 변경해서 변수에 저장
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		
		param.put("currentPage", currentPage+"");
		param.put("pageSize", pageSize+"");
		param.put("pageNum", pageNum+"");
		param.put("startRow", startRow-1+"");
		param.put("endRow", endRow+"");
		
		List<Map<String, Object>> newslist = newsService.getNewsList(param);
		//int count = newslist.size(); //= > limit값때문에 10까지 나옴
		int count = newsService.getNewsCount(param);
		// 한 화면에 보여줄 페이지 개수
		int pageBlock = 10;
		// 시작하는 페이지 번호 구하기
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		// 끝나는 페이지 번호 구하기
		int endPage = startPage + pageBlock - 1;
		// 전체페이지 수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		if (endPage > pageCount) {
			endPage = pageCount;
		}

		PageDTO pageDTO = new PageDTO();
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		
		System.out.println("News List: " + newslist);
		System.out.println("PageDTO: " + pageDTO);
		
		Map<String, Object> returnData = new HashMap<String, Object>();
		returnData.put("newslist", newslist);
		returnData.put("pageDTO", pageDTO);
		
		System.out.println(returnData);
		
		return returnData;
	}

	

}// 클래스
