package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
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
	
	public List<String> getfavTheater(String MEM_ID) {
		String favTheater = theaterDAO.getfavTheater(MEM_ID);
		List<String> splitTH = new ArrayList<String>();
		if(favTheater != null) {
			String[] spStr = favTheater.split(",");
			splitTH = Arrays.asList(spStr);
		}
		return splitTH;
	}
	
	
	// 해당 극장의 상영일정이 있는 날자만
	public List<Map<String, String>> getRunningDate(Map<String, String> rMap) {
		return theaterDAO.getRunningDate(rMap);
	}
	
	// getRunningMovie(
	public List<Map<String, Object>> getRunningMovie(Map<String, String> rMap) {
		return theaterDAO.getRunningMovie(rMap);
		
	}
}	
