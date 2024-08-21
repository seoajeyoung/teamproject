package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class TicketDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.TicketMapper";

	public List<Map<String, Object>> selectMovieList(Map<String, String> param) {
		return sqlSession.selectList(namespace + ".selectMovieList" , param);
	}

	public List<Map<String, Object>> selectTheaterList(Map<String, String> param) {
		
		return sqlSession.selectList(namespace + ".selectTheaterList", param);
	}

	public List<Map<String, Object>> selectTh_nameList(Map<String, String> param) {
		
		return sqlSession.selectList(namespace + ".selectTh_nameList", param);
	}

	public List<Map<String, Object>> selectMtime(Map<String, Object> param) {
		
		return sqlSession.selectList(namespace + ".selectMtime", param);
	}

	public List<Map<String, Object>> selectMcinema(Map<String, Object> param) {
		
		return sqlSession.selectList(namespace + ".selectMcinema", param);
	}

	public List<Map<String, Object>> selectUpdateTh_nameList(Map<String, String> param) {
		
		return sqlSession.selectList(namespace + ".selectUpdateTh_nameList", param);
	}

	public List<Map<String, Object>> selectupdate_movie(Map<String, String> param) {
		
		return sqlSession.selectList(namespace + ".selectupdate_movie", param);
	}

	public List<Map<String, Object>> selectupdate_time(Map<String, String> param) {
		
		return sqlSession.selectList(namespace +".selectupdate_time", param);
	}

	public List<Map<String, Object>> modalth_region() {
		return sqlSession.selectList(namespace + ".modalth_region");
	}

	public List<Map<String, String>> getth_name(Map<String, Object> param) {
		return sqlSession.selectList(namespace + ".getth_name", param);
	}

	public List<Map<String, String>> getci_number(Map<String, Object> param) {
		return sqlSession.selectList(namespace + ".getci_number", param);
	}

	public void insertseat(Map<String, Object> request) {
		sqlSession.insert(namespace +".insertseat", request);
	}

	public List<Map<String, String>> selectsaveseat(Map<String, Object> param) {
		return sqlSession.selectList(namespace + ".selectsaveseat", param);
	}

	public List<Map<String, Object>> selectSecount(Map<String, Object> param) {
		return sqlSession.selectList(namespace + ".selectSecount", param);
	}

	public List<Map<String, String>> selectloadseat(Map<String, Object> param) {
		return sqlSession.selectList(namespace + ".selectloadseat", param);
	}

	public void insertselectseat(Map<String, Object> request) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insertselectseat", request);
	}

	public int checkseat(Map<String, Object> request) {
		return sqlSession.selectOne(namespace +".checkseat", request);
	}

	public void deleteseat(Map<String, Object> request) {
		sqlSession.delete(namespace + ".deleteseat", request);
	}

	public List<Map<String, String>> selectpaymentseat(Map<String, Object> param) {
		return sqlSession.selectList(namespace +".selectpaymentseat", param);
	}

}

