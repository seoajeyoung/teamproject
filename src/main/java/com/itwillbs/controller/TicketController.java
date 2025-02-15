package com.itwillbs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.itwillbs.service.TicketService;

@Controller
@RequestMapping("/")
public class TicketController {

	@Inject
	private TicketService ticketService;

	// 채현 메인 => 해당영화 클릭하면 예매에서 자동클릭
	@GetMapping("/ticket")
	public String test(@RequestParam(value = "num", required = false) String movieNum, Model model,
			HttpSession session) {

		model.addAttribute("movieNum", movieNum);
		model.addAttribute("member_num", session.getAttribute("member_num"));
		return "ticket/ticket";
	}

	@GetMapping("/fff") // 탑
	public String test2() {

		return "ticket/fff";
	}

	@GetMapping("/modal") // 좌석 모달
	public String modal(Model model) {

		List<Map<String, Object>> th_region = ticketService.modalth_region(); // 극장 지역 가져오는거 나중 관리자 service로옮길꺼임..

		model.addAttribute("th_region", th_region);

		return "ticket/modal";
	}

	@GetMapping("/결제TEST") // 영화 결제 TEST
	public String TEST3(@RequestParam Map<String, String> param, Model model) {

		model.addAttribute(param);

		Integer selectnowcount = ticketService.selectnowcount(param);

		int seCount = Integer.parseInt(param.get("se_count"));

		int nowCount = seCount - selectnowcount;

		model.addAttribute("nowCount", nowCount);
		return "ticket/결제TEST";
	}

	@GetMapping("/ticketpayment") // 영화 결제 TEST
	public String ticketpayment(HttpSession session, Model model) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("member_num", (String) session.getAttribute("member_num"));
		
		Map<String, String> selectmember = ticketService.selectmember(param);
		
		
		model.addAttribute("selectmember", selectmember);

