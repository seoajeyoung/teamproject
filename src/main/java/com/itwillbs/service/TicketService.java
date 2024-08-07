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


}
