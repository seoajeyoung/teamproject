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
	public List<Map<String, Object>> getSortMovies(Map<String, String> rMap) {
		return sqlsession.selectList("movieMapper.getSortMovies", rMap);
	}
	
	
//	// 평점순 정렬
//	public List<Map<String, Object>> getSortMovies2() {
//		return sqlsession.selectList("movieMapper.getSortMovies2");
//	}
//	// 관람객순 정렬
//	public List<Map<String, Object>> getSortMovies3() {
//		return sqlsession.selectList("movieMapper.getSortMovies3");
//	}
	
	
	
	
	
	
	// 영화 상세정보
	public MovieDTO movieInfo(int num) {
		return sqlsession.selectOne("movieMapper.movieInfo", num);
	}
	
	// 북마크(찜하기)기능
	// 북마크 기록 검색
	public Integer getBookmark(Map<String, Object> rMap) {
		return sqlsession.selectOne("movieMapper.getBookmark", rMap);
	}
	public void insertBookmark(Map<String, Object> rMap) {
		sqlsession.insert("movieMapper.insertBookmark", rMap);
	}
	public Integer deleteBookmark(Map<String, Object> rMap) {
		return sqlsession.delete("movieMapper.deleteBookmark", rMap);
	}
	
	// 리뷰의 차트탭 데이터
	public Map<String, Object> pointChart(int MOVIE_NUM) {
		return sqlsession.selectOne("movieMapper.pointChart", MOVIE_NUM);
	}
	
	
	
	
	// 상영전
	public List<Map<String, Object>> getRelMovies(Map<String, Object> map) {
		return sqlsession.selectList("movieMapper.getRelMovies", map);
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
	public ArrayList<Map<String, Object>> getReview(Map<String, Object> rMap) {
		ArrayList<Map<String, Object>> reviewList =
				(ArrayList)sqlsession.selectList("movieMapper.getReview", rMap); 
		return reviewList;
	}
	
	
	// 추천 중복방지를 위한 유저정보 검색
	public Integer reUserCheck(Map<String, Object> rMap) {
		return sqlsession.selectOne("movieMapper.reUserCheck", rMap);
	}
	// 추천 중복방지를 위한 유저정보 저장
	public void reUserinsert(Map<String, Object> rMap) {
		sqlsession.insert("movieMapper.reUserinsert", rMap);
	}
	//리뷰 추천수 증가
	public void updateRecommend(Map<String,Object> rMap) {
		sqlsession.selectOne("movieMapper.updateRecommend", rMap);
	}
	//증가한 리뷰추천값 반환
	public String getRecommend(Map<String,Object> rMap) {
		return sqlsession.selectOne("movieMapper.getRecommend", rMap);
	}
	//리뷰 수정
	public Integer updateReview(Map<String, Object> rMap) {
		return sqlsession.update("movieMapper.updateReview", rMap);
	}
	// 리뷰 삭제
	public Integer deleteReview(Map<String, Object> rMap) {
		return sqlsession.delete("movieMapper.deleteReview", rMap);
	}
	
	
	
	
	// ifream을 통한 영화 스케줄 구하기
	public List<Map<String, String>> getMovieSchedule(Map<String, String> rMap) {
		return sqlsession.selectList("movieMapper.getMovieSchedule", rMap);
	}
	
	// 영화번호, 지역, 날자를 통한 상영정보 구하기
	public List<Map<String, Object>> getThMovies(Map<String, String> rMap) {
		return sqlsession.selectList("movieMapper.getThMovies", rMap);
	}
	
	
	// ================= 북마크 페이지 ==============
	
	public Map<String, Object> getMyMovieCount(String MEMBER_ID) {
		return sqlsession.selectOne("movieMapper.getMyMovieCount", MEMBER_ID);
	}
	
	public List<Map<String, Object>> getMyMovieList(Map<String, String> rMap) {
		return sqlsession.selectList("movieMapper.getMyMovieList", rMap);
	}
	
	
	
	
	
	//채현 메인 상영예정 영화 디데이 리스트
	public List<Map<String, Object>> getMovie3() {
		return sqlsession.selectList("movieMapper.getMovie3");
	}

}
