package com.itwillbs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.print.DocFlavor.STRING;
import javax.xml.crypto.Data;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.expression.MapAccessor;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MovieDTO;

@Repository
public class MovieDAO {
	
	@Inject
	private SqlSession sqlsession;
	
	// 영화리스트
	public List<MovieDTO> getMovie() {
		return sqlsession.selectList("movieMapper.getMovie");
	}
	// 상영 예정작
//	public List<MovieDTO> getMovie2() {
//		List<MovieDTO> list = sqlsession.selectList("movieMapper.getMovie2");
//		return list;
//	}
	// 상영 예정작 개봉일 분류
	public List<LinkedHashMap<String, String>> getReleseDate() {
		return sqlsession.selectList("movieMapper.getReleseDate");
	}
	// 상영 예정작 top3
	public List<Map<String, String>> getTop3() {
		return sqlsession.selectList("movieMapper.getTop3");		
	}
	
	
	// 상영예정 영화 목록
	public List<Map<String, String>> getUpcomingMovies() {
		return sqlsession.selectList("movieMapper.getUpcomingMovies");
	}
	
	// 영화 정렬
	//예매
	public List<Map<String, Object>> getSortMovies1() {
		return sqlsession.selectList("movieMapper.getSortMovies1");
	}
	// 평점순 정렬
	public List<Map<String, Object>> getSortMovies2() {
		return sqlsession.selectList("movieMapper.getSortMovies2");
	}
	// 관람객순 정렬
	public List<Map<String, Object>> getSortMovies3() {
		return sqlsession.selectList("movieMapper.getSortMovies3");
	}
	
	
	
	
	
	
	// 영화 상세정보
	public MovieDTO movieInfo(int num) {
		return sqlsession.selectOne("movieMapper.movieInfo", num);
	}
	
	// 리뷰의 차트탭 데이터
	public Map<String, Object> pointChart(int MOVIE_NUM) {
		return sqlsession.selectOne("movieMapper.pointChart", MOVIE_NUM);
	}
	
	
	// 상영전
	public List<Map<String, String>> getRelMovies(int num) {
		return sqlsession.selectList("movieMapper.getRelMovies", num);
	}
	
	//광고 ifream
	public Map<String, String> getAdMovie() {
		return sqlsession.selectOne("movieMapper.getAdMovie");
	}
	
	
	
	//리뷰 작성한 유저 검색
	public String getReviewUser(Map<String, Object> data) {
		return sqlsession.selectOne("movieMapper.getReviewUser", data);
	}
	//평점(리뷰) 저장
	public Integer insertReview(Map<String, Object> data) {
		return sqlsession.insert("movieMapper.insertReview", data);
	}
	//리뷰 페이지 구하기
	public Integer getMaxPage(int num) {
		return sqlsession.selectOne("movieMapper.getMaxPage", num);
	}
	// 리뷰
	public ArrayList<Map<String, Object>> getReview(Map<String, Integer> rMap) {
		ArrayList<Map<String, Object>> reviewList =
				(ArrayList)sqlsession.selectList("movieMapper.getReview", rMap); 
		return reviewList;
	}
	
	
	// 추천 중복방지를 위한 유저정보 검색
	public Integer reUserCheck(Map<String, String> rMap) {
		return sqlsession.selectOne("movieMapper.reUserCheck", rMap);
	}
	// 추천 중복방지를 위한 유저정보 저장
	public void reUserinsert(Map<String, String> rMap) {
		sqlsession.insert("movieMapper.reUserinsert", rMap);
	}
	//리뷰 추천수 증가
	public void updateRecommend(Map<String, String> rMap) {
		sqlsession.selectOne("movieMapper.updateRecommend", rMap);
	}
	//증가한 리뷰추천값 반환
	public String getRecommend(Map<String, String> rMap) {
		return sqlsession.selectOne("movieMapper.getRecommend", rMap);
	}
	
	
	
	
	// ifream을 통한 영화 스케줄 구하기
	public List<Map<String, String>> getMovieSchedule(Map<String, String> rMap) {
		return sqlsession.selectList("movieMapper.getMovieSchedule", rMap);
	}
	
	// 영화번호, 지역, 날자를 통한 상영정보 구하기
	public List<Map<String, Object>> getThMovies(Map<String, String> rMap) {
		return sqlsession.selectList("movieMapper.getThMovies", rMap);
	}
	
	
	
	
	
	//채현 메인 상영예정 영화 디데이 리스트
	public List<Map<String, Object>> getMovie3() {
		return sqlsession.selectList("movieMapper.getMovie3");
	}

}
