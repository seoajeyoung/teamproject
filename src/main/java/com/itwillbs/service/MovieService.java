package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MovieDAO;
import com.itwillbs.domain.MovieDTO;

@Service
public class MovieService {
	
	@Inject
	private MovieDAO movieDAO;
	
	// 영화 리스트
	public List<MovieDTO> getMovie(Integer getPage) {
		// 상영 예정작 클릭시 page=2 넘겨받고 getPage 값이 2인지 판별해서
		// 2일시 현재 날짜보다 개봉일이 크면 조건을 붙이는 getMovie2 호출
		if(getPage == 2) {
			return movieDAO.getMovie2();
		} else {
			return movieDAO.getMovie();
		}
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
		return movieDAO.movieInfo(num);
	}
	

}
