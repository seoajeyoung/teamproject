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
import com.itwillbs.domain.CodeDetailDTO;
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
			
			model.addAttribute("categories", storeService.getGlobalCategories());

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
		List<CodeDetailDTO> codeDetailList = storeService.getCodeDetail();
        System.out.println("Code List: " + codeList); // 디버깅 로그
        // Model에 데이터 추가
        model.addAttribute("codeList", codeList);
        model.addAttribute("codeDetailList", codeDetailList);
		

		return "store/controlmenu";
	}
	
	@PostMapping("/addCode")
	public String addCode(CodeDTO codeDTO, RedirectAttributes redirectAttributes) {
		System.out.println("StoreController addCode()");
		
		if(storeService.codeIdCheck(codeDTO.getCode_id()) != null) {
			redirectAttributes.addFlashAttribute("errorMessage", "Code ID가 이미 존재합니다.");
	        return "redirect:/store/controlmenu";
		}
		
		if(storeService.codeValCheck(codeDTO.getCode_value()) != null) {
			redirectAttributes.addFlashAttribute("errorMessage", "Code Value가 이미 존재합니다.");
	        return "redirect:/store/controlmenu";
		}
		
		storeService.addCode(codeDTO);
		redirectAttributes.addFlashAttribute("message", "코드가 성공적으로 등록되었습니다.");
		
		return "redirect:/store/controlmenu";
	}
	
	@PostMapping("/addDetailCode")
	public String addDetailCode(CodeDetailDTO codeDetailDTO, RedirectAttributes redirectAttributes) {
		System.out.println("StoreController addDetailCode()");
		
		if(storeService.codeDetailCheck(codeDetailDTO) != null) {
			redirectAttributes.addFlashAttribute("errorMessage", "이 상세 메뉴 코드는 이미 존재합니다.");
	        return "redirect:/store/controlmenu";
		}
		
		storeService.addDetailCode(codeDetailDTO);
		redirectAttributes.addFlashAttribute("message", "코드가 성공적으로 등록되었습니다.");
		
		
		List<CodeDetailDTO> codeDetailList = storeService.getCodeDetail();
	    redirectAttributes.addFlashAttribute("codeDetailList", codeDetailList);
		
		return "redirect:/store/controlmenu";
	}
 	
	 @GetMapping("/storeMenu")
	    public String showStoreMenu(Model model) {
	        System.out.println("StoreController showStoreMenu()");

	        // 카테고리 리스트를 가져와서 모델에 추가
	        List<CodeDetailDTO> categories = storeService.getCategories("ST");
	        System.out.println(categories);
	        model.addAttribute("categories", categories);

//	        // 장바구니와 기프트콘 카운트 등의 데이터를 가져와서 모델에 추가할 수 있음
//	        // 예를 들어, 장바구니와 기프트콘의 수를 하드코딩하거나 실제 서비스를 통해 가져올 수 있음
//	        int giftConCount = 0; // 예시, 실제 데이터로 대체
//	        int cartViewCount = 0; // 예시, 실제 데이터로 대체
//	        model.addAttribute("giftConCount", giftConCount);
//	        model.addAttribute("cartViewCount", cartViewCount);

	        return "store/storeMenu"; // storeMenu.jsp를 반환
	    }
	
}
