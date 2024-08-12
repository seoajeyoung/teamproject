package com.itwillbs.controller;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.MovieDTO;
import com.itwillbs.service.MovieService;

@Controller
@RequestMapping("/movie/*")
public class MovieController {
	
	@Inject
	private MovieService movieService;
	
	// 영화 차트 
	@GetMapping("/movie")
	public String moviePost(@RequestParam(required = false) Integer page, Model model) {
		if(page == null) page = 1;
		// get방식으로 받아온 page값이 page=2면 상영 예정작 
		List<MovieDTO> movieList = movieService.getMovie(page);
		model.addAttribute("movieList", movieList);
		System.out.println(movieList);
		return "/movie/movie";
	}
	
	
	// 상영중인 영화
	@GetMapping("/showMovies")
	@ResponseBody
	public List<MovieDTO> showMovies() {
		List<MovieDTO> movielList = movieService.getShowMovies();
		return movielList;
	}
	
	
	// 무비차트 정렬
	@GetMapping("/sortMovies")
	@ResponseBody
	public List<MovieDTO> sortMovies(@RequestParam int val) {
		System.out.println(val);
		
		List<MovieDTO> movieList = movieService.getSortMovies(val);
		
		return movieList;
	}
	
	
	
	
	
	
	
	
	
	
	// 영화 상세정보
	@GetMapping("/information")
	public String information(@RequestParam int num, Model model) {
		MovieDTO movieDTO = movieService.movieInfo(num);
		
		model.addAttribute("movieDTO", movieDTO);
		return "/movie/information";
	}
	
	
	
	


}
