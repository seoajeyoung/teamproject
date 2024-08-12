package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.service.TheaterService;


@Controller
public class TheaterController {
	
	@Inject
	private TheaterService theaterService;
	
	@GetMapping("/theater")
	public String test2() {
		return "theater/theater";
	}

}
	
	
