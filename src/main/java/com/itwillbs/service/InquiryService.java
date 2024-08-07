package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

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
		System.out.println("InquiryService insertInquiry()");
		
		if(inquiryDAO.getMaxNum() == null) {
			//글이 없으면 글번호가 1번부터 시작
			inquiryDTO.setInquiry_num("1");
		}else {
			//글이 있으면 max(num) + 1
			String num = Integer.toString(inquiryDAO.getMaxNum() + 1);
			inquiryDTO.setInquiry_num(num);
		}

		inquiryDTO.setInquiry_date(new Timestamp(System.currentTimeMillis()));
		
		System.out.println(inquiryDTO);
		

//		inquiryDAO.insertInquiry(inquiryDTO);
	}//insertBoard
//	
	public List<InquiryDTO> getInquiryList(PageDTO pageDTO) {
		System.out.println("InquiryService getInquiryList()");
//		// 시작하는 행번호
		int startRow = (pageDTO.getCurrentPage() - 1)*pageDTO.getPageSize() + 1;
//		//끝나는 행번호
		int endRow = startRow + pageDTO.getPageSize() - 1;
//		//pageDTO 에 저장
//		// sql에서 사용할 구문 => limit startRow-1, pageSize 
		pageDTO.setStartRow(startRow-1); //sql구문에서 하기 힘드니까 미리 -1 하기
		pageDTO.setEndRow(endRow);
//		
		return inquiryDAO.getInquiryList(pageDTO);
	}
	
	public int getInquiryCount() {
		System.out.println("InquiryService getInquiryCount()");
		
		return inquiryDAO.getInquiryCount();
	}
	
	public InquiryDTO getInquiry(String num) {
		System.out.println("InquiryService getinquiry()");
		
		return inquiryDAO.getInquiry(num);
	}


	public void updateInquiry(InquiryDTO inquiryDTO) {
		System.out.println("InquiryService updateInquiry()");
		
		inquiryDAO.updateInquiry(inquiryDTO);
	}

	public void deleteInquiry(String num) {
		System.out.println("InquiryService deleteInquiry()");
		
		inquiryDAO.deleteInquiry(num);
	}

	

}//클래스
