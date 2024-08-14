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
import javax.print.DocFlavor.STRING;
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
import com.itwillbs.service.TheaterService;

@Controller
@RequestMapping("/movie/*")
@Configuration
public class MovieController implements WebMvcConfigurer {
	
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
	public String information(@RequestParam("num") int num, Model model) {
		// 영화정보
		MovieDTO movieDTO = movieService.movieInfo(num);
		
		//리뷰 페이지 수 구하기
		int maxCount = movieService.getMaxPage(num);
		int endPage = maxCount / pageSize + (maxCount % pageSize > 0 ? 1 : 0);
		List<Map<String, String>> relMovie = movieService.getRelMovies(num);

		// 스틸컷
		String stillcut = movieDTO.getStillUrl();
		String[] stillcutSp;
		
		if(stillcut != null && stillcut.contains(",")) {
			stillcutSp = stillcut.split(",");
		} else if(stillcut != null) {
			stillcutSp = new String[]{stillcut};
		} else {
			stillcutSp = new String[0];
		}
		
		ArrayList<String> stillcutUrl = new ArrayList<String>();
		
		if(stillcutSp.length != 0 && !stillcutSp[0].trim().equals("")) {
			for(String str : stillcutSp) {
				int index1 = str.indexOf("copy/");
				int index2 = str.indexOf("/tn_");
				int index3 = str.indexOf(".jpg")-1;
				String subStr1 = str.substring(index1, index2);
				String subStr2 = str.substring(index2+4, index3+1);
				String url = "http://file.koreafilm.or.kr/still/"+subStr1+"/"+subStr2+"_01.JPG";
				stillcutUrl.add(url);
			}
		}
		//트레일러
		
		String vod = movieDTO.getVodUrl() != null ? movieDTO.getVodUrl().trim() : "";
		String[] vodUrl;
		if(vod != null && vod.trim().contains(",")) {
			vodUrl = vod.split(",");
		} else if(vod != null) {
			vodUrl = new String[]{vod};
		} else {
			vodUrl = new String[0];
		}

		
		ArrayList<String> trailerTeaser = new ArrayList<String>();
		if(vodUrl.length != 0 && !vodUrl[0].trim().equals("")) {
			for(String str : vodUrl) {
				int index = str.indexOf("=") + 1;
				String subStr1 = str.substring(index);
				String subStr2 = subStr1.substring(0, 8);
				String url = "http://file.koreafilm.or.kr/multi/"+"00"+"/"+subStr2.substring(2, 4)+"/"+subStr2.substring(4, 6)+"/"+subStr2+".jpg";
				System.out.println(url);
				trailerTeaser.add(url);
			}
		}
		
		model.addAttribute("movieDTO", movieDTO);
		model.addAttribute("endPage", endPage);
		model.addAttribute("relMovie", relMovie);
		model.addAttribute("movieTrailer", vodUrl);
		model.addAttribute("trailerTeaser", trailerTeaser);
		model.addAttribute("stillcutUrl", stillcutUrl);
		
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
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("중복");
		}
	}
	
	// 상영 시간표 탭 ifream 활용
	@GetMapping("/ifTime")
	public String ifTime(@RequestParam Map<String, String> rMap, Model model) {
		List<Map<String, String>> region = movieService.getMovieSchedule(rMap);
		model.addAttribute("region", region);
		return "/movie/ifTime";
	}
	
	@Inject
	private TheaterService theaterService;
	// ajax를 활용해 현재 영화와 지역의 상영일이 존재하는 날자값 구하기
	@GetMapping("/runningDate")
	@ResponseBody
	public List<Map<String, String>> runningDate(@RequestParam Map<String, String> rMap) {
		List<Map<String, String>> date = theaterService.getRunningDate(rMap);
		System.out.println(date);
		return date;
	}
	
	// 상세 페이지 상영시간표의 지역, 날자, 영화번호가 포함된 일정 구하기
	
	@GetMapping("/thMovies")
	@ResponseBody
	public List<Map<String, String>> thMovies(@RequestParam Map<String, String> rMap) {
		System.out.println("시작");
		List<Map<String, String>> list = movieService.getThMovies(rMap);
		System.out.println("테스트");
		System.out.println(list);
		return list;
	}
	


}
