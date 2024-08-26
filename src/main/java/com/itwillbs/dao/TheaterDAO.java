package com.itwillbs.dao;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.TheaterDTO;

@Repository
public class TheaterDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.TheaterMapper.";
	
	public List<Map<String, Object>> getRegionList() {
		return sqlSession.selectList(namespace + "getRegionList");
	}
	
	public List<TheaterDTO> getAreaList() {
		return sqlSession.selectList(namespace + "getAreaList");
	}
	
	// 선호하는 극장
	public String getfavTheater(String MEM_ID) {
		return sqlSession.selectOne(namespace+"getfavTheater", MEM_ID);
	}
	
	
	//ajax로 해당 극장의 모든 영화 상영일만 중복없이 받아오기
	public List<Map<String, String>> getRunningDate(Map<String, String> rMap) {
		List<Map<String, String>> list = sqlSession.selectList(namespace + "getRunningDate", rMap);
		System.out.println(list);
		return list; 
	}
	
	
	//상영일자에 맞는 영화값 받아오기
	public List<Map<String, Object>> getRunningMovie(Map<String, String> rMap) {
		return sqlSession.selectList(namespace + "getRunningMovie", rMap);
	}

	
}	