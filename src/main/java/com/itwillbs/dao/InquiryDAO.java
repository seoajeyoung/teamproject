package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.PageDTO;
//import com.itwillbs.domain.PageDTO;

@Repository
public class InquiryDAO {
	
	//마이바티스 객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.inquiryMapper";
	

	public void insertInquiry(InquiryDTO inquiryDTO) {
		sqlSession.insert(namespace + ".insertInquiry", inquiryDTO);
	}
	
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}
	
	public List<Map<String, Object>> getInquiryList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getInquiryList", pageDTO);
	} 
	
	public int getInquiryCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getInquiryCount", pageDTO);
	}
	
	public int getMyInquiryCount(Map<String, Object> params) {
		return sqlSession.selectOne(namespace + ".getMyInquiryCount", params);
	}
	 
	public Map<String, Object> getInquiry(String num) {
		return sqlSession.selectOne(namespace + ".getInquiry", num);
	}	
	
	public Map<String, Object> getInquiryPrev(Map<String, Object> param) {
		return sqlSession.selectOne(namespace + ".getInquiryPrev", param);
	}
	
	public Map<String, Object> getInquiryNext(Map<String, Object> param) {
		return sqlSession.selectOne(namespace + ".getInquiryNext", param);
	}
	
	public List<Map<String, Object>> getMyInquiryList(Map<String, Object> params) {
		return sqlSession.selectList(namespace + ".getMyInquiryList", params);
	}
	
	public Map<String, Object> getMyPrev(Map<String, Object> params) {;
		return sqlSession.selectOne(namespace + ".getMyPrev", params);
	}
	
	public Map<String, Object> getMyNext(Map<String, Object> params) {
		return sqlSession.selectOne(namespace + ".getMyNext", params);
	}

	public void updateInquiry(InquiryDTO inquiryDTO) {
		sqlSession.update(namespace + ".updateInquiry", inquiryDTO);
	}

	public void deleteInquiry(String INQUIRY_NUM) {
		sqlSession.delete(namespace + ".deleteInquiry", INQUIRY_NUM);
	}

	public List<Map<String, Object>> getAdminList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getAdminList", pageDTO);
	}
	
	public int getAdminCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getAdminCount", pageDTO);
	}

	public List<Map<String, Object>> getAdminListF(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getAdminListF", pageDTO);
	}

	public int getAdminCountF(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getAdminCountF", pageDTO);
	}

	public Map<String, Object> adminPrev(Map<String, Object> param) {
		return sqlSession.selectOne(namespace + ".adminPrev", param);
	}

	public Map<String, Object> adminNext(Map<String, Object> param) {
		return sqlSession.selectOne(namespace + ".adminNext", param);
	}

	public Map<String, Object> adminInquiry(String iNQUIRY_NUM) {
		return sqlSession.selectOne(namespace + ".adminInquiry", iNQUIRY_NUM);
	}

	

	



}
