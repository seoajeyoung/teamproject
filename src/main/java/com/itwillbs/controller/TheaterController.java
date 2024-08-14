package com.itwillbs.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
    public String theaterPage(Model model) {
	 	//지역 조회
		List<Map<String, Object>> regionList = theaterService.getRegionList();
		List<TheaterDTO> areaList = theaterService.getAreaList();
//		HashSet<String> region = new HashSet<String>();
//		for(TheaterDTO t : areaList) {
//			region.add(t.getTh_region());
//		}
//		System.out.println(region);
		
		// 모델에 추가
    	model.addAttribute("regionList", regionList);
    	model.addAttribute("areaList", areaList);
    	return "theater/theater";
	}
	
	// runningDate
	// 극장별 상영날짜 구하는 ajax
	@GetMapping("/runningDate")
	@ResponseBody
	public List<Map<String, String>> runningDate(@RequestParam Map<String, String> rMap) {
		List<Map<String, String>> date = theaterService.getRunningDate(rMap);
		return date;
	}
	
	// runningMovie
	@GetMapping("/runningMovie")
	@ResponseBody
	public List<Map<String, Object>> runningMovie(@RequestParam Map<String, String> rMap) {
		List<Map<String, Object>> list = theaterService.getRunningMovie(rMap);
		System.out.println(list);
		return list;
	}
	
        

}