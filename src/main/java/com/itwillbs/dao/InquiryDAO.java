package com.itwillbs.dao;

import java.util.List;

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
	
	private static final String namespace = "com.itwillbs.mappers.InquiryMapper";
	

	public void insertInquiry(InquiryDTO inquiryDTO) {
		System.out.println("InquiryDAO insertInquiry()");
		sqlSession.insert(namespace + ".insertInquiry", inquiryDTO);
		
	}
	
	public Integer getMaxNum() {
		System.out.println("InquiryDAO getMaxNum");
		
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}
	
	public List<InquiryDTO> getInquiryList(PageDTO pageDTO) {
		System.out.println("InquiryDAO getInquiryList()");
		
		return sqlSession.selectList(namespace + ".getInquiryList", pageDTO);
	} 
	
	public int getInquiryCount() {
		System.out.println("InquiryDAO getInquiryCount()");
		
		return sqlSession.selectOne(namespace + ".getInquiryCount");
	}
	public InquiryDTO getInquiry(String num) {
		System.out.println("InquiryDAO getBoard()");
		
		return sqlSession.selectOne(namespace + ".getBoard", num);
	}	

	public void updateInquiry(InquiryDTO inquiryDTO) {
		System.out.println("InquiryDAO updateboard()");
		
		sqlSession.update(namespace + ".updateInquiry", inquiryDTO);
	}

	public void deleteInquiry(String num) {
		System.out.println("InquiryDAO delete()");
		
		sqlSession.delete(namespace + ".deleteInquiry", num);
	}



}
