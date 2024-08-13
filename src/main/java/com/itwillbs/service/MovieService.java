package com.itwillbs.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MovieDAO;
import com.itwillbs.domain.MovieDTO;

@Service
public class MovieService {
	
	@Inject
	private MovieDAO movieDAO;
	
	// 영화 리스트
	public List<MovieDTO> getMovie(String page) {
		// page값이 있으면
		if(page != null && page.equals("")) {
			//상영 예정작
			return movieDAO.getMovie2();
		} else {
			return movieDAO.getMovie();
		}
	}
	
	// 상영 예정 영화의 상영일을 분류하기 위한 메서드
	public List<LinkedHashMap<String, String>> getReleseDate() {
		return movieDAO.getReleseDate();
	}
	// 상영 예정작 top3
	public List<MovieDTO> getTop3() {
		return movieDAO.getTop3();
	}
	
	
	
	
	
	// 상영중인 영화 리스트
	public List<MovieDTO> getShowMovies() {
		
		return movieDAO.getShowMovies();
	}
	
	
	
//	 영화 정렬
	public List<MovieDTO> getSortMovies(int val) {
		if(val == 1) {
			// 예매율
			return movieDAO.getSortMovies1();
		} else if (val == 2) {
			// 평점
			return movieDAO.getSortMovies2();
		} else {
			// 관람객
			return movieDAO.getSortMovies3();
		}
	}
	
	
	// 영화 상세정보
	public MovieDTO movieInfo(int num) {
		MovieDTO movieDTO = movieDAO.movieInfo(num);
		String str = "";
		
		if(movieDTO.getRating() != null) {
			str = movieDTO.getRating().equals("전체") ? "All" :
				 	     Integer.parseInt(movieDTO.getRating()) >= 18 ? "18" : movieDTO.getRating();
		}
		
		movieDTO.setRating(str);
		return movieDTO;
	}
	
	public List<Map<String, String>> getRelMovies(int num) {
		List<Map<String, String>> list = movieDAO.getRelMovies(num);
		for(Map<String, String> map : list) {
			Object rating = map.get("RATING");
			if(rating instanceof Integer) {
				rating = Integer.parseInt((String)rating) > 18 ? 18 : rating;
				map.put("RATING", (String)rating);
			}
		}
		return movieDAO.getRelMovies(num);
	}
	
	
	
	// 리뷰
	public ArrayList<Map<String, Object>> getReview(Map<String, Integer> rMap) {
		return movieDAO.getReview(rMap);
	}
	// 최대페이지 구하기
	public int getMaxPage(int num) {
		return movieDAO.getMaxPage(num);
	}
	
	// 리뷰 추천수 증가
	public String updateRecommend(Map<String, String> rMap) {
		return movieDAO.updateRecommend(rMap);
	}
	// 추천한 유저정보 검색
	public boolean reUserCheck(Map<String, String> rMap) {
		return movieDAO.reUserCheck(rMap);
	}
	// 추천한 유저정보 저장
	public void reUserinsert(Map<String, String> rMap) {
		movieDAO.reUserinsert(rMap);
	}
	

	
	

}
