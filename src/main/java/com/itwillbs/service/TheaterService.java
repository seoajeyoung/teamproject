package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.TheaterDAO;
import com.itwillbs.domain.TheaterDTO;

@Service
public class TheaterService {

	@Inject
	private TheaterDAO theaterDAO;
	
	
	public List<Map<String, Object>> getRegionList() {
		return theaterDAO.getRegionList();
	}
	
	
	public List<TheaterDTO> getAreaList() {
		return theaterDAO.getAreaList();
	}
	
	
	// 해당 극장의 상영일정이 있는 날자만
	public List<Map<String, String>> getRunningDate(int TH_NUM) {
		return theaterDAO.getRunningDate(TH_NUM);
	}
	
	
	// getRunningMovie(
	public List<Map<String, Object>> getRunningMovie(Map<String, String> rMap) {
		return theaterDAO.getRunningMovie(rMap);
		
	}
}	
