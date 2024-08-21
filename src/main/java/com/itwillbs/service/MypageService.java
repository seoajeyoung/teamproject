package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MypageDAO;
import com.itwillbs.domain.MypageDTO;
import com.itwillbs.domain.PageDTO;

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

	public List<MypageDTO> getMyBookingList(Map<String, Object> paramMap) {
	    PageDTO pageDTO = (PageDTO) paramMap.get("pageDTO");

	    int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
	    int endRow = startRow + pageDTO.getPageSize() - 1;

	    pageDTO.setStartRow(startRow-1); 
	    pageDTO.setEndRow(endRow);
	    
	    System.out.println("Start Row: " + pageDTO.getStartRow());
	    System.out.println("Page Size: " + pageDTO.getPageSize()); 

	    paramMap.put("pageDTO", pageDTO);

	    return mypageDAO.getMyBookingList(paramMap);
	}

	public MypageDTO getMyBookingInfo(String tp_NUM) {

		return mypageDAO.getMyBookingInfo(tp_NUM);
	}

	public int getMemberNumByMemberId(String id) {
		return mypageDAO.getMemberNumByMemberId(id);
	}

	public int getBoardCount(Map<String, Object> paramMap) {
	    return mypageDAO.getBoardCount(paramMap);
	}

}
