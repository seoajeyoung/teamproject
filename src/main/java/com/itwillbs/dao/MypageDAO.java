package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

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

	public List<MypageDTO> getMyBookingList(Map<String, Object> paramMap) {
	    return sqlSession.selectList(namespace + ".getMyBookingList", paramMap);
	    
	}

	public MypageDTO getMyBookingInfo(String tp_NUM) {

		return sqlSession.selectOne(namespace + ".getMyBookingInfo", tp_NUM);
	}

	public int getMemberNumByMemberId(String id) {

		return sqlSession.selectOne(namespace + ".getMemberNumByMemberId", id);
	}

	public int getBoardCount(Map<String, Object> paramMap) {
	    return sqlSession.selectOne(namespace + ".getBoardCount", paramMap);
	}

	public List<MypageDTO> getMyStorePaymentList(Map<String, Object> paramMap) {
		return sqlSession.selectList(namespace + ".getMyStorePaymentList", paramMap);
	}
	
	public int getStoreBoardCount(Map<String, Object> paramMap) {
	    return sqlSession.selectOne(namespace + ".getStoreBoardCount", paramMap);
	}

	public MypageDTO getMyStorePaymentInfo(String sp_num) {
		return sqlSession.selectOne(namespace + ".getMyStorePaymentInfo", sp_num);
	}

}
