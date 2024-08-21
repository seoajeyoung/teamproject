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

	public MypageDTO getPointByMemberNum(String memberNum) {
		return sqlSession.selectOne(namespace + ".getPointByMemberNum", memberNum);
	}
	
	public String getPasswordByMemberId(String id) {
        return sqlSession.selectOne(namespace + ".getPasswordByMemberId", id);
    }

	public void updateMypage(MypageDTO mypageDTO) {
		sqlSession.update(namespace + ".updateMypage", mypageDTO);
	}

	public void updateMystatus(String id) {
		sqlSession.update(namespace + ".updateMystatus", id);		
	}
	
}
