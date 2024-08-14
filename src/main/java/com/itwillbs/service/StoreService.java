package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.StoreDAO;
import com.itwillbs.domain.CartDTO;
import com.itwillbs.domain.CodeDTO;
import com.itwillbs.domain.CodeDetailDTO;
import com.itwillbs.domain.StoreDTO;

@Service
public class StoreService {
	
	@Inject
	private StoreDAO storeDAO;

	public List<StoreDTO> getProduct() {
		System.out.println("StoreService getProduct()");
			
		return storeDAO.getProduct();
	}
	
	
	public List<StoreDTO> productCategory(String category) {
	    System.out.println("StoreService productCategory()");
	    
	    return storeDAO.productCategory(category);
	}


	public StoreDTO getProductByNum(String st_num) {
		System.out.println("StoreService getProductByNum()");
		
	    return storeDAO.getProductByNum(st_num);
	}
	
	public void addCart(CartDTO cartDTO) {
		System.out.println("StoreService addCart()");
		System.out.println(cartDTO);
		// 중복 항목 체크
        CartDTO cartDTO2 = storeDAO.getUserCart(cartDTO.getMember_num(), cartDTO.getSt_num());

        if (cartDTO2 != null) {
        	int quantity = Integer.parseInt(cartDTO2.getCart_quantity()) + Integer.parseInt(cartDTO.getCart_quantity());
            cartDTO2.setCart_quantity(String.valueOf(quantity));
            storeDAO.updateCartItem(cartDTO2);
        } else {
            // 장바구니에 동일한 상품이 없는 경우, 새로 추가
            storeDAO.addCart(cartDTO);
        }
    }

    // 장바구니 항목 조회
    public List<CartDTO> getCartItem(String member_num) {
    	
        return storeDAO.getCartItem(member_num);
    
	}


	public void addCode(CodeDTO codeDTO) {
		System.out.println("StoreService addCode()");
		System.out.println(codeDTO);
		storeDAO.addCode(codeDTO);
	}


	public void addDetailCode(CodeDetailDTO codeDetailDTO) {
		System.out.println("StoreService addCode()");
		System.out.println(codeDetailDTO);
		storeDAO.addDetailCode(codeDetailDTO);
		
	}

	public List<CodeDTO> getCodeList() {
		System.out.println("StoreService getCodeList()");
		
		return storeDAO.getCodeList();
	}

	public List<CodeDetailDTO> getCodeDetail() {
		System.out.println("StoreService getCodeDetail()");
		
		return storeDAO.getCodeDetail();
	}


	public boolean deleteCode(String detail_code_num) {
	    System.out.println("StoreService deleteCode()");
	    
	    return storeDAO.deleteCode(detail_code_num);
	}
	
	public CodeDTO codeIdCheck(String code_id) {
		System.out.println("StoreService codeIdCheck()");
		
		return storeDAO.codeIdCheck(code_id);
	}
	
	public CodeDTO codeValCheck(String code_value) {
		System.out.println("StoreService codeValCheck()");
		
		return storeDAO.codeValCheck(code_value);
	}
	
	public CodeDetailDTO codeDetailCheck(CodeDetailDTO codeDetailDTO) {
		System.out.println("StoreService codeDetailCheck()");
		
		return storeDAO.codeDetailCheck(codeDetailDTO);

	}
}
