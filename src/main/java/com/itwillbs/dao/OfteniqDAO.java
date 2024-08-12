package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.AnswerDTO;
import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.OfteniqDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class OfteniqDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.OfteniqMapper";
	
	
	public void insertOfteniq(OfteniqDTO ofteniqDTO) {
		sqlSession.insert(namespace + ".insertOfteniq", ofteniqDTO);
	}

	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}
	
	public void updateOften(OfteniqDTO ofteniqDTO) {
		sqlSession.update(namespace + ".updateOften", ofteniqDTO);
	}

	public void deleteoften(String num) {
		sqlSession.delete(namespace + ".deleteoften", num);
	}

	public List<Map<String, Object>> getOftenList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getOftenList", pageDTO);
	}
	
	public int getOftenCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getOftenCount", pageDTO);
	}
	
	public Map<String, Object> getOften(String num) {
		return sqlSession.selectOne(namespace + ".getOften", num);
	}

	public Map<String, Object> getOftenPrev(String num) {
		return sqlSession.selectOne(namespace + ".getOftenPrev", num);
	}

	public Map<String, Object> getOftenNext(String num) {
		return sqlSession.selectOne(namespace + ".getOftenNext", num);
	}
	

	
}
