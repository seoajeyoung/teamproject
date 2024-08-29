package com.itwillbs.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.TheaterDTO;
import com.itwillbs.service.TheaterService;

@Controller
@RequestMapping("/theater/*")
public class TheaterController {

@Inject
private TheaterService theaterService;

	@GetMapping("/theater")
    public String theaterPage(Model model, HttpSession session) {
	 	//지역 조회
		List<Map<String, Object>> regionList = theaterService.getRegionList();
		
		String id = (String)session.getAttribute("member_id");
		if(id != null) {
			List<String> favTh = theaterService.getfavTheater(id);
			model.addAttribute("favTheater", favTh);
		}
		
		// 모델에 추가
    	model.addAttribute("regionList", regionList);
    
    	return "theater/theater";
	}
	
	
	@GetMapping("/getArea")
	@ResponseBody
	public List<Map<String, Object>> getArea(@RequestParam Map<String, String> rMap) {
		return theaterService.getAreaList(rMap);
	}
	
	// runningDate
	// 극장별 상영날짜 구하는 ajax
	@GetMapping("/runningDate")
	@ResponseBody
	public List<Map<String, String>> runningDate(@RequestParam Map<String, String> rMap) {
		// thName 전달
		List<Map<String, String>> date = theaterService.getRunningDate(rMap);
		return date;
	}
	
	// runningMovie
	@GetMapping("/runningMovie")
	@ResponseBody
	public List<Map<String, Object>> runningMovie(@RequestParam Map<String, String> rMap) {
		List<Map<String, Object>> list = theaterService.getRunningMovie(rMap);
		return list;
	}
	
	
	
	// myFavTheater 내 극장 저장
	@PostMapping("/myFavTheater")
	@ResponseBody
	public ResponseEntity<String> myFavTheater(@RequestParam Map<String, Object> rMap) {
		List<String> favTh = new ArrayList<String>();
		favTh = theaterService.getfavTheater((String)rMap.get("MEM_ID"));
		
		if(favTh.contains(rMap.get("TH_NAME"))) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("notUpdate");
		}
		
		boolean result = false;
		result = theaterService.updateFavTheater(favTh, rMap);
		
		if(result) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("sizeOver");
		}
		return ResponseEntity.ok("success");
	}
	
	
        

}