		return "ticket/ticketpayment";
	}

	@GetMapping("/MovieTicket") // 서재영 영화 보여주는 맵핑
	public ResponseEntity<List<Map<String, Object>>> getMovies(
			@RequestParam(value = "order", defaultValue = "`rank` IS NULL , `rank`") String order,
			@RequestParam(value = "type", defaultValue = "kr") String type) {
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
			@RequestParam(value = "selectMovieTitle") String selectMovieTitle,
			@RequestParam(value = "type", defaultValue = "kr") String type) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("selectMovieTitle", selectMovieTitle);
		param.put("type", type);

		List<Map<String, Object>> th_region = ticketService.selectTheaterList(param);

		ResponseEntity<List<Map<String, Object>>> entity = new ResponseEntity<List<Map<String, Object>>>(th_region,
				HttpStatus.OK);

		return entity;
	}

	@GetMapping("/TH_NAME") // 서재영 극장이름 보여주는 맵핑
	public ResponseEntity<List<Map<String, Object>>> getTh_name(@RequestParam("region") String region,
			@RequestParam(value = "type", defaultValue = "kr") String type) {

		Map<String, String> param = new HashMap<String, String>();

		param.put("region", region);
		param.put("type", type);

		List<Map<String, Object>> th_name = ticketService.selectTh_nameList(param);

		ResponseEntity<List<Map<String, Object>>> entity = new ResponseEntity<List<Map<String, Object>>>(th_name,
				HttpStatus.OK);

		return entity;

	}

	@GetMapping("/UPDATE_TH_NAME") // 서재영 극장이름 투명도 처리 맵핑
	public ResponseEntity<List<Map<String, Object>>> update_th_name(@RequestParam("region") String region,
			@RequestParam("selectMovieTitle") String selectMovieTitle, @RequestParam("fullDate") String fullDate,
			@RequestParam(value = "type", defaultValue = "kr") String type) {

		Map<String, String> param = new HashMap<String, String>();

		param.put("region", region);
		param.put("selectMovieTitle", selectMovieTitle);
		param.put("fullDate", fullDate);
		param.put("type", type);

		List<Map<String, Object>> updateth_name = ticketService.selectUpdateTh_nameList(param);

		ResponseEntity<List<Map<String, Object>>> entity = new ResponseEntity<List<Map<String, Object>>>(updateth_name,
				HttpStatus.OK);
		return entity;
	}

	@GetMapping("/UPDATE_MOVIE") // 서재영 수정 영화제목 보여주는 맵핑
	public ResponseEntity<List<Map<String, Object>>> update_movie(
			@RequestParam("selectTheaterName") String selectTheaterName, @RequestParam("fullDate") String fullDate,
			@RequestParam("region") String region, @RequestParam(value = "type", defaultValue = "kr") String type) {

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

	@GetMapping("/UPDATE_TIME") // 서재영 수정 시간 보여주는 맵핑
	public ResponseEntity<List<Map<String, Object>>> update_time(
			@RequestParam("selectTheaterName") String selectTheaterName,
			@RequestParam("selectMovieTitle") String selectMovieTitle, @RequestParam("region") String region) {

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
	public ResponseEntity<Map<String, List<Map<String, Object>>>> getMtime(@RequestParam("region") String region,
			@RequestParam("selectMovieTitle") String selectMovieTitle,
			@RequestParam("selectTheaterName") String selectTheaterName, @RequestParam("fullDate") String fullDate) {

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("region", region);
		param.put("selectMovieTitle", selectMovieTitle);
		param.put("selectTheaterName", selectTheaterName);
		param.put("fullDate", fullDate);

		List<Map<String, Object>> mtime = ticketService.selectMtime(param);
		List<Map<String, Object>> mcinema = ticketService.selectMcinema(param);
		List<String> thNumbers = mcinema.stream().map(cinema -> (String) cinema.get("TH_NUMBER"))
				.collect(Collectors.toList());
		param.put("thNumbers", thNumbers);

		List<Map<String, Object>> secount = ticketService.selectSecount(param);

		Map<String, List<Map<String, Object>>> response = new HashMap<String, List<Map<String, Object>>>();

		response.put("mtime", mtime);
		response.put("mcinema", mcinema);
		response.put("secount", secount);

		return new ResponseEntity<Map<String, List<Map<String, Object>>>>(response, HttpStatus.OK);
	}

	@GetMapping("/CI_NUMBER") // 서재영 해당 영화관의 관 가져오는 맵핑 (modal)
	public ResponseEntity<List<Map<String, String>>> getCI_NUMBER(@RequestParam("region") String region,
			@RequestParam("th_name") String th_name) {

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("region", region);
		param.put("th_name", th_name);

		List<Map<String, String>> getci_number = ticketService.getci_number(param);

		return new ResponseEntity<List<Map<String, String>>>(getci_number, HttpStatus.OK);
	}

	@GetMapping("/MODALTH_NAME") // 서재영 해당 지역의 극장이름 가져오는 맵핑 (modal)
	public ResponseEntity<List<Map<String, String>>> getMODALTH_NAME(@RequestParam("region") String region) {

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("region", region);

		List<Map<String, String>> getregion = ticketService.getth_name(param);

		return new ResponseEntity<List<Map<String, String>>>(getregion, HttpStatus.OK);
	}

	@PostMapping("/INSERTSEAT") // 서재영 관리자 관에 좌석 저장하는 맵핑
	public  ResponseEntity<String> INSERTSEAT(@RequestBody Map<String, Object> request) {
		int count = ticketService.checkmseat(request);

		if (count > 0) {
			ticketService.deletemseat(request);
		}

		ticketService.insertseat(request);
		 return ResponseEntity.ok("Success");
	}

	@GetMapping("/SAVECI_NUMBER") // 서재영 저장된 관의 좌석 가져오기 (modal)
	public ResponseEntity<List<Map<String, String>>> SELECTSAVECI_NUMBER(@RequestParam("region") String region,
			@RequestParam("th_name") String th_name, @RequestParam("th_number") String th_number) {

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("region", region);
		param.put("th_name", th_name);
		param.put("th_number", th_number);

		List<Map<String, String>> selectsaveseat = ticketService.selectsaveseat(param);

		return new ResponseEntity<List<Map<String, String>>>(selectsaveseat, HttpStatus.OK);
	}

	@GetMapping("/LOADSEAT") // 예매페이지 좌석 가져오기 서재영
	public ResponseEntity<Map<String, List<Map<String, String>>>> selectLOADSEAT(
			@RequestParam Map<String, Object> param) {

		List<Map<String, String>> selectsaveseat = ticketService.selectloadseat(param);

		List<Map<String, String>> selectpaymentseat = ticketService.selectpaymentseat(param);
		Map<String, List<Map<String, String>>> response = new HashMap<>();
		response.put("savedSeats", selectsaveseat);
		response.put("paymentSeats", selectpaymentseat);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@PostMapping("/SEATPAYMENT")
	public ResponseEntity<Map<String, Object>> SEATPAYMENT(@RequestBody Map<String, Object> request,
	                                                      HttpSession session) {
	    
	    int checkseat = ticketService.checkseat(request);
	    
	    request.put("member_num", session.getAttribute("member_num"));
	    
	    Map<String, Object> responseBody = new HashMap<>();
	    
	    // 좌석이 사용 가능할 때
	    if (checkseat == 0) {
	        ticketService.insertticketpayment(request);

	        List<Map<String, String>> tp_num = ticketService.selectticketpayment(request);
	        List<Object> tpNumList = new ArrayList<>();

	        for (Map<String, String> tpNumMap : tp_num) {
	            tpNumList.add(tpNumMap.get("TP_NUM"));
	        }

	        request.put("tp_num", tpNumList);
	        ticketService.insertselectseat(request);

	        responseBody.put("status", "success");
	        responseBody.put("tpNumList", tpNumList);
	        
	    } else {
	        // 좌석이 이미 사용 중일 때
	        responseBody.put("status", "error");
	        responseBody.put("message", "이미 선택된 좌석입니다. 다른 좌석을 선택해주세요.");
	    }
	    
	    return ResponseEntity.ok(responseBody);
	}

	
	@PostMapping("/DELETESEAT") // 결제화면에서 이전누르면 전에 선택한 좌석 지우는 맵핑
	public void DELETESEAT(@RequestBody Map<String, Object> request) {

		ticketService.deleteticket(request);

		ticketService.deleteseat(request);

	}

	@PostMapping("/UPDATEPAYMENT") // 결제되면 tp_payment t로 업데이트
	public void INSERTPAYMENT(@RequestBody Map<String, Object> request) {

		ticketService.updatepayment(request);

	}
	
	
	@PostMapping("/INSERTPERSON") // 좌석 선택 최대 인원 조절 
	public void INSERTPERSON(@RequestBody Map<String, Object> request, Model model) {
		Map<String, Object> selectperson =  ticketService.selectperson(request);
		
		if(selectperson != null) {
			ticketService.deleteperson(request);
		}
			ticketService.insertperson(request);
		
		
		
		

	}
	

	@PostMapping("/SELECTPERSON")
	public ResponseEntity<Map<String, Object>> SELECTPERSON(@RequestBody Map<String, Object> request) {

	    Map<String, Object> person = ticketService.selectperson(request);

	    
	    ResponseEntity<Map<String, Object>> entity = new ResponseEntity<Map<String, Object>>(person,
				HttpStatus.OK);
	    
	    return entity;
	}
	
	
	
	
}
