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
import com.itwillbs.dao.StoreDAO;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.StoreDTO;

@Service
public class MainService {
	
	@Inject
	private MovieDAO movieDAO;
	
	@Inject
	private StoreDAO storeDAO;
	
	// 영화 리스트
	public List<MovieDTO> getMovie() {
		return movieDAO.getMovie();
	}
	
	public List<Map<String, Object>> getMovie3(){
		return movieDAO.getMovie3();
	}

	public List<StoreDTO> mainPackage() {
		return storeDAO.mainPackage();
	}

	public List<StoreDTO> giftcon() {
		return storeDAO.giftcon();
	}

}
