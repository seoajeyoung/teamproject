package com.itwillbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.CartDTO;
import com.itwillbs.domain.CodeDTO;
import com.itwillbs.domain.StoreDTO;
import com.itwillbs.service.StoreService;

@Controller
@RequestMapping("/store/*")
public class StoreController {
	
	@Inject
	private StoreService storeService;

	
	 @GetMapping("/storeMain")
	    public String main(HttpSession session, Model model) {
	        System.out.println("StoreController main()");
	        
	        String member_num = (String) session.getAttribute("member_num");
		    System.out.println("storemain: " + member_num);
	        			
			List<StoreDTO> productList = storeService.getProduct();
			
			System.out.println("ProductList: " + productList);
			
			model.addAttribute("productList", productList);

	        return "store/storeMain";
	    }
	
	@GetMapping("/productDetail") // 상품상세페이지
	public String productDetail(@RequestParam("st_num") String st_num, Model model) {
		System.out.println("StoreController productDetail()");
		
		StoreDTO storeDTO = storeService.getProductByNum(st_num);
		
		
		model.addAttribute("storeDTO", storeDTO);

		
		return "store/productDetail";
		
	}
	
	@GetMapping("/productCategory") // 상단 메뉴 누를시 해당하는 상품 모음 페이지로 이동
	public String categoryDetail(@RequestParam("category") String category, Model model) {
	    System.out.println("StoreController categoryDetail()");
	    
	    // 선택된 카테고리에 속하는 모든 상품을 가져옴
	    List<StoreDTO> productList = storeService.productCategory(category);
	    
	    model.addAttribute("productList", productList);
	    
	    return "store/productCategory"; 
	}
	
	@PostMapping("/addCart")
	public String addCart(CartDTO cartDTO, HttpSession session) {
		
		System.out.println("StoreContorller addCart()");
		
//		String member_num = (String)session.getAttribute("member_num");
		
//		CartDTO cartDTO = new CartDTO();
//	    cartDTO.setMember_num(member_num);
//	    cartDTO.setSt_num(st_num);
//	    cartDTO.setCart_quantity(cart_quantity);

	    storeService.addCart(cartDTO);
	    System.out.println(cartDTO);
	    
	    return "redirect:/store/storeCart";
	}
 	
	@GetMapping("/storeCart")
	public String storeCart(HttpSession session, Model model) {
		System.out.println("StoreController StoreCart()");
		
		String member_num = (String)session.getAttribute("member_num");

		List<CartDTO> cartItemList = storeService.getCartItem(member_num);
		
		model.addAttribute("cartItemList", cartItemList);
		
		return "store/storeCart";
	}
	
	@GetMapping("/controlmenu")
	public String controlmenu(Model model) {

		List<CodeDTO> codeList = storeService.getCodeList();
        System.out.println("Code List: " + codeList); // 디버깅 로그
        // Model에 데이터 추가
        model.addAttribute("codeList", codeList);
		

		return "store/controlmenu";
	}
	
	@PostMapping("/addCode")
	public String addCode(CodeDTO codeDTO, RedirectAttributes redirectAttributes) {
		System.out.println("StoreController addCode()");
		
		storeService.addCode(codeDTO);
		redirectAttributes.addFlashAttribute("message", "코드가 성공적으로 등록되었습니다.");
		
		return "redirect:/store/controlmenu";
	}
	
//	 @GetMapping("/getCodeList")
//	    public String getCodeList(Model model) {
//		 System.out.println("StoreController getCodeList()");
//	        // 코드 리스트를 조회
//	        List<CodeDTO> codeList = storeService.getCodeList();
//	        System.out.println("Code List: " + codeList); // 디버깅 로그
//	        // Model에 데이터 추가
//	        model.addAttribute("codeList", codeList);
//	        
//	        // JSP로 이동
//	        return "store/controlmenu";
//	    }
}
