package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.NewsDTO;
import com.itwillbs.domain.PageDTO;


@Repository
public class NewsDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.NewsMapper";
	
	
	public void insertNews(NewsDTO newsDTO) {
		sqlSession.insert(namespace + ".insertNews", newsDTO);
	}

	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}
	
	public List<Map<String, Object>> getNewsList(Map<String, String> param) {
		return sqlSession.selectList(namespace + ".getNewsList", param);
	}
	
	public void updateNews(NewsDTO newsDTO) {
		sqlSession.update(namespace + ".updateNews", newsDTO);
	}

	public void deleteNews(String NEWS_NUM) {
		sqlSession.delete(namespace + ".deleteNews", NEWS_NUM);
		
	}

	public int getNewsCount(Map<String, String> param) {
		return sqlSession.selectOne(namespace + ".getNewsCount", param);
	}
	
	public Map<String, Object> getNews(String num) {
		return sqlSession.selectOne(namespace + ".getNews", num);
	}	
	
	public Map<String, Object> getNewsPrev(String num) {
		return sqlSession.selectOne(namespace + ".getNewsPrev", num);
	}
	
	public Map<String, Object> getNewsNext(String num) {
		return sqlSession.selectOne(namespace + ".getNewsNext", num);
	}


//	public List<Map<String, Object>> getNewsSection(Map<String, Object> param) {
//		return sqlSession.selectList(namespace + ".getNewsSection", param);
//	}
	
}
