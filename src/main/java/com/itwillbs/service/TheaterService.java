package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.dao.TheaterDAO;
import com.itwillbs.domain.TheaterDTO;

@Service
public class TheaterService {

	@Inject
	private TheaterDAO theaterDAO;
	
	
	public List<Map<String, Object>> getRegionList() {
		return theaterDAO.getRegionList();
	}
	
	public List<Map<String, Object>> getAreaList(Map<String, String> rMap) {
		return theaterDAO.getAreaList(rMap);
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
	// 선호 극장 업데이트
	public boolean updateFavTheater(List<String> favTh, Map<String, Object> rMap) {
		String thName = (String) rMap.get("TH_NAME");
		String deleteName = (String) rMap.get("DELETE_TH");
		
		Set<String> updateTh = new LinkedHashSet<String>();
		
		if(thName != null) {
			updateTh = new LinkedHashSet<String>(favTh);
			updateTh.add((String)rMap.get("TH_NAME"));
		} else if(deleteName != null) {
			String[] str = deleteName.split(",");
			updateTh = new LinkedHashSet<String>(Arrays.asList(str));
		}
			
		updateTh.removeIf(String::isBlank);
		if(updateTh.size() > 5) return true;
		
		String setStr = updateTh.stream().collect(Collectors.joining(","));
		
		rMap.put("FAV_THEATER", setStr);
		theaterDAO.updateFavTheater(rMap);
		
		return false;
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
