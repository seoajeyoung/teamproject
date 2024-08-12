package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.AdminDAO;
import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

@Service
public class AdminService {
	
	@Inject
	private AdminDAO adminDAO;
	
	public void registerMember(MemberDTO memberDTO) {
		
//		memberDTO.setMember_input(new Timestamp(System.currentTimeMillis()));
		
		adminDAO.registerMember(memberDTO);
	}
	
	public List<MemberDTO> getMemberList() {
		System.out.println("MemberService getMemberList()");
		
		return adminDAO.getMemberList();
	}

	public MemberDTO getMemberInfo(String member_id) {
		
		return adminDAO.getMemberInfo(member_id);
	}

	public List<MemberDTO> getGradeList() {

		return adminDAO.getGradeList();
	}

	public void updateMember(MemberDTO memberDTO) {
		
		adminDAO.updateMember(memberDTO);
	}

}
