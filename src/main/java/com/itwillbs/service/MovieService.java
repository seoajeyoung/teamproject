package com.itwillbs.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;

import javax.inject.Inject;
import javax.print.DocFlavor.READER;
import javax.print.DocFlavor.STRING;
import javax.xml.crypto.Data;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MovieDAO;
import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.MovieDTO;

@Service
public class MovieService {
	
	@Inject
	private MovieDAO movieDAO;
	
	// 영화 리스트
	public List<MovieDTO> getMovie() {
		return movieDAO.getMovie();
	}
	
	// 상영 예정 영화의 상영일을 분류하기 위한 메서드
	public List<LinkedHashMap<String, String>> getReleseDate() {
		return movieDAO.getReleseDate();
	}
	// 상영 예정작 top3
	public List<Map<String, Object>> getTop3() {
		return movieDAO.getTop3();
	}
	
	
	
	
	
	// 상예정인 영화 리스트
	public List<Map<String, Object>> getUpcomingMovies() {
		return movieDAO.getUpcomingMovies();
	}
	
	
	
//	 영화 정렬
	public List<Map<String, Object>> getSortMovies(Map<String, String> rMap) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		list = movieDAO.getSortMovies(rMap);
//		switch (val) {
//			case 1: list = movieDAO.getSortMovies();
//				break;
//			case 2: list = movieDAO.getSortMovies2();
//				break;
//			case 3: list = movieDAO.getSortMovies3();
//				break;
//		}
		
		return list;
	}
	
	// 영화 상세정보
	public Map<String, Object> movieInfo(int num) {
		Map<String, Object> movieDTO = movieDAO.movieInfo(num);
		String actor = (String)movieDTO.get("ACTORNM");
		String[] str = actor.split(",");
		if(str.length >= 10) {
			actor = str[0]; 
			for(int i = 1; i < 10; i++) {
				actor += ", " + str[i];
			}
		}
		movieDTO.put("ACTORNM", actor);
		return movieDTO;
	}
	// 성비, 연령 차트 데이터
	public Map<String, Object> getChartData(int num) {
		return movieDAO.getChartData(num);
	}
	// 관람여부 확인
	public boolean getShowCheck(Map<String, Object> rMap) {
		return movieDAO.getShowCheck(rMap) != null ? movieDAO.getShowCheck(rMap) : false;
	}
	
	
	
	// 북마크(찜하기)기록 검색
	public boolean getBookmark(Map<String, Object> rMap) {
		return movieDAO.getBookmark(rMap) == 1 ? true : false;
	}
	//북마크 기록 저장
	public void insertBookmark(Map<String, Object> rMap) {
		movieDAO.insertBookmark(rMap);
	}
	// 북마크 기록 삭제
	public boolean deleteBookmark(Map<String, Object> rMap) {
		return movieDAO.deleteBookmark(rMap) == 1 ? true : false;
	}
	
	
	
	
	
	//광고페이지
	public Map<String, String> getAdMovie() {
		return movieDAO.getAdMovie();
	}
	
	//포인트 차트 데이터
	public Map<String, Object> pointChart(int MOVIE_NUM) {
		return movieDAO.pointChart(MOVIE_NUM);
	}
	
	//상영예정영화 페이지
	public List<Map<String, Object>> getRelMovies(Map<String, Object> map) {
		List<Map<String, Object>> list = movieDAO.getRelMovies(map);
		for(Map<String, Object> data : list) {
			Object rating = data.get("RATING");
			if(rating instanceof Integer) {
				rating = Integer.parseInt((String)rating) > 18 ? 18 : rating;
				data.put("RATING", (String)rating);
			} else if(rating instanceof String) {
				rating = rating.equals("청소") ? 18 : rating;
			}
		}
		return movieDAO.getRelMovies(map);
	}
	
	
	
	// ==================================== 리뷰 ==================================
	// 해당 영화에 유저의 리뷰가 있는지 검색
	public boolean getReviewUser(Map<String, Object> data) {
		String str = movieDAO.getReviewUser(data);
		boolean result = str == null ? false : true;
		return result;
	}
	//평점(리뷰)저장
	public boolean insertReview(Map<String, Object> data) {
		boolean result = movieDAO.insertReview(data) == 1 ? true : false;
		return result;
	}
	
	// 리뷰값 구하기
	public ArrayList<Map<String, Object>> getReview(Map<String, Object> rMap) {
		return movieDAO.getReview(rMap);
	}
	// 최대페이지 구하기
	public int getMaxPage(int num) {
		return movieDAO.getMaxPage(num);
	}
	
	// 추천한 유저정보 검색
	public boolean reUserCheck(Map<String, Object> rMap) {
		if(rMap.get("MEMBER_ID") == null && rMap.get("MEMBER_ID").equals("")) return false;
		boolean result = movieDAO.reUserCheck(rMap) == 0 ? true : false;
		return result;
	}
	// 추천한 유저정보 저장 + 해당 리뷰 추천수 업데이트 갱신된 추천값 반환
	public String reUserinsert(Map<String, Object> rMap) {
		movieDAO.reUserinsert(rMap);
		movieDAO.updateRecommend(rMap);
		return movieDAO.getRecommend(rMap);
	}
	// 리뷰 수정
	public boolean updateReview(Map<String, Object> rMap) {
		boolean result = movieDAO.updateReview(rMap) == 1 ? true : false;
		return result;
	}
	// 리뷰 삭제
	public boolean deleteReview(Map<String, Object> rMap) {
		return movieDAO.deleteReview(rMap) == 1 ? true : false;
	}
	
	
	
	
	
	// ================================== 상영시간표 ================================
	// -------- 영화 상영시각구하기 -------
	public List<Map<String, String>> getMovieSchedule(Map<String, String> rMap) {
		return movieDAO.getMovieSchedule(rMap);
	}
	
	// 영화번호, 상영시각, 지역을 통해 현재 상영일정이 있는 모든 지역구하기 
	public List<Map<String, Object>> getThMovies(Map<String, String> rMap) {
		List<Map<String, Object>> list =  movieDAO.getThMovies(rMap);
		return list; 
	}
	
	
	// ================================== 북마크 페이지 ==============================
	
	public Map<String, Object> getMyMovieCount(String MEMBER_ID) {
		return movieDAO.getMyMovieCount(MEMBER_ID);
	}
	
	public List<Map<String, Object>> getMyMovieList(Map<String, String> rMap) {
		return movieDAO.getMyMovieList(rMap);
	}

	

	
	

}
