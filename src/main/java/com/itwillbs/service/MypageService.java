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
	
	

}
