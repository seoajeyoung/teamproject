package com.itwillbs.controller;

import java.io.FileWriter;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.service.MovieService;

@Controller
@RequestMapping("/movie/*")
@Configuration
public class MovieController implements WebMvcConfigurer {
	
	
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("*") // 모든 출처를 허용
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("*");
    }
	
	@Inject
	private MovieService movieService;
	// 영화 차트 
	@GetMapping("/movie")
	public String moviePost(@RequestParam(required = false) String page, Model model) {
		List<MovieDTO> movieList = movieService.getMovie(page);
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("page", page);
				
		
		//page값이 있으면 추가 구문
		if(page != null) {
			List<MovieDTO> Top3List = movieService.getTop3();
			model.addAttribute("Top3List", Top3List);
			List<LinkedHashMap<String, String>> movieDate = movieService.getReleseDate();
			model.addAttribute("movieDate", movieDate);
			
			model.addAttribute("on1", "");
			model.addAttribute("test", "on");
		} else {
			model.addAttribute("on1", "on"); // 무비차트와 상영 예정작에 css가 적용된 on class를 찔러넣기 위한
			model.addAttribute("on2", "");   // 데이터
		}
		
		
		return "/movie/movie";
	}
	
//	// 상영중인 영화
//	@GetMapping("/showMovies")
//	@ResponseBody
//	public List<MovieDTO> showMovies() {
//		List<MovieDTO> movielList = movieService.getShowMovies();
//		
//		return movielList;
//	}
	
	
	// 무비차트 정렬
	@GetMapping("/sortMovies")
	@ResponseBody
	public List<MovieDTO> sortMovies(@RequestParam int val) {
		List<MovieDTO> movieList = movieService.getSortMovies(val);
		
		return movieList;
	}
	
	// 페이지 사이즈를 상수로 등록해 한번에 관리
	private final int pageSize = 6;
	// 영화 상세정보
	@GetMapping("/information")
	public String information(@RequestParam int num, Model model) {
		// 영화정보
		MovieDTO movieDTO = movieService.movieInfo(num);
		
		//리뷰 페이지 수 구하기
		int maxCount = movieService.getMaxPage(num);
		int endPage = maxCount / pageSize + (maxCount % pageSize > 0 ? 1 : 0);
		List<Map<String, String>> relMovie = movieService.getRelMovies(num);

		// 스틸컷
		String stillcut = movieDTO.getStillUrl();
		String[] stillcutUrl;
		if(stillcut != null && stillcut.contains(",")) {
			stillcutUrl = stillcut.split(",");
			model.addAttribute("stillcutUrl", stillcutUrl);
		} else if(stillcut != null) {
			stillcutUrl = new String[]{stillcut};
			model.addAttribute("stillcutUrl", stillcutUrl);
		} else {
			model.addAttribute("stillcutUrl", "");
		}
		//트레일러
		String vod = movieDTO.getVodUrl();
		String[] vodUrl;
		if(vod != null && vod.contains(",")) {
			vodUrl = stillcut.split(",");
			model.addAttribute("movieTrailer", vodUrl);
		} else if(vod != null) {
			vodUrl = new String[]{vod};
			model.addAttribute("movieTrailer", vodUrl);
		} else {
			model.addAttribute("movieTrailer", "");
		}
		
		model.addAttribute("movieDTO", movieDTO);
		model.addAttribute("endPage", endPage);
		model.addAttribute("relMovie", relMovie);
		
		return "/movie/information";
	}
	
	
	// =============================== 리뷰 ======================================
	// Review
//	List<List<String>>
	@GetMapping("/review")
	@ResponseBody
	public List<Map<String, Object>> review(@RequestParam("MOVIE_NUM") int MOVIE_NUM,
											@RequestParam("currentPage") int currentPage) {
		Map<String, Integer> rMap = new HashMap<String, Integer>();
		rMap.put("MOVIE_NUM", MOVIE_NUM);
		int startRow = (currentPage - 1) * pageSize;
		rMap.put("startRow", startRow);
		rMap.put("pageSize", pageSize);
		
		ArrayList<Map<String, Object>> reviewList = movieService.getReview(rMap);
		
		return reviewList;
	}
	// 추천기능 ajax 처리
	@PostMapping("/recommend")
	@ResponseBody
	public ResponseEntity<String> recommend(@RequestParam Map<String, String> rMap) {
		System.out.println("추천기능 ajax처리");
		
		boolean check = movieService.reUserCheck(rMap);
		
		if(check) {
			movieService.reUserinsert(rMap);
			String str = movieService.updateRecommend(rMap);
			return ResponseEntity.status(HttpStatus.OK).body(str);
		} else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("중복 추천");
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/ifTime")
	public String ifTime() {
		
		
		
		
		
		return "/movie/ifTime";
	}
	
	


}
