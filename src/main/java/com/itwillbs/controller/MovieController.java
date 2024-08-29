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
import javax.servlet.http.HttpSession;

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
	public String moviePost(Model model, HttpSession session) {
		return "/movie/movie";
	}
	
	@PostMapping("/favorMovie")
	@ResponseBody
	public List<Map<String, Object>> favorMovie(HttpSession session) {
		String num = (String)session.getAttribute("member_num");
		List<Map<String, Object>> relMovie = new ArrayList<Map<String,Object>>();
		if(num != null) {
			Map<String, Object> rMap = new HashMap<String, Object>();
			rMap.put("MEMBER_NUM", num);
			relMovie = movieService.getRelMovies(rMap);
		}
		return relMovie;
	}
	
//	상영예정 영화
	@GetMapping("/upcomingMovies")
	@ResponseBody
	public Map<String, List<Map<String, Object>>> upcomingMovies() {
		List<Map<String, Object>> movieList = movieService.getUpcomingMovies();
		List<Map<String, Object>> Top3List = movieService.getTop3();
		Map<String, List<Map<String, Object>>> list = new HashMap<String, List<Map<String, Object>>>();
		list.put("movieDTO", movieList);
		list.put("Top3List", Top3List);
		
		return list;
	}
	
	// 무비차트 정렬
	@GetMapping("/sortMovies")
	@ResponseBody
	public List<Map<String, Object>> sortMovies(@RequestParam Map<String, String> rMap) {
		List<Map<String, Object>> movieList = movieService.getSortMovies(rMap);
		return movieList;
	}
	
	// 페이지 사이즈
	private final int pageSize = 6;
	// 영화 상세정보
	@GetMapping("/information")
	public String information(@RequestParam("num") int num, Model model, HttpSession session) {
		// 영화정보
		Map<String, Object> movieDTO = movieService.movieInfo(num);
		if(movieDTO == null) {
			return "/movie/back";
		}
		//리뷰 페이지 수
		int maxCount = movieService.getMaxPage(num);
		int endPage = maxCount / pageSize + (maxCount % pageSize > 0 ? 1 : 0);
		// 맵에
		Map<String, Object> rMap = new HashMap<String, Object>();
		rMap.put("MOVIE_NUM", num);
		List<Map<String, Object>> relMovie = movieService.getRelMovies(rMap);

		// 스틸컷
		String stillcut = (String)movieDTO.get("STILLURL");
		String[] stillcutSp;
		// 배열로 분리
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
				String url = "http://file.koreafilm.or.kr/still/"+subStr1+"/"+subStr2+"_01";
				stillcutUrl.add(url);
			}
		}

		//트레일러 영상 url
		String vod = (String)movieDTO.get("VODURL");
		vod = vod != null ? vod.trim() : "";
		String[] vodUrl;
		if(vod != null && vod.trim().contains(",")) {
			vodUrl = vod.split(",");
		} else if(vod != null) {
			vodUrl = new String[]{vod};
		} else {
			vodUrl = new String[0];
		}

		// 트레일러 이미지
		ArrayList<String> trailerTeaser = new ArrayList<String>();
		if(vodUrl.length != 0 && !vodUrl[0].trim().equals("")) {
			for(String str : vodUrl) {
				int index = str.indexOf("=") + 1;
				String subStr1 = str.substring(index);
				String subStr2 = subStr1.substring(0, 8);
				String url = "http://file.koreafilm.or.kr/multi/"+"00"+"/"+subStr2.substring(2, 4)+"/"+subStr2.substring(4, 6)+"/"+subStr2+".jpg";
				trailerTeaser.add(url);
			}
		}
		
		// 성비, 연령 차트
		Map<String, Object> chartData = movieService.getChartData(num);
		
		model.addAttribute("movieDTO", movieDTO);
		model.addAttribute("endPage", endPage);
		model.addAttribute("relMovie", relMovie);
		model.addAttribute("movieTrailer", vodUrl);
		model.addAttribute("trailerTeaser", trailerTeaser);
		model.addAttribute("stillcutUrl", stillcutUrl);
		model.addAttribute("chartData", chartData);
		
		//id가 있을때 찜목록 검색해서 해당영화의 상세페이지 찜 여부와 관람여부를 확인
		String id = (String)session.getAttribute("member_id");
		if(id != null) {
			rMap.put("MEMBER_ID", id);
			String bookmark = movieService.getBookmark(rMap) ? "favor" : "hate";
			model.addAttribute("BOOKMARK", bookmark);
			Boolean reviewCheck = movieService.getReviewUser(rMap);
			String showCheck = "";
			if(reviewCheck) {
				showCheck = movieService.getShowCheck(rMap) ? "showChecked" : "notShowChecked";
			} else {
				showCheck = "alReview";
			}
			model.addAttribute("REVIEWCHECK", showCheck);
		}
		
		return "/movie/information";
	}
	
	// 찜하기
	@PostMapping("/bookmark")
	@ResponseBody
	public ResponseEntity<String> bookmark(@RequestParam Map<String, Object> rMap) {
		String id = (String)rMap.get("MEMBER_ID");
		
		if(id == null || id.trim().equals("")) return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("nullId");
		
		
		boolean check = movieService.getBookmark(rMap);
		if(!check) {
			movieService.insertBookmark(rMap);
			return ResponseEntity.status(HttpStatus.OK).body("save");
		} else {
			movieService.deleteBookmark(rMap);
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("delete");
		}
	}
	
	
	
	
	

	//ifream 광고 ?
	@GetMapping("/ad")
	public String ad(Model model) {
		Map<String, String> adMovie = movieService.getAdMovie();
		model.addAttribute("adMovie", adMovie);
		return "/movie/ad";
	}
	
	@GetMapping("/pointChart")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> pointChart(@RequestParam int MOVIE_NUM) {
		Map<String, Object> chartMap = movieService.pointChart(MOVIE_NUM);
		if(chartMap != null) {
			return ResponseEntity.status(HttpStatus.OK).body(chartMap);
		} else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(chartMap);
		}
	}
	
	
	// =============================== 리뷰 ======================================
	// Review
	//평점 저장
	@ResponseBody
	@PostMapping("/insertReview")
	public ResponseEntity<Boolean> insertReview(@RequestParam Map<String, Object> data) {
		boolean result = movieService.getReviewUser(data);
		
		if(result) {
			movieService.insertReview(data);
			return ResponseEntity.status(HttpStatus.OK).body(result);
		} else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
		}
	}
