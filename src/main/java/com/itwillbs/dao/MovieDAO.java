package com.itwillbs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.print.DocFlavor.STRING;

import org.apache.ibatis.session.SqlSession;
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
	public List<MovieDTO> getMovie2() {
		List<MovieDTO> list = sqlsession.selectList("movieMapper.getMovie2");
		return list;
	}
	// 상영 예정작 개봉일 분류
	public List<LinkedHashMap<String, String>> getReleseDate() {
		return sqlsession.selectList("movieMapper.getReleseDate");
	}
	// 상영 예정작 top3
	public List<MovieDTO> getTop3() {
		return sqlsession.selectList("movieMapper.getTop3");		
	}
	
	
	
	
	
	
	// 상영중인 영화 목록
	public List<MovieDTO> getShowMovies() {
		return sqlsession.selectList("movieMapper.getShowMovies");
	}
	
	// 영화 정렬
	//예매
	public List<MovieDTO> getSortMovies1() {
		return sqlsession.selectList("movieMapper.getSortMovies1");
	}
	// 평점
	public List<MovieDTO> getSortMovies2() {
		return sqlsession.selectList("movieMapper.getSortMovies2");
	}
	// 관람객
	public List<MovieDTO> getSortMovies3() {
		return sqlsession.selectList("movieMapper.getSortMovies3");
	}
	
	
	
	
	
	
	// 영화 상세정보
	public MovieDTO movieInfo(int num) {
		return sqlsession.selectOne("movieMapper.movieInfo", num);
	}
	public List<Map<String, String>> getRelMovies(int num) {
		return sqlsession.selectList("movieMapper.getRelMovies", num);
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
	public boolean reUserCheck(Map<String, String> rMap) {
		return sqlsession.selectOne("movieMapper.reUserCheck", rMap);
	}
	// 추천 중복방지를 위한 유저정보 저장
	public void reUserinsert(Map<String, String> rMap) {
		sqlsession.insert("movieMapper.reUserinsert", rMap);
	}
	//리뷰 추천수 증가
	public String updateRecommend(Map<String, String> rMap) {
		sqlsession.update("movieMapper.updateRecommend", rMap);
		return sqlsession.selectOne("movieMapper.getRecommend", rMap);
	}

}
