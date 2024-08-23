package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.InquiryDAO;
import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.PageDTO;
//import com.itwillbs.domain.PageDTO;

@Service
public class InquiryService {
	
	//BoardDAO 객체생성
	@Inject
	private InquiryDAO inquiryDAO;
	
	public void insertInquiry(InquiryDTO inquiryDTO) {
		
		if(inquiryDAO.getMaxNum() == null) {
			//글이 없으면 글번호가 1번부터 시작
			inquiryDTO.setInquiry_num("1");
		}else {
			//글이 있으면 max(num) + 1
			String num = Integer.toString(inquiryDAO.getMaxNum() + 1);
			inquiryDTO.setInquiry_num(num);
		}

		inquiryDTO.setInquiry_date(new Timestamp(System.currentTimeMillis()));
		
		inquiryDAO.insertInquiry(inquiryDTO);
	}//insertBoard
//	
	public List<Map<String, Object>> getInquiryList(PageDTO pageDTO) {
//		// 시작하는 행번호
		int startRow = (pageDTO.getCurrentPage() - 1)*pageDTO.getPageSize() + 1;
//		//끝나는 행번호
		int endRow = startRow + pageDTO.getPageSize() - 1;
//		//pageDTO 에 저장
//		// sql에서 사용할 구문 => limit startRow-1, pageSize 
		pageDTO.setStartRow(startRow-1); //sql구문에서 하기 힘드니까 미리 -1 하기
		pageDTO.setEndRow(endRow);
		
		return inquiryDAO.getInquiryList(pageDTO);
	}
	
	public int getInquiryCount(PageDTO pageDTO) {
		
		return inquiryDAO.getInquiryCount(pageDTO);
	}
	
	public int getMyInquiryCount(Map<String, Object> params) {
		
		return inquiryDAO.getMyInquiryCount(params);
	}
	
	public Map<String, Object> getInquiry(String num) {
		return inquiryDAO.getInquiry(num);
	}
	
	public Map<String, Object> getInquiryPrev(Map<String, Object> param) {
		return inquiryDAO.getInquiryPrev(param);
	}
	
	public Map<String, Object> getInquiryNext(Map<String, Object> param) {
		return inquiryDAO.getInquiryNext(param);
	}
	
	public List<Map<String, Object>> getMyInquiryList(Map<String, Object> params) {
//		// 시작하는 행번호
		PageDTO pageDTO = (PageDTO) params.get("pageDTO");
		
		int startRow = (pageDTO.getCurrentPage() - 1)*pageDTO.getPageSize() + 1;
//		//끝나는 행번호
		int endRow = startRow + pageDTO.getPageSize() - 1;
//		//pageDTO 에 저장
//		// sql에서 사용할 구문 => limit startRow-1, pageSize 
		pageDTO.setStartRow(startRow-1); //sql구문에서 하기 힘드니까 미리 -1 하기
		pageDTO.setEndRow(endRow);
		params.put("pageDTO", pageDTO);
		return inquiryDAO.getMyInquiryList(params);
	}
	
	public Map<String, Object> getMyPrev(Map<String, Object> params) {
		return inquiryDAO.getMyPrev(params);
	}
	
	public Map<String, Object> getMyNext(Map<String, Object> params) {
		return inquiryDAO.getMyNext(params);
	}

	public void updateInquiry(InquiryDTO inquiryDTO) {
		inquiryDAO.updateInquiry(inquiryDTO);
	}

	public void deleteInquiry(String INQUIRY_NUM) {
		
		inquiryDAO.deleteInquiry(INQUIRY_NUM);
	}
	
	public List<Map<String, Object>> getAdminList(PageDTO pageDTO) {
		int startRow = (pageDTO.getCurrentPage() - 1)*pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow-1); //sql구문에서 하기 힘드니까 미리 -1 하기
		pageDTO.setEndRow(endRow);
		
		return inquiryDAO.getAdminList(pageDTO);
	}
	
	public int getAdminCount(PageDTO pageDTO) {
		return inquiryDAO.getAdminCount(pageDTO);
	}
	public List<Map<String, Object>> getAdminListF(PageDTO pageDTO) {
		//PageDTO pageDTO = (PageDTO) params.get("pageDTO");
		int startRow = (pageDTO.getCurrentPage() - 1)*pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow-1); //sql구문에서 하기 힘드니까 미리 -1 하기
		pageDTO.setEndRow(endRow);
		
		return inquiryDAO.getAdminListF(pageDTO);
	}
	public int getAdminCountF(PageDTO pageDTO) {
		return inquiryDAO.getAdminCountF(pageDTO);
	}
	public Map<String, Object> adminPrev(Map<String, Object> param) {
		return inquiryDAO.adminPrev(param);
	}
	public Map<String, Object> adminNext(Map<String, Object> param) {
		return inquiryDAO.adminNext(param);
	}
	public Map<String, Object> adminInquiry(String iNQUIRY_NUM) {
		return inquiryDAO.adminInquiry(iNQUIRY_NUM);
	}
	
	

}//클래스
