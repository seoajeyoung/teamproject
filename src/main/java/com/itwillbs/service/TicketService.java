package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.TicketDAO;

@Service
public class TicketService {

	@Inject
	private TicketDAO ticketDAO;
	
	public List<Map<String, Object>> selectMovieList(Map<String, String> param) {
		return ticketDAO.selectMovieList(param);
	}

	public List<Map<String, Object>> selectTheaterList(Map<String, String> param) {
		return ticketDAO.selectTheaterList(param);
	}

	public List<Map<String, Object>> selectTh_nameList(Map<String, String> param) {
		return ticketDAO.selectTh_nameList(param);
	}

	public List<Map<String, Object>> selectMtime(Map<String, Object> param) {
		
		return ticketDAO.selectMtime(param);
	}

	public List<Map<String, Object>> selectMcinema(Map<String, Object> param) {
		
		return ticketDAO.selectMcinema(param);
	}

	public List<Map<String, Object>> selectUpdateTh_nameList(Map<String, String> param) {
		
		return ticketDAO.selectUpdateTh_nameList(param);
	}

	public List<Map<String, Object>> selectupdate_movie(Map<String, String> param) {
		
		return ticketDAO.selectupdate_movie(param);
	}

	public List<Map<String, Object>> selectupdate_time(Map<String, String> param) {
		
		return ticketDAO.selectupdate_time(param);
	}

	public List<Map<String, Object>> modalth_region() {
		return ticketDAO.modalth_region();
	}

	public List<Map<String, String>> getth_name(Map<String, Object> param) {
		return ticketDAO.getth_name(param);
	}

	public List<Map<String, String>> getci_number(Map<String, Object> param) {
		return ticketDAO.getci_number(param);
	}

	public void insertseat(Map<String, Object> request) {
		ticketDAO.insertseat(request);
	}

	public List<Map<String, String>> selectsaveseat(Map<String, Object> param) {
		return ticketDAO.selectsaveseat(param);
	}

	public List<Map<String, Object>> selectSecount(Map<String, Object> param) {
		return ticketDAO.selectSecount(param);
	}

	public List<Map<String, String>> selectloadseat(Map<String, Object> param) {
		return ticketDAO.selectloadseat(param);
	}

	public void insertselectseat(Map<String, Object> request) {
		ticketDAO.insertselectseat(request);
		
		 new Thread(() -> {
	            try {
	                Thread.sleep(600000); // 10분 대기
	                ticketDAO.deleteseat(request);
	            } catch (Exception e) {
	            	e.printStackTrace();
	            }
	        }).start();
	    
	}

	public int checkseat(Map<String, Object> request) {
		return ticketDAO.checkseat(request);
	}


}
