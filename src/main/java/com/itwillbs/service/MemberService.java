package com.itwillbs.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

@Service
public class MemberService {
	
	@Inject
	private MemberDAO memberDAO;

	public void registerMember(MemberDTO memberDTO) { // 회원가입 진행 -> memberDAO.reigerMember 실행
		
		memberDAO.registerMember(memberDTO);
	}

	public MemberDTO getMemberId(String member_id) { // 아이디값 조회 -> memberDAO.getMemberId 실행
		
		return memberDAO.getMemberId(member_id);
	}
	
	public MemberDTO getMemberNickname(String member_nickname) { // 닉네임값 조회 -> memberDAO.getMemberNickname 실행
		
		return memberDAO.getMemberNickname(member_nickname);
	}

	public Map<String, String> memberCheck(MemberDTO memberDTO) { // 아이디 비밀번호 일치 조회 -> memberDAO.memberCHeck 실행
		
		return memberDAO.memberCheck(memberDTO);
	}

	public MemberDTO getMemberPhone(String member_phone) { // 핸드폰번호 조회 -> memberDAO.getMemberPhone 실행
		
		return memberDAO.getMemberPhone(member_phone);
	}

	public void saveNaverNickname(MemberDTO existingMember) {
		
		memberDAO.saveNaverNickname(existingMember);
		
	}

	public MemberDTO findId(MemberDTO memberDTO) {
		
		return memberDAO.findId(memberDTO);
	}

	public MemberDTO findPass(MemberDTO memberDTO) {
		
		return memberDAO.findPass(memberDTO);
	}

	public void getTempPass(String member_id, String tempPassword) {
		
		memberDAO.getTempPass(member_id, tempPassword);
	}

	public MemberDTO getMemberNum(String member_id) {
		
		return memberDAO.getMemberNum(member_id);
	}

	public Map<String, String> getNaverMemberNum(String member_id) {
		
		return memberDAO.getNaverMemberNum(member_id);
	}
	
	
	
	

}
