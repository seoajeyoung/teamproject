package com.itwillbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.StoreDTO;
import com.itwillbs.service.StoreService;

@Controller
@RequestMapping("/store/*")
public class StoreController {
	
	@Inject
	private StoreService storeService;

	
//	@GetMapping("/main")
//	public String main(Model model) {
//		System.out.println("StoreController main()");
//				
//		List<StoreDTO> productList = storeService.getProduct();
//		
//		System.out.println("ProductList: " + productList);
//		
//		model.addAttribute("productList", productList);
//		
//		return "store/main";
//	}
	
	 @GetMapping("/main")
	    public String main(@RequestParam(value = "category", required = false) String category, Model model) {
	        System.out.println("StoreController main()");
	        
	        List<StoreDTO> productList;

	        if (category != null && !category.isEmpty()) {
	            productList = storeService.getProductsByCategory(category);
	        } else {
	            productList = storeService.getProduct();
	        }

	        System.out.println("Product List: " + productList);
	        model.addAttribute("productList", productList);

	        return "store/main";
	    }
	
	@GetMapping("/productDetail")
	public String productDetail(Model model) {
		System.out.println("StoreController productDetail()");
		
		
		return "store/productDetail";
		
	}
	
	@GetMapping("/categoryDetail")
	public String categoryDetail(@RequestParam("category") String category, Model model) {
	    System.out.println("StoreController categoryDetail()");
	    
	    // 선택된 카테고리에 속하는 모든 상품을 가져옴
	    List<StoreDTO> productList = storeService.getProductsByCategory(category);
	    
	    model.addAttribute("productList", productList);
	    
	    return "store/categoryDetail";  // 새로운 JSP 페이지로 이동
	}
}
