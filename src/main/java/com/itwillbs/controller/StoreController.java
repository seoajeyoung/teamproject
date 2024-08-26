package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.CartDTO;
import com.itwillbs.domain.CodeDTO;
import com.itwillbs.domain.CodeDetailDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.StoreDTO;
import com.itwillbs.domain.StorePaymentDTO;
import com.itwillbs.service.StoreService;

@Controller
@RequestMapping("/store/*")
public class StoreController {
	
	@Inject
	private StoreService storeService;

	
	@GetMapping("/storeMain") // 스토어 메인화면
    public String main(HttpSession session, Model model) {
    	
		
		
        String member_num = (String) session.getAttribute("member_num"); // 세션에서 정보 가져옴
	        			
		List<StoreDTO> productList = storeService.getProduct(); // 상품목록 확인하기 위해 생성
			
			
		model.addAttribute("productList", productList); // 모델에 추가, 페이지에서 확인
			
		model.addAttribute("categories", storeService.getGlobalCategories()); // 메뉴값 보기 위함

        return "store/storeMain";
    }
	
	@GetMapping("/productDetail") // 상품상세페이지
	public String productDetail(@RequestParam("st_num") String st_num, Model model) {
		
		StoreDTO storeDTO = storeService.getProductByNum(st_num); // 상품번호에 해당하는 상품 확인
		
		
		model.addAttribute("storeDTO", storeDTO); // 페이지에서 보기 위함
		model.addAttribute("categories", storeService.getGlobalCategories()); // 메뉴값 보기 위함
		
		return "store/productDetail";
		
	}
	
	@GetMapping("/productCategory") // 상단 메뉴 누를시 해당하는 상품 모음 페이지로 이동
	public String categoryDetail(@RequestParam("category") String category, Model model) {
	    
	    
	    // 선택된 카테고리에 속하는 모든 상품을 가져옴
	    List<StoreDTO> productList = storeService.productCategory(category);
	    
	    model.addAttribute("productList", productList);
	    model.addAttribute("category", category); // 모델에 추가, 페이지에서 확인
	    model.addAttribute("categories", storeService.getGlobalCategories()); // 메뉴값 보기 위함
	    
	    return "store/productCategory"; 
	}
	
	@PostMapping("/addCart") // 장바구니에 추가하는 메서드
	public String addCart(CartDTO cartDTO, HttpSession session) {

	    storeService.addCart(cartDTO);
	    
	    return "redirect:/store/storeCart"; // 장바구니 화면으로 이동
	}
 	
	@GetMapping("/storeCart") // 장바구니 페이지
	public String storeCart(HttpSession session, Model model, HttpServletRequest request) {
		

	    String member_num = (String) session.getAttribute("member_num"); // 회원번호에 해당하는 장바구니 조회하기 위함

	    if (member_num != null) { // 회원번호가 조회가능한 경우
	    	
	        MemberDTO memberDTO = storeService.getMemberInfo(member_num);
	        
	        List<CartDTO> cartItemList = storeService.getCartItem(member_num); // 장바구니의 상품 목록
	        
	        model.addAttribute("memberDTO", memberDTO);
	        model.addAttribute("cartItemList", cartItemList);
	        model.addAttribute("categories", storeService.getGlobalCategories());
	    } else {
	        // 로그인을 하지 않은 경우 또는 세션이 만료된 경우에 대한 처리
	    	model.addAttribute("msg","로그인이 필요합니다. 로그인 하시겠습니까?");
			// targetURL 속성명으로 로그인 폼 페이지 서블릿 주소 저장
			model.addAttribute("targetURL", request.getContextPath()+"/member/login");
	        return "store/storeCartMsg"; // 메시지 출력하기 위함
	    }
	    
	    return "store/storeCart";
	}
	// ------------------------ 메뉴코드 관리하는 코드들 ---------------------------------
	
	@GetMapping("/controlmenu") // 메뉴관리화면
	public String controlmenu(Model model) {
		
		List<CodeDTO> codeList = storeService.getCodeList(); // 대분류 코드 조회
		List<CodeDetailDTO> codeDetailList = storeService.getCodeDetail(); // 상세분류 코드 조회
        // Model에 데이터 추가
        model.addAttribute("codeList", codeList);
        model.addAttribute("codeDetailList", codeDetailList);
		

		return "store/controlmenu";
	}
	
	@PostMapping("/addCode") // 대분류 코드 추가 
	public String addCode(CodeDTO codeDTO, RedirectAttributes redirectAttributes) {
		
		storeService.addCode(codeDTO);
		redirectAttributes.addFlashAttribute("message", "코드가 성공적으로 등록되었습니다.");
		
		return "redirect:/store/controlmenu";
	}
	
	@PostMapping("/addDetailCode") // 상세분류 코드 추가
	public String addDetailCode(CodeDetailDTO codeDetailDTO, RedirectAttributes redirectAttributes) {
		
		storeService.addDetailCode(codeDetailDTO);
		redirectAttributes.addFlashAttribute("message", "코드가 성공적으로 등록되었습니다.");
		
		
		List<CodeDetailDTO> codeDetailList = storeService.getCodeDetail();
	    redirectAttributes.addFlashAttribute("codeDetailList", codeDetailList);
		
		return "redirect:/store/controlmenu";
	}
 	
	// ---------------------------------------------------------------------------------
	
	
	@GetMapping("/storeMenu") // 스토어 메뉴 보여주는 화면 (include)
    public String showStoreMenu(Model model) {

        // 카테고리 리스트를 가져와서 모델에 추가
        List<CodeDetailDTO> categories = storeService.getCategories("ST");
        
        model.addAttribute("categories", categories);

        return "store/storeMenu"; // storeMenu.jsp를 반환
    }
	 

	

}
