package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.memberMapper";

	public void registerMember(MemberDTO memberDTO) { // 회원가입 버튼 눌렀을 때 정보 insert
		System.out.println("MemberDAO registerMember()");
		
		sqlSession.insert(namespace + ".registerMember", memberDTO);
	}
	
	public MemberDTO memberCheck(MemberDTO memberDTO) { // 아이디 비밀번호 일치하는지 select
		System.out.println("MemberDAO memberCheck()");
		
		return sqlSession.selectOne(namespace + ".memberCheck", memberDTO);
	}

	public MemberDTO getMemberId(String member_id) { // 아이디값 일치하는지 selelct
		System.out.println("MemberDAO getMemberId()");
		
		return sqlSession.selectOne(namespace + ".getMemberId", member_id);
	}
	
	public MemberDTO getMemberNickname(String member_nickname) { // 닉네임 일치하는지 selelct
		System.out.println("MemberDAO getMemberNickname()");
		
		return sqlSession.selectOne(namespace + ".getMemberNickname", member_nickname);
	}

	
	
	
}
