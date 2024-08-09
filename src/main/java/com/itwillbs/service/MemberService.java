package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

@Service
public class MemberService {
	
	@Inject
	private MemberDAO memberDAO;

	public void registerMember(MemberDTO memberDTO) { // 회원가입 진행 -> memberDAO.reigerMember 실행
		System.out.println("MemberService registerMember()");
		
		memberDAO.registerMember(memberDTO);
	}

	public MemberDTO getMemberId(String member_id) { // 아이디값 조회 -> memberDAO.getMemberId 실행
		System.out.println("MemberService getMemberId()");
		
		return memberDAO.getMemberId(member_id);
	}
	
	public MemberDTO getMemberNickname(String member_nickname) { // 닉네임값 조회 -> memberDAO.getMemberNickname 실행
		System.out.println("MemberService getMemberNickname()");
		
		return memberDAO.getMemberNickname(member_nickname);
	}

	public MemberDTO memberCheck(MemberDTO memberDTO) { // 아이디 비밀번호 일치 조회 -> memberDAO.memberCHeck 실행
		System.out.println("MemberService getMember()");
		
		return memberDAO.memberCheck(memberDTO);
	}

	public MemberDTO getMemberPhone(String member_phone) { // 닉네임값 조회 -> memberDAO.getMemberNickname 실행
		System.out.println("MemberService getMemberPhone()");
		
		return memberDAO.getMemberPhone(member_phone);
	}

	public void saveNaverNickname(MemberDTO existingMember) {
		System.out.println("MemberService saveNaverNickname()");
		
		memberDAO.saveNaverNickname(existingMember);
		
	}

	public MemberDTO findId(MemberDTO memberDTO) {
		System.out.println("MemberService findId()");
		
		return memberDAO.findId(memberDTO);
	}

	public MemberDTO findPass(MemberDTO memberDTO) {
		System.out.println("MemberService findPass()");
		
		return memberDAO.findPass(memberDTO);
	}

	public void getTempPass(String member_id, String tempPassword) {
		System.out.println("MemberService getTempPass()");
		
		memberDAO.getTempPass(member_id, tempPassword);
	}
	
	
	
	

}
