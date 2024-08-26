package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.StoreDAO;
import com.itwillbs.domain.CartDTO;
import com.itwillbs.domain.CodeDTO;
import com.itwillbs.domain.CodeDetailDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.StoreDTO;
import com.itwillbs.domain.StorePaymentDTO;

@Service
public class StoreService {
	
	@Inject
	private StoreDAO storeDAO;

	
	public List<StoreDTO> getProduct() { // 상품목록 확인하기 위한 list
			
		return storeDAO.getProduct();
	}
	
	
	public List<StoreDTO> productCategory(String category) { // 카테고리에 해당하는 상품 확인하기 위한 list
	    
	    return storeDAO.productCategory(category);
	}


	public StoreDTO getProductByNum(String st_num) { // 상품번호에 해당하는 상품 조회
		
	    return storeDAO.getProductByNum(st_num);
	}
	
	public void addCart(CartDTO cartDTO) { // 장바구니에 추가
		// 중복 항목 체크
        CartDTO cartDTO2 = storeDAO.getUserCart(cartDTO.getMember_num(), cartDTO.getSt_num());

        if (cartDTO2 != null) {
        	int quantity = Integer.parseInt(cartDTO2.getCart_quantity()) + Integer.parseInt(cartDTO.getCart_quantity());
            cartDTO2.setCart_quantity(String.valueOf(quantity));
            storeDAO.updateCartItem(cartDTO2); // 동일한 상품이 있는 경우 수량 update
        } else {
            // 장바구니에 동일한 상품이 없는 경우, 새로 추가
            storeDAO.addCart(cartDTO);
        }
    }

    public List<CartDTO> getCartItem(String member_num) { // 장바구니 항목 조회
    	
        return storeDAO.getCartItem(member_num);
    
	}
    
    public void deleteCartItem(String cart_num, String member_num) { // 장바구니 상품 삭제
        storeDAO.deleteCart(cart_num, member_num);
    }
    
    public MemberDTO getMemberInfo(String member_num) { // 장바구니에 사용자 정보 들어갔는지 확인용
		
		return storeDAO.getMemberInfo(member_num);
	}
	
	public void updateCartQuantity(int cartNum, int newQuantity) { // 장바구니 수량 수정
	    storeDAO.updateCartQuantity(cartNum, newQuantity);
	}
	
	public void processPayment(StorePaymentDTO paymentDTO) throws Exception { // 결제
		
        storeDAO.insertPayment(paymentDTO); // 결제 진행, db에 insert
        
        storeDAO.deleteMemberCart(paymentDTO.getMember_num()); // 결제된 상품은 장바구니에서 삭제
        
    }

    // --------------------------메뉴코드 관련------------------------------------------

	public void addCode(CodeDTO codeDTO) { //  대분류 코드 추가
		storeDAO.addCode(codeDTO);
	}


	public void addDetailCode(CodeDetailDTO codeDetailDTO) { // 상세분류 코드 추가
		storeDAO.addDetailCode(codeDetailDTO);
		
	}

	public List<CodeDTO> getCodeList() { // 대분류 코드목록 조회
		
		return storeDAO.getCodeList();
	}

	public List<CodeDetailDTO> getCodeDetail() { // 상베분류 코드목록 조회
		
		return storeDAO.getCodeDetail();
	}

	public boolean deleteCategory(String code_num) { // 대분류 코드삭제
	    
	    return storeDAO.deleteCategory(code_num);
	}
	
	
	public boolean deleteCode(String detail_code_num) { // 상세분류 코드삭제
	    
	    return storeDAO.deleteCode(detail_code_num);
	}
	

	public List<CodeDetailDTO> getCategories(String code_id) { // 대분류 코드에 해당하는 상세코드 목록 조회
		
		return storeDAO.getCategories(code_id);
	}
	
	public List<CodeDetailDTO> getGlobalCategories() { // 스토어메뉴(ST)코드에 해당하는 상세코드 목록 조회
        return getCategories("ST");
    }
	
	public boolean checkIdExists(String code_id) { // 대분류코드 code_id 중복확인용
        return storeDAO.codeIdExists(code_id);
    }

    public boolean checkValueExists(String code_value) { // 대분류코드 code_value 중복확인용
        return storeDAO.codeValueExists(code_value);
    }

    public boolean checkDetailCodeExists(String codeId, String detailCode) { // 상세분류코드 code_id에 해당하는 detail_code 있는지 확인용
        return storeDAO.detailCodeExists(codeId, detailCode);
    }

    public boolean checkDetailValueExists(String codeId, String detailValue) { // 상세분류코드 code_id에 해당하는 detail_value 있는지 확인용
        return storeDAO.detailValueExists(codeId, detailValue);
    }
	
    //-------------------------------------------------------------------------
 
	

}
