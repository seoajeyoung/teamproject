package com.itwillbs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.itwillbs.service.TicketService;

@Controller
@RequestMapping("/")
public class TicketController {

	@Inject
	private TicketService ticketService ;

	@GetMapping("/ticket")
	public String test() {

		return "ticket/ticket";
	}
	

	 
	@GetMapping("/fff")  // 탑 
	public String test2() {

		return "ticket/fff";
	}
	
	@GetMapping("/modal")  // 좌석 모달  
	public String modal() {

		return "ticket/modal";
	}
	
	@GetMapping("/결제TEST")  // 영화 결제 TEST 
	public String TEST3() {

		return "ticket/결제TEST";
	}
	
	
	
	@GetMapping("/MovieTicket")// 서재영 영화 보여주는 맵핑
	public ResponseEntity<List<Map<String, Object>>> getMovies(
			@RequestParam(value = "order", defaultValue = "`rank` IS NULL , `rank`") String order
			,@RequestParam(value = "type" , defaultValue = "kr") String type) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("ORDER", order);
		param.put("type", type);
		
		List<Map<String, Object>> movies = ticketService.selectMovieList(param);
		
		
		ResponseEntity<List<Map<String, Object>>> entity = new ResponseEntity<List<Map<String, Object>>>(movies,
				HttpStatus.OK);

		return entity;
	}

	@GetMapping("/TH_REGION") // 서재영 극장 지역,갯수 보여주는 맵핑
	public ResponseEntity<List<Map<String, Object>>> getTh_region(
			@RequestParam(value= "selectMovieTitle") String selectMovieTitle
			,@RequestParam(value = "type" , defaultValue  = "kr") String type) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("selectMovieTitle", selectMovieTitle);
		param.put("type", type);
		
		List<Map<String, Object>> th_region = ticketService.selectTheaterList(param);

		ResponseEntity<List<Map<String, Object>>> entity = new ResponseEntity<List<Map<String, Object>>>(th_region,
				HttpStatus.OK);

		return entity;
	}

	@GetMapping("/TH_NAME") // 서재영 극장이름 보여주는 맵핑 
	public ResponseEntity<List<Map<String, Object>>> getTh_name(
			@RequestParam("region") String region 
			,@RequestParam(value = "type" , defaultValue = "kr") String type) {
		
		Map<String, String> param = new HashMap<String, String>();
		
		param.put("region", region);
		param.put("type", type);
		
		List<Map<String, Object>> th_name = ticketService.selectTh_nameList(param);
		
		ResponseEntity<List<Map<String, Object>>> entity = new ResponseEntity<List<Map<String, Object>>>(th_name,
				HttpStatus.OK);

		return entity;
		
	}
	
	@GetMapping("/UPDATE_TH_NAME") // 서재영 극장이름 투명도 처리 맵핑 
	public ResponseEntity<List<Map<String, Object>>> update_th_name(
			@RequestParam("region") String region
			,@RequestParam("selectMovieTitle") String selectMovieTitle
			,@RequestParam("fullDate") String fullDate 
			,@RequestParam(value ="type", defaultValue = "kr")String type) {
		
		Map<String, String> param = new HashMap<String, String>();
		
		param.put("region", region);
		param.put("selectMovieTitle", selectMovieTitle);
		param.put("fullDate", fullDate);
		param.put("type", type);
		System.out.println( "param"+param);
		
		List<Map<String, Object>> updateth_name = ticketService.selectUpdateTh_nameList(param);
		
		
		ResponseEntity<List<Map<String, Object>>> entity = new ResponseEntity<List<Map<String, Object>>>(updateth_name,
				HttpStatus.OK);
		return entity;
	}
	
	
	@GetMapping("/UPDATE_MOVIE") // 서재영 수정 영화제목  보여주는 맵핑 
	public ResponseEntity<List<Map<String, Object>>> update_movie(
			@RequestParam("selectTheaterName") String selectTheaterName
			,@RequestParam("fullDate") String fullDate 
			,@RequestParam("region") String region
			,@RequestParam(value = "type" , defaultValue = "kr") String type) {
		
		Map<String, String> param = new HashMap<String, String>();
		
		param.put("selectTheaterName", selectTheaterName);
		param.put("fullDate", fullDate);
		param.put("region", region);
		param.put("type", type);
		
		List<Map<String, Object>> update_movie = ticketService.selectupdate_movie(param);
		
		ResponseEntity<List<Map<String, Object>>> entity = new ResponseEntity<List<Map<String, Object>>>(update_movie,
				HttpStatus.OK);
		return entity;
	}   
	
	
	@GetMapping("/UPDATE_TIME") // 서재영 수정 시간  보여주는 맵핑 
	public ResponseEntity<List<Map<String, Object>>> update_time(
			@RequestParam("selectTheaterName") String selectTheaterName
			,@RequestParam("selectMovieTitle") String selectMovieTitle 
			,@RequestParam("region") String region) {
		
		Map<String, String> param = new HashMap<String, String>();
		
		param.put("selectTheaterName", selectTheaterName);
		param.put("selectMovieTitle", selectMovieTitle);
		param.put("region", region);
		
		
		List<Map<String, Object>> update_time = ticketService.selectupdate_time(param);
		
		ResponseEntity<List<Map<String, Object>>> entity = new ResponseEntity<List<Map<String, Object>>>(update_time,
				HttpStatus.OK);
		return entity;
	}
	
	
	
	
	
	@GetMapping("/MTIME") // 서재영 관의 시간 가져오는 맵핑 
	public ResponseEntity<Map<String, List<Map<String, Object>>>> getMtime(
			@RequestParam("region") String region 
		   ,@RequestParam("selectMovieTitle") String selectMovieTitle
		   ,@RequestParam("selectTheaterName") String selectTheaterName
		   ,@RequestParam("fullDate") String fullDate){
		
			Map<String, Object> param = new HashMap<String, Object>();
		
			param.put("region", region);
			param.put("selectMovieTitle", selectMovieTitle);
			param.put("selectTheaterName", selectTheaterName);
			param.put("fullDate", fullDate);
			
			List<Map<String, Object>> mtime = ticketService.selectMtime(param);
			List<Map<String, Object>> mcinema = ticketService.selectMcinema(param);
			
			Map<String, List<Map<String, Object>>> response = new HashMap<String, List<Map<String, Object>>>();
			
			response.put("mtime", mtime);
			response.put("mcinema", mcinema);
			
			return new ResponseEntity<Map<String, List<Map<String, Object>>>>(response, HttpStatus.OK);
	}
	
	
	
	
	@GetMapping("/CI_NUMBER") // 서재영 관의 시간 가져오는 맵핑 
	public ResponseEntity<Map<String, List<Map<String, Object>>>> getCI_NUMBER(
			@RequestParam("TH_NUM") String TH_NUM ){
		
			Map<String, Object> param = new HashMap<String, Object>();
		
			param.put("TH_NUM", TH_NUM);
			
			
			Map<String, List<Map<String, Object>>> response = new HashMap<String, List<Map<String, Object>>>();
			
			
			return new ResponseEntity<Map<String, List<Map<String, Object>>>>(response, HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
