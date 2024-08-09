package com.itwillbs.dao;

import java.util.HashMap;
import java.util.Map;

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

	public MemberDTO getMemberPhone(String member_phone) {
		System.out.println("MemberDAO getMemberPhone()");
		
		return sqlSession.selectOne(namespace + ".getMemberPhone", member_phone);
	}

	public void saveNaverNickname(MemberDTO existingMember) {
		System.out.println("MemberDAO saveNaverNickname()");
		
		sqlSession.update(namespace + ".saveNaverNickname", existingMember);
	}

	public MemberDTO findId(MemberDTO memberDTO) {
		System.out.println("MemberDAO findId()");
		
		return sqlSession.selectOne(namespace + ".findId", memberDTO);
	}

	public MemberDTO findPass(MemberDTO memberDTO) {
		System.out.println("MemberDAO findPass()");
		
		return sqlSession.selectOne(namespace + ".findPass", memberDTO);
	}

	public void getTempPass(String member_id, String tempPassword) {
		System.out.println("MemberDAO getTempPass()");
		
		Map<String, String> params = new HashMap<String, String>();
	    params.put("member_id", member_id);
	    params.put("tempPassword", tempPassword);
		
		sqlSession.update(namespace + ".getTempPass", params);
	}

	
	
	
}
