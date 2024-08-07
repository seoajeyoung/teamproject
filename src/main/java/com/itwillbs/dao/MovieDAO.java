package com.itwillbs.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MovieDTO;

@Repository
public class MovieDAO {
	
	@Inject
	private SqlSession sqlsession;
	
	// 영화리스트
	public List<MovieDTO> getMovie() {
		return sqlsession.selectList("MovieMapper.getMovie");
	}
	// 상영 예정작
	public List<MovieDTO> getMovie2() {
		return sqlsession.selectList("MovieMapper.getMovie2");
	}
	
	// 상영중인 영화 목록
	public List<MovieDTO> getShowMovies() {
		
		return sqlsession.selectList("MovieMapper.getShowMovies");
	}
	
	// 영화 정렬
	public List<MovieDTO> getSortMovies1() {
		return sqlsession.selectList("MovieMapper.getSortMovies1");
	}
	public List<MovieDTO> getSortMovies2() {
		return sqlsession.selectList("MovieMapper.getSortMovies2");
	}
	public List<MovieDTO> getSortMovies3() {
		return sqlsession.selectList("MovieMapper.getSortMovies3");
	}
	
	
	
	
	
	
	
	public MovieDTO movieInfo(int num) {
		return sqlsession.selectOne("MovieMapper.movieInfo", num);
	}

}
