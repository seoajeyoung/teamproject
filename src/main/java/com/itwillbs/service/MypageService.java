package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MypageDAO;
import com.itwillbs.domain.MypageDTO;



@Service
public class MypageService {
	
	@Inject
	private MypageDAO mypageDAO;

	public MypageDTO getMyInfo(String id) {
		return mypageDAO.getMyInfo(id);
	}

	public MypageDTO getPointByMemberNum(String memberNum) {
		return mypageDAO.getPointByMemberNum(memberNum);
	}
	
//	public boolean checkPassword(String id, String originalPwd) {
//        String storedPassword = mypageDAO.getPasswordByMemberId(id);
//        return storedPassword != null && storedPassword.equals(originalPwd);
//    }
	
	public boolean checkPassword(String memberId, String originalPwd) {
	    String storedPassword = mypageDAO.getPasswordByMemberId(memberId);
	    
	    System.out.println("Stored password from DB: " + storedPassword);
	    System.out.println("Entered password: " + originalPwd);

	    return storedPassword != null && storedPassword.equals(originalPwd);
	}

	public void updateMypage(MypageDTO mypageDTO) {
		mypageDAO.updateMypage(mypageDTO);
	}

	public void updateMystatus(String id) {
		mypageDAO.updateMystatus(id);		
	}
	

}
