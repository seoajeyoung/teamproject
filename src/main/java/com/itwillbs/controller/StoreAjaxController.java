package com.itwillbs.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.CartDTO;
import com.itwillbs.domain.StorePaymentDTO;
import com.itwillbs.service.StoreService;

@RestController
public class StoreAjaxController {

	@Inject
	private StoreService storeService;
	
	// ------------------메뉴코드 관리-----------------------
	
	@PostMapping("/store/deleteCategory") // 메뉴 대분류코드 삭제 
	@ResponseBody
	public String deleteCategory(@RequestParam("code_num") String code_num) {
	    
	    boolean result = storeService.deleteCategory(code_num);
	    
	    if (result) {
	        return "success";
	    } else {
	        return "error";
	    }
	}
	
	
	@PostMapping("/store/deleteCode") // 상세분류코드 삭제
	@ResponseBody
	public String deleteCode(@RequestParam("detail_code_num") String detail_code_num) {
	    
	    boolean result = storeService.deleteCode(detail_code_num);
	    
	    if (result) {
	        return "success";
	    } else {
	        return "error";
	    }
	}
	
	// 대분류 코드 중복 검사
    @PostMapping("/store/checkCode")
    @ResponseBody
    public Map<String, Boolean> checkCode(@RequestParam("code_id") String code_id, 
                                          @RequestParam("code_value") String code_value) {
        Map<String, Boolean> result = new HashMap<>(); // map에 저장해서 정보 조회
        result.put("idExists", storeService.checkIdExists(code_id));
        result.put("valueExists", storeService.checkValueExists(code_value));
        return result;
    }

    // 상세코드 중복 검사
    @PostMapping("/store/checkDetailCode")
    @ResponseBody
    public Map<String, Boolean> checkDetailCode(@RequestParam("code_id") String codeId, 
                                                @RequestParam("detail_code") String detailCode, 
                                                @RequestParam("detail_value") String detailValue) {
        Map<String, Boolean> result = new HashMap<>(); // map에 저장해서 정보 조회
        result.put("detailCodeExists", storeService.checkDetailCodeExists(codeId, detailCode));
        result.put("detailValueExists", storeService.checkDetailValueExists(codeId, detailValue));
        return result;
    }

	
	// -----------------------------------------------------------------
 
	@PostMapping("/store/removeFromCart") // 장바구니에서 삭제
 	@ResponseBody
    public String removeFromCart(@RequestBody CartDTO cartDTO) {
        try {
            // storeService의 deleteCartItem 메서드를 호출하여 장바구니에서 삭제
            storeService.deleteCartItem(cartDTO.getCart_num(), cartDTO.getMember_num());
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }
 
	@PostMapping("/store/updateCartQuantity") // 장바구니 수량 변경
	@ResponseBody
	public String updateCartQuantity(@RequestBody Map<String, Object> requestData) {
	    int cartNum = Integer.parseInt(requestData.get("cart_num").toString());
	    int newQuantity = Integer.parseInt(requestData.get("cart_quantity").toString());

	    try {
	        storeService.updateCartQuantity(cartNum, newQuantity);
	        return "success";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "fail";
	    }
	}
	
	@PostMapping("/store/processPayment") // 결제 진행
    @ResponseBody
    public String processPayment(@RequestBody StorePaymentDTO paymentDTO) {
        try {
            storeService.processPayment(paymentDTO);
            
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }
	
 
}
