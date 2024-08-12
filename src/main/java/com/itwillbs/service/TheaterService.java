package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.TheaterDAO;

@Service
public class TheaterService {

	@Inject
	private TheaterDAO theaterDAO;
	
}	
