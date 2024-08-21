package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.AnswerDAO;
import com.itwillbs.dao.OfteniqDAO;
import com.itwillbs.domain.AnswerDTO;
import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.OfteniqDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class OfteniqService {
	
	@Inject
	private OfteniqDAO ofteniqDAO ;
	
	public void insertOfteniq(OfteniqDTO ofteniqDTO) {
		
		if(ofteniqDAO.getMaxNum() == null) {
			//글이 없으면 글번호가 1번부터 시작
			ofteniqDTO.setOF_NUM("1");
		}else {
			//글이 있으면 max(num) + 1
			String num = Integer.toString(ofteniqDAO.getMaxNum() + 1);
			ofteniqDTO.setOF_NUM(num);
		}

		ofteniqDTO.setOF_DATE(new Timestamp(System.currentTimeMillis()));
		
		ofteniqDAO.insertOfteniq(ofteniqDTO);
	}//insertOfteniq
	
	public void updateOften(OfteniqDTO ofteniqDTO) { // 업데이트 메서드
		ofteniqDTO.setOF_DATE(new Timestamp(System.currentTimeMillis()));
		ofteniqDAO.updateOften(ofteniqDTO);
	}

	public void deleteoften(String num) {
		ofteniqDAO.deleteoften(num);
	}

	public List<Map<String, Object>> getOftenList(PageDTO pageDTO) {
		return ofteniqDAO.getOftenList(pageDTO);
	}
	
	public int getOftenCount(PageDTO pageDTO) {
		return ofteniqDAO.getOftenCount(pageDTO);
	}
	
	public Map<String, Object> getOften(Map<String, Object> param) {
		return ofteniqDAO.getOften(param);
	}
	
	public Map<String, Object> getOftenPrev(Map<String, Object> param) {
		return ofteniqDAO.getOftenPrev(param);
	}
	
	public Map<String, Object> getOftenNext(Map<String, Object> param) {
		return ofteniqDAO.getOftenNext(param);
	}
	
	
	

}