//	List<List<String>>
	@GetMapping("/review")
	@ResponseBody
	public List<Map<String, Object>> review(@RequestParam Map<String, String> data) {
		Map<String, Object> rMap = new HashMap<String, Object>();
		int num = Integer.parseInt(data.get("MOVIE_NUM")); 
		rMap.put("MOVIE_NUM", num);
		int currentPage =  Integer.parseInt(data.get("currentPage"));
		int startRow = (currentPage - 1) * pageSize;
		rMap.put("startRow", startRow);
		rMap.put("pageSize", pageSize);
		int sortTab = Integer.parseInt(data.get("SORT_TAB"));
		rMap.put("SORT_TAB", sortTab);
		
		ArrayList<Map<String, Object>> reviewList = movieService.getReview(rMap);
		
		return reviewList;
	}
	
	// 추천기능 ajax 처리
	@PostMapping("/recommend")
	@ResponseBody
	public ResponseEntity<String> recommend(@RequestParam Map<String, Object> rMap) {
		boolean check = movieService.reUserCheck(rMap); // 해당 리뷰에 기록 있는지 확인
		if(check) {
			String str = movieService.reUserinsert(rMap);
			return ResponseEntity.status(HttpStatus.OK).body(str);
		} else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("중복");
		}
	}
	
	@GetMapping("/getMemberReview")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getMemberReview(@RequestParam Map<String, Object> rMap) {
		boolean check = movieService.getReviewUser(rMap);
		
		Map<String, Object> review = new HashMap<String,Object>();
		if(check) {
			ArrayList<Map<String, Object>> list = movieService.getReview(rMap);
			review = list.get(0);
			return ResponseEntity.status(HttpStatus.OK).body(review);
		} else {
			review.put("error", "noReview");
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(review);
		}
	}
	
	// 리뷰(평점) 수정
	@PostMapping("/updateReview")
	@ResponseBody
	public ResponseEntity<String> updateReview(@RequestParam Map<String, Object> rMap) {
		boolean result = movieService.updateReview(rMap);
		if(result) {
			return ResponseEntity.status(HttpStatus.OK).body("OK");
		} else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("notOK"); 
		}
	}
	// 리뷰 삭제
	@PostMapping("/deleteReview")
	public ResponseEntity<String> deleteReview(@RequestParam Map<String, Object> rMap) {
		rMap.get("REVIEW_NUM");
		boolean result = movieService.deleteReview(rMap);
		if(result) {
			return ResponseEntity.status(HttpStatus.OK).body("success");
		} else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("failed");
		}
	}
	
	
	
	
	// =============================== 상영 시간표 =====================================
	
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
		return date;
	}
	
	// 상세 페이지 상영시간표의 지역, 날자, 영화번호가 포함된 일정 구하기
	
	@GetMapping("/thMovies")
	@ResponseBody
	public List<Map<String, Object>> thMovies(@RequestParam Map<String, String> rMap) {
		List<Map<String, Object>> list = movieService.getThMovies(rMap);
		return list;
	}
	
	
	// ============================= myMovie =======================================
	@GetMapping("/myMovie")
	public String myMovie(HttpSession session, Model model) {
		String id = (String)session.getAttribute("member_id");
		if(id == null) return "/movie/idBack";
		Map<String, Object> data = movieService.getMyMovieCount(id);
		model.addAttribute("count", data);
		return "/movie/myMovie";
	}
	
	@GetMapping("/myMovieList")
	@ResponseBody
	public List<Map<String, Object>> myMovieList(@RequestParam Map<String, String> rMap, HttpSession session) {
		String id = (String)session.getAttribute("member_id");
		rMap.put("MEMBER_ID", id);
		List<Map<String, Object>> list = movieService.getMyMovieList(rMap);
		return list;
	}
	
	
	@PostMapping("/deleteBookmark")
	@ResponseBody
	public ResponseEntity<String> deleteBookmark(@RequestParam Map<String, Object> rMap, HttpSession session) {
		String id = (String)session.getAttribute("member_id");
		rMap.put("MEMBER_ID", id);
		boolean result = movieService.deleteBookmark(rMap);
		if(result) {
			return ResponseEntity.status(HttpStatus.OK).body("delete");
		} else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("failed");
		}
	}


}
