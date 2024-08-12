package com.itwillbs.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MovieDAO;
import com.itwillbs.domain.MovieDTO;

@Service
public class MainService {
	
	@Inject
	private MovieDAO movieDAO;
	
	// 영화 리스트
	public List<MovieDTO> getMovie(String page) {
		// page값이 있으면
		if(page != null && page.equals("")) {
			//상영 예정작
			return movieDAO.getMovie2();
		} else {
			return movieDAO.getMovie();
		}
	}
	
	

}
