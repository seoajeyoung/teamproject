package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.AnswerDTO;
import com.itwillbs.domain.InquiryDTO;

@Repository
public class AnswerDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.AnswerMapper";
	
	
	public void insertAnswer(AnswerDTO answerDTO) {
		sqlSession.insert(namespace + ".insertAnswer", answerDTO);
	}

	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}
	
	public void updateAnswer(AnswerDTO answerDTO) {
		sqlSession.update(namespace + ".updateAnswer", answerDTO);
	}

	public void deleteAs(String AS_NUM) {
		sqlSession.delete(namespace + ".deleteAs", AS_NUM);
		
	}
	
}
