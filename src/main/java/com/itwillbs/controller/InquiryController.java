package com.itwillbs.controller;


import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.InquiryService;
import com.mysql.cj.Session;

@Controller
@RequestMapping("/inquiry/*")
public class InquiryController {
	
	@Inject
	private InquiryService inquiryService;
	
// servlet-context.xml에서 (id="uploadPath") 정의
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@GetMapping("/Imain")
	public String Imain() {
		System.out.println("InquiryController Imain()");
		
		return "inquiry/Imain";
	}
	
	@GetMapping("/often")
	public String often() {
		System.out.println("InquiryController often()");
		
		return "inquiry/often";
	}
	
	@GetMapping("/write")
	public String write() {
		System.out.println("InquiryController write()");
		return "inquiry/write";
	}	

	@PostMapping("/writePro")
	public String writePro(HttpServletRequest request, MultipartFile inquiry_picture) throws Exception{
		System.out.println("InquiryController writePro()");
		
		UUID uuid = UUID.randomUUID();
		String file = uuid.toString() + "_" + inquiry_picture.getOriginalFilename();
		System.out.println("파일이름 : "+file);
		
		// 업로드 원본파일 => upload 폴더에 복사(파일 업로드)	
		System.out.println("파일경로 :" + uploadPath);
		FileCopyUtils.copy(inquiry_picture.getBytes(), new File(uploadPath,file));
		
		InquiryDTO inquiryDTO = new InquiryDTO();
		
		inquiryDTO.setMember_num(request.getParameter("member_num"));
		inquiryDTO.setInquiry_name(request.getParameter("inquiry_name"));
		inquiryDTO.setInquiry_detail(request.getParameter("inquiry_detail"));
		inquiryDTO.setInquiry_type(request.getParameter("inquiry_type"));
		inquiryDTO.setInquiry_picture(file);
		System.out.println(inquiryDTO);
		
		inquiryService.insertInquiry(inquiryDTO);
		
		return "redirect:/inquiry/list";
	}

	@GetMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		System.out.println("InquiryController list()");
		//한 화면에 보여줄 글 개수 설정
		int pageSize = 10;
		
		//request에서 "pageNum"을 가져와서 변수에 String pageNum 저장
		String pageNum = request.getParameter("pageNum");
		//pageNum == null 이면 => pageNum = 1 설정
		if(pageNum == null) {
			pageNum = "1";
		}
		//int currentPage = pageNum을 정수형으로 변경해서 변수에 저장
		int currentPage = Integer.parseInt(pageNum);
		//PageDTO 객체생성
		PageDTO pageDTO = new PageDTO();
		//PageDTO에 pageSize, pageNum, currentPage 저장
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<InquiryDTO> inquiryList = inquiryService.getInquiryList(pageDTO);
		
		//-----------------------------------------------------------------
		// 전체 글 개수 int count = getBoardCount() 메서드 호출
		int count = inquiryService.getInquiryCount();
		// 한 화면에 보여줄 페이지 개수
		int pageBlock = 10;
		// 시작하는 페이지 번호 구하기
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		// 끝나는 페이지 번호 구하기
		int endPage = startPage + pageBlock - 1;
		//전체페이지 수 구하기
		int pageCount = count / pageSize +(count % pageSize == 0?0:1);
		
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		
		model.addAttribute("inquiryList", inquiryList);//스프링에서 get,set자동제공
		model.addAttribute("pageDTO", pageDTO);
		
		return "inquiry/list";
	}
	
	@GetMapping("/content")
	public String content(InquiryDTO inquiryDTO, Model model) {
		System.out.println("InquiryController content()");

		
		InquiryDTO inquiryDTO2 = inquiryService.getInquiry(inquiryDTO.getTheater_num());
		
		model.addAttribute("inquiryDTO", inquiryDTO2);
		
		
		return "/inquiry/content";
	}
	
	@GetMapping("/update")
	public String update(@RequestParam("num") int num, Model model) {
		System.out.println("InquiryController update()");
	
		return "/inquiry/update";
	}
	
	@PostMapping("/updatePro")
	public String updatePro(InquiryDTO inquiryDTO, Model model) {
		System.out.println("InquiryController updatePro()");
		
		inquiryService.updateInquiry(inquiryDTO);
		model.addAttribute("InquiryDTO", inquiryDTO);
		
		return "redirect:/inquiry/list";
	}
	
	@GetMapping("delete")
	public String deleteInquiry(InquiryDTO inquiryDTO) {
		System.out.println("InquiryController delete()");
		
		inquiryService.deleteInquiry(inquiryDTO.getInquiry_num());
		
		return "redirect:/inquiry/list";
	}
	
	
	
}//클래스
