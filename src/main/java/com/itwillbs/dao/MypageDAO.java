package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MypageDTO;

@Repository
public class MypageDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.MypageMapper";

	public MypageDTO getMyInfo(String id) {
		return sqlSession.selectOne(namespace + ".getMyInfo", id);
	}

}
