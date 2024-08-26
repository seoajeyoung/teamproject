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
		
		sqlSession.insert(namespace + ".registerMember", memberDTO);
	}
	
	public Map<String, String> memberCheck(MemberDTO memberDTO) { // 아이디 비밀번호 일치하는지 select
		return sqlSession.selectOne(namespace + ".memberCheck", memberDTO);
	}

	public MemberDTO getMemberId(String member_id) { // 아이디값 존재하는지 select
		
		return sqlSession.selectOne(namespace + ".getMemberId", member_id);
	}
	
	public MemberDTO getMemberNickname(String member_nickname) { // 닉네임 존재하는지 select
		
		return sqlSession.selectOne(namespace + ".getMemberNickname", member_nickname);
	}

	public MemberDTO getMemberPhone(String member_phone) { // 핸드폰번호 존재하는지 select
		
		return sqlSession.selectOne(namespace + ".getMemberPhone", member_phone);
	}

	public void saveNaverNickname(MemberDTO existingMember) { // 네이버로 처음 로그인할시 닉네임 정하고 update
		
		sqlSession.update(namespace + ".saveNaverNickname", existingMember);
	}

	public MemberDTO findId(MemberDTO memberDTO) { // 아이디 조회 select
		
		return sqlSession.selectOne(namespace + ".findId", memberDTO);
	}

	public MemberDTO findPass(MemberDTO memberDTO) { // 비밀번호 select
		
		return sqlSession.selectOne(namespace + ".findPass", memberDTO);
	}

	public void getTempPass(String member_id, String tempPassword) { // 임시비밀번호로 update
		
		Map<String, String> params = new HashMap<String, String>();
	    params.put("member_id", member_id);
	    params.put("tempPassword", tempPassword);
		
		sqlSession.update(namespace + ".getTempPass", params);
	}

	public MemberDTO getMemberNum(String member_id) { // member_num 조회
		
		return sqlSession.selectOne(namespace + ".getMemberNum", member_id);
	}

	
	
	
}
