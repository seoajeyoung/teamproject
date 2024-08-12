package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.AnswerDAO;
import com.itwillbs.domain.AnswerDTO;
import com.itwillbs.domain.InquiryDTO;

@Service
public class AnswerService {
	
	@Inject
	private AnswerDAO answerDAO;
	
	public void insertAnswer(AnswerDTO answerDTO) {
		
		if(answerDAO.getMaxNum() == null) {
			//글이 없으면 글번호가 1번부터 시작
			answerDTO.setAS_NUM("1");
		}else {
			//글이 있으면 max(num) + 1
			String num = Integer.toString(answerDAO.getMaxNum() + 1);
			answerDTO.setAS_NUM(num);
		}

		answerDTO.setAS_DATE(new Timestamp(System.currentTimeMillis()));
		
		answerDAO.insertAnswer(answerDTO);
	}//insertBoard
	
	public void updateAnswer(AnswerDTO answerDTO) { // 업데이트 메서드
		answerDTO.setAS_DATE(new Timestamp(System.currentTimeMillis()));
		answerDAO.updateAnswer(answerDTO);
	}

	public void deleteAs(String AS_NUM) {
		answerDAO.deleteAs(AS_NUM);
	}
	

}
