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

import org.apache.ibatis.reflection.SystemMetaObject;
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
import com.itwillbs.domain.OfteniqDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.AnswerService;
import com.itwillbs.service.InquiryService;
import com.itwillbs.service.NewsService;
import com.itwillbs.service.OfteniqService;
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
	@Inject
	private OfteniqService ofteniqService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@GetMapping("/Imain")//고객센터 메인
	public String Imain(HttpServletRequest request, HttpSession session, Model model) {
        
        List<Map<String, Object>> newslist = newsService.getShowNews();
        model.addAttribute("newslist", newslist);

        return "inquiry/Imain";
	}

	@GetMapping("/news")//공지&뉴스 리스트
	public String news(HttpServletRequest request,HttpSession session, Model model) {
		String member_id = (String)session.getAttribute("member_id");
		model.addAttribute("MEM_ID", member_id);
		return "inquiry/news";
	}
	
	@GetMapping("/newswrite") //공지&뉴스 작성
	public String newswrite() {
		return "inquiry/newswrite";
	}

	@GetMapping("/complete")//문의글 쓴 뒤에 다 썼다고 알려주는 페이지
	public String complete(@RequestParam String IQ_TYPE, @RequestParam String IQ_DATE, Model model) {
		model.addAttribute("IQ_TYPE", IQ_TYPE);
		model.addAttribute("IQ_DATE", IQ_DATE);
		return "inquiry/complete";
	}

	@GetMapping("/me")//나의문의내역 = >  내가 문의한 글 전부 보이게
	public String me(HttpServletRequest request, HttpSession session, Model model) {

		String MEM_NUM = (String)session.getAttribute("member_num");
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
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("MEM_NUM", MEM_NUM);
		params.put("pageDTO", pageDTO);
		
		String MEM_ID = (String) session.getAttribute("member_id");
		
		if(MEM_ID != null && MEM_ID.equals("admin")) {
			List<Map<String, Object>> mylist = inquiryService.getAdminListF(pageDTO);
			int count = inquiryService.getAdminCountF(pageDTO);
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
	public String myconcent(@RequestParam(value = "search", required = false) String search, InquiryDTO inquiryDTO, HttpSession session, Model model) {
		
		String IQ_NUM = inquiryDTO.getIQ_NUM();
		String MEM_NUM = (String)session.getAttribute("member_num");
		
		Map<String, Object> params = new HashMap<String, Object>();
	    params.put("IQ_NUM", IQ_NUM);
	    params.put("MEM_NUM", MEM_NUM);
		
		Map<String, Object> inquiryDTO2 = inquiryService.getInquiry(IQ_NUM);
		Map<String, Object> inquiryDTO3 = inquiryService.getMyPrev(params);
		Map<String, Object> inquiryDTO4 = inquiryService.getMyNext(params);
		
		model.addAttribute("content", inquiryDTO2);
		model.addAttribute("prev", inquiryDTO3);
		model.addAttribute("next", inquiryDTO4);
		
		session.setAttribute("IQ_NUM", inquiryDTO2);
		
		return "inquiry/mycontent";
		
	}

	
	@GetMapping("/write")// 세션값 받아와서 글쓸때 회원정보 뿌림
	public String write(HttpSession session, Model model) {
		
		String member_name = (String)session.getAttribute("member_name");
		String member_phone = (String)session.getAttribute("member_phone");
		String member_email = (String)session.getAttribute("member_email");
		
		model.addAttribute("member_name", member_name);
		model.addAttribute("member_phone", member_phone);
		model.addAttribute("member_email", member_email);
		
		return "inquiry/write";
	
	}
	
	@PostMapping("/writePro") //문의 작성
	public String writePro(HttpServletRequest request, MultipartFile IQ_PICTURE, RedirectAttributes redirectAttributes, HttpSession session) throws Exception {
		String MEM_NUM = (String)session.getAttribute("member_num");
		
		UUID uuid = UUID.randomUUID();
		String file = uuid.toString() + "_" + IQ_PICTURE.getOriginalFilename();

		// 업로드 원본파일 => upload 폴더에 복사(파일 업로드)
		FileCopyUtils.copy(IQ_PICTURE.getBytes(), new File(uploadPath, file));

		InquiryDTO inquiryDTO = new InquiryDTO();

		inquiryDTO.setMEM_NUM(MEM_NUM);
		inquiryDTO.setIQ_NAME(request.getParameter("IQ_NAME"));
		inquiryDTO.setIQ_DETAIL(request.getParameter("IQ_DETAIL"));
		inquiryDTO.setIQ_TYPE(request.getParameter("IQ_TYPE"));
		inquiryDTO.setIQ_PICTURE(file);
		
		inquiryService.insertInquiry(inquiryDTO);
		String IQ_TYPE = inquiryDTO.getIQ_TYPE();
        Timestamp IQ_DATE = inquiryDTO.getIQ_DATE();
        
        String formattedInquiryDate = IQ_DATE.toString();

        // RedirectAttributes를 사용하여 값 전달
        redirectAttributes.addAttribute("IQ_TYPE", IQ_TYPE);
        redirectAttributes.addAttribute("IQ_DATE", IQ_DATE);

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
		
		String member_id = (String)session.getAttribute("member_id");
		
		//@@@@@@@@@@@@@@@@@@@@@@관리자만 모든 게시글 보이게################################안에 세션값 수정
		if(member_id != null && member_id.equals("admin")) {
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

	@GetMapping("/content")//글 목록에서 제목 눌러서 해당글 + 이전/이후글 이동가능
	public String content(@RequestParam("search") String search, InquiryDTO inquiryDTO, Model model, HttpSession session) {

		String inquiryNum = inquiryDTO.getIQ_NUM();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("inquiryNum", inquiryNum);
		param.put("search", search);
		Map<String, Object> inquiryDTO2 = inquiryService.getInquiry(inquiryNum);
		Map<String, Object> inquiryDTO3 = inquiryService.getInquiryPrev(param);
		Map<String, Object> inquiryDTO4 = inquiryService.getInquiryNext(param);
		
		model.addAttribute("inquiryDTO", inquiryDTO2);
		model.addAttribute("prev", inquiryDTO3);
		model.addAttribute("next", inquiryDTO4);
		model.addAttribute("param", param);
		
		return "/inquiry/content";
	}

	@GetMapping("/update") // 문의글 업데이트 전에 쓴 글 뿌려줌
	public String update(@RequestParam(name = "num")String IQ_NUM, HttpSession session, Model model) {
		
		String member_name = (String)session.getAttribute("member_name");
		String member_phone = (String)session.getAttribute("member_phone");
		String member_email = (String)session.getAttribute("member_email");
		
		model.addAttribute("member_name", member_name);
		model.addAttribute("member_phone", member_phone);
		model.addAttribute("member_email", member_email);
		
		Map<String, Object> inquiryDTO2 = inquiryService.getInquiry(IQ_NUM);
		model.addAttribute("inquiryDTO", inquiryDTO2);
		
		return "/inquiry/update";
	}

	@PostMapping("/updatePro") // 문의 글 업데이트
	public String updatePro(@RequestParam(value = "num", required = false) String num, HttpServletRequest request, MultipartFile IQ_PICTURE, Model model)  throws Exception{
		
		
		String file = "";
		
		if(IQ_PICTURE.isEmpty()) {
			//첨부파일 없는 경우
			file = request.getParameter("oldfile");
		}else {
			//첨부파일 있는 경우
			//랜덤문자 만들기 => 파일이름 준비
			UUID uuid = UUID.randomUUID();
			file = uuid.toString() + "_" + IQ_PICTURE.getOriginalFilename();
			
			//업로드 원본파일 => upload 폴더에 복사(파일 업로드)	
			FileCopyUtils.copy(IQ_PICTURE.getBytes(), new File(uploadPath,file));
		}
		InquiryDTO inquiryDTO = new InquiryDTO();
		inquiryDTO.setIQ_NAME(request.getParameter("IQ_NAME"));
		inquiryDTO.setIQ_DETAIL(request.getParameter("IQ_DETAIL"));
		inquiryDTO.setIQ_NUM(num);
		inquiryDTO.setIQ_PICTURE(file);
		
		
		inquiryService.updateInquiry(inquiryDTO);
		model.addAttribute("InquiryDTO", inquiryDTO);

		return "redirect:/inquiry/me";
	}

	@GetMapping("/delete")//게시글, 답변 동시 삭제// MYCONENT에서 오면 ME로 이동
	public String deleteInquiry(@RequestParam("num")String num,HttpSession session, Model model) {

		inquiryService.deleteInquiry(num);

		return "redirect:/inquiry/me";
	}
	
	@GetMapping("/answer")//해당문의글 답변
	public String answer(@RequestParam("search") String search, InquiryDTO inquiryDTO, Model model, HttpSession session) {
		String IQ_NUM = inquiryDTO.getIQ_NUM();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("search", search);
		param.put("IQ_NUM", IQ_NUM);
		Map<String, Object> inquiryDTO2 = inquiryService.adminInquiry(IQ_NUM);
		Map<String, Object> inquiryDTO3 = inquiryService.adminPrev(param);
		Map<String, Object> inquiryDTO4 = inquiryService.adminNext(param);

		model.addAttribute("inquiryDTO", inquiryDTO2);
		model.addAttribute("AS_NUM", inquiryDTO2.get("AS_NUM"));
		model.addAttribute("prev", inquiryDTO3);
		model.addAttribute("next", inquiryDTO4);
		model.addAttribute("param", param);
		
		return "/inquiry/answer";
	}
	
	@PostMapping("/answerPro")// 답변 작성
	public String answerPro(@RequestParam("IQ_NUM") String num, AnswerDTO answerDTO, HttpServletRequest request, Model model, HttpSession session) {
		//session.getAttribute("inquiryDTO2");
		Map<String, Object> dataMap = (Map<String, Object>)session.getAttribute("inquiryDTO2");
		InquiryDTO inquiryDTO = new InquiryDTO();
		inquiryDTO.setIQ_NAME(request.getParameter("IQ_NAME"));
		inquiryDTO.setIQ_DETAIL(request.getParameter("IQ_DETAIL"));
		inquiryDTO.setIQ_NUM(num);
		
		
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
	
	@PostMapping("/deleteAs")//답변만 삭제! 문의글은 그대로
	public String deleteAs(AnswerDTO answerDTO) {
		answerService.deleteAs(answerDTO.getAS_NUM());
		return "redirect:/inquiry/list";
	}
			
	@GetMapping("/deletelist")//게시글, 답변 동시 삭제// ANSWER에서 오면LIST로 이동
	public String deletelist(@RequestParam("num")String num,HttpSession session, Model model) {

		inquiryService.deleteInquiry(num);
		
		return "redirect:/inquiry/list";
	}
	
	@PostMapping("/newswritePro")//뉴스 업데이트
	public String newswritePro(NewsDTO newsDTO) {
		newsService.insertNews(newsDTO);
		
		return "redirect:/inquiry/news";
	}
	
	@GetMapping("/newscontent")// 뉴스 제목 누르면 이전 이후글도 가져옴
	public String newscontent(NewsDTO newsDTO, Model model, HttpSession session) {

		String clickNo = newsDTO.getNEWS_NUM();
		Map<String, Object> newsDTO2 = newsService.getNews(clickNo);
		Map<String, Object> newsDTO3 = newsService.getNewsPrev(clickNo);
		Map<String, Object> newsDTO4 = newsService.getNewsNext(clickNo);

		model.addAttribute("newsDTO", newsDTO2);
		model.addAttribute("prev", newsDTO3);
		model.addAttribute("next", newsDTO4);
		
		String member_id = (String)session.getAttribute("member_id");
		model.addAttribute("MEM_ID", member_id);
		
		return "/inquiry/newscontent";
	
	}
	
	@GetMapping("/updatenews")//공지 수정전 보여주기
	public String updateNews(@RequestParam("NEWS_NUM")String NEWS_NUM, Model model) {
		model.addAttribute("NEWS_NUM", NEWS_NUM);
		
		Map<String, Object> news = newsService.getNews(NEWS_NUM);
		model.addAttribute("news", news);
		
		return "/inquiry/updatenews";
	}
	
	@PostMapping("/newsUpdatePro")//뉴스수정
	public String newsUpdatePro(NewsDTO newsDTO) {
		newsService.updateNews(newsDTO);
		
		return "redirect:/inquiry/news";
	}
	
	@GetMapping("/deletenews")//뉴스 삭제
	public String deletenews(@RequestParam("NEWS_NUM")String NEWS_NUM, Model model) {

		newsService.deleteNews(NEWS_NUM);

		return "redirect:/inquiry/news";
	}
	
	@ResponseBody
	@PostMapping("/newssection")// 뉴스 섹션별로 나눠서 누르면 해당 섹션만 보여줌 + 검색도 동시에 가능
	public Map<String, Object> newssection(HttpServletRequest request, @RequestBody Map<String, String> param) {

		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 10;
		
		// 페이지 번호 가져오기
	    String pageNum = param.get("pageNum");

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
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		Map<String, Object> returnData = new HashMap<String, Object>();
		returnData.put("newslist", newslist);
		returnData.put("pageDTO", pageDTO);
		
		return returnData;
	}
	
	@ResponseBody
	@PostMapping("/PrevNextNews")
	public Map<String, Object> PrevNextNews (@RequestBody Map<String, String> param){
		Map<String, Object> content = newsService.getNewsContent(param);
		Map<String, Object> prev = newsService.NewsPrev(param);
		Map<String, Object> next = newsService.NewsNext(param);
		
		Map<String, Object> data =  new HashMap<String, Object>();
		data.put("content", content);
		data.put("prev", prev);
		data.put("next", next);
		
		return data;
	}
	
	@GetMapping("/often") //자주찾는 질문
	public String often(HttpServletRequest request, Model model, HttpSession session) {
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
		
		// 시작하는 행번호
		int startRow = (pageDTO.getCurrentPage() - 1)*pageDTO.getPageSize() + 1;
		//끝나는 행번호
		int endRow = startRow + pageDTO.getPageSize() - 1;
		//pageDTO 에 저장
		// sql에서 사용할 구문 => limit startRow-1, pageSize 
		pageDTO.setStartRow(startRow-1); //sql구문에서 하기 힘드니까 미리 -1 하기
		pageDTO.setEndRow(endRow);
		
		//검색어
		String search = request.getParameter("search");
		pageDTO.setSearch(search);
		
		String MEM_ID = (String) session.getAttribute("member_id");
		List<Map<String, Object>> oftenList = ofteniqService.getOftenList(pageDTO);
		// -----------------------------------------------------------------
		// 전체 글 개수 int count = getBoardCount() 메서드 호출
		int count = ofteniqService.getOftenCount(pageDTO);
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

		model.addAttribute("oftenList", oftenList);// 스프링에서 get,set자동제공
		model.addAttribute("pageDTO", pageDTO);
		
		return "inquiry/often";
	}
	
	@GetMapping("/oftenwrite")
	public String oftenwrite() {
		return "/inquiry/oftenwrite";
	}
	
	@PostMapping("/oftenwritePro")
	public String newswritePro(OfteniqDTO ofteniqDTO) {
		ofteniqService.insertOfteniq(ofteniqDTO);
		
		return "redirect:/inquiry/often";
	} 
	
	@GetMapping("/oftencontent")
	public String oftencontent(@RequestParam("search") String search, OfteniqDTO ofteniqDTO, Model model, HttpSession session) {
		
		String clickNo = ofteniqDTO.getOF_NUM();
		//검색어
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("clickNo", clickNo);
		param.put("search", search);
		
		Map<String, Object> ofteniqDTO2 = ofteniqService.getOften(param);
		Map<String, Object> ofteniqDTO3 = ofteniqService.getOftenPrev(param);
		Map<String, Object> ofteniqDTO4 = ofteniqService.getOftenNext(param);

		model.addAttribute("content", ofteniqDTO2);
		model.addAttribute("prev", ofteniqDTO3);
		model.addAttribute("next", ofteniqDTO4);
		
		String member_id = (String)session.getAttribute("member_id");
		model.addAttribute("MEM_ID", member_id);
		return "/inquiry/oftencontent";
	}
	
	@GetMapping("/updateoften")//공지 수정전 보여주기
	public String updateoften(@RequestParam("OF_NUM")String OF_NUM, Model model) {
		model.addAttribute("OF_NUM", OF_NUM);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("clickNo", OF_NUM);
		Map<String, Object> often = ofteniqService.getOften(param);
		model.addAttribute("often", often);
		
		return "/inquiry/updateoften";
	}
	
	@PostMapping("/oftenUpdatePro")//답변수정
	public String oftenUpdatePro(OfteniqDTO ofteniqDTO) {
		ofteniqService.updateOften(ofteniqDTO);
		
		return "redirect:/inquiry/often";
	}
	
	@GetMapping("/deleteoften")//공지 삭제
	public String deleteoften(@RequestParam("OF_NUM")String OF_NUM, Model model) {

		ofteniqService.deleteoften(OF_NUM);

		return "redirect:/inquiry/often";
	}
	


	

}// 클래스
