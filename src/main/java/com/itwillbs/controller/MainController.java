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
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.NewsDTO;
import com.itwillbs.domain.OfteniqDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.AnswerService;
import com.itwillbs.service.InquiryService;
import com.itwillbs.service.MovieService;
import com.itwillbs.service.NewsService;
import com.itwillbs.service.OfteniqService;
import com.mysql.cj.Session;
import com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream;


@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@Inject
	private MovieService movieService;
	
	@GetMapping("/main")//고객센터 메인
	public String Imain(@RequestParam(required = false) String page, Model model) {
		
		List<MovieDTO> movieList = movieService.getMovie(page);
		model.addAttribute("movieList", movieList);

		return "main/main";
	}
	

}// 클래스
