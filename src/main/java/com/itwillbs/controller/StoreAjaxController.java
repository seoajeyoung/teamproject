package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.CartDTO;
import com.itwillbs.service.StoreService;

@RestController
public class StoreAjaxController {

	@Inject
	private StoreService storeService;
	
//	@PostMapping("/store/addCart")
//	@ResponseBody
//	public String addToCart(@RequestParam("st_num") int st_num, 
//	                        @RequestParam("quantity") int quantity,
//	                        HttpSession session) {
//	    System.out.println("StoreAjaxController addCart()");
//
//	    Integer member_num = (Integer) session.getAttribute("member_num");
//	    System.out.println("addCart: " + member_num);
//	    
//	    
//	    
//	    if(member_num == null) {
//	        // 로그인이 되어 있지 않은 경우
//	        return "not_logged_in";
//	    }
//	    
//	    CartDTO cartDTO = new CartDTO();
//	    cartDTO.setMember_num(member_num);
//	    cartDTO.setSt_num(st_num);
//	    cartDTO.setCart_quantity(quantity);
//
//	    storeService.addCart(cartDTO);
//
//	    return "success";
//	}
}
