package com.itwillbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.StoreDTO;
import com.itwillbs.service.StoreService;

@Controller
@RequestMapping("/store/*")
public class StoreController {
	
	@Inject
	private StoreService storeService;

	
	@GetMapping("/main")
	public String main(Model model) {
		System.out.println("StoreController main()");
				
		List<StoreDTO> productList = storeService.getProduct();
		
		System.out.println("ProductList: " + productList);
		
		model.addAttribute("productList", productList);
		
		return "store/main";
	}
}
