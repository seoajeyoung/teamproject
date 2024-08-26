package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CartDTO;
import com.itwillbs.domain.CodeDTO;
import com.itwillbs.domain.CodeDetailDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.StoreDTO;
import com.itwillbs.domain.StorePaymentDTO;

@Repository
public class StoreDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.StoreMapper";
	
	// 상품목록 조회 select
	public List<StoreDTO> getProduct() { 
		
		return sqlSession.selectList(namespace + ".getProduct");
	}
	
	// 카테고리에 해당하는 상품목록 조회 select
	public List<StoreDTO> productCategory(String category) { 
        
        return sqlSession.selectList(namespace + ".productCategory", category);
    }
	
	// 상품번호에 해당하는 상품 select
	public StoreDTO getProductByNum(String st_num) { 
        
		return sqlSession.selectOne(namespace + ".getProductByNum", st_num);
	}
	
	// 장바구니에 상품 추가
    public void addCart(CartDTO cartDTO) {
        sqlSession.insert(namespace + ".addCart", cartDTO);
    }

    // 특정 사용자의 특정 상품 장바구니 항목 조회 (중복 체크용)
    public CartDTO getUserCart(String member_num, String st_num) {
        Map<String, Object> params = new HashMap<>();
        params.put("member_num", member_num);
        params.put("st_num", st_num);
        return sqlSession.selectOne(namespace + ".getUserCart", params);
    }

    // 장바구니 항목 업데이트 (수량 수정, 같은 상품 추가했을 때)
    public void updateCartItem(CartDTO cartItem) {
        sqlSession.update(namespace + ".updateCartItem", cartItem);
    }

    // 장바구니 항목 조회
    public List<CartDTO> getCartItem(String member_num) {
        return sqlSession.selectList(namespace + ".getCartItem", member_num);
    }
    
    //---------------------메뉴코드 관련--------------------------------
    
    // 대분류 코드추가
	public void addCode(CodeDTO codeDTO) {
		
		sqlSession.insert(namespace + ".addCode", codeDTO);
		
	}

	// 상세분류 코드추가
	public void addDetailCode(CodeDetailDTO codeDetailDTO) {
		
		sqlSession.insert(namespace + ".addDetailCode", codeDetailDTO);
	}
	
	// 대분류 코드목록조회
	public List<CodeDTO> getCodeList() {
		
		return sqlSession.selectList(namespace + ".getCodeList");
	}

	// 상세분류 코드목록조회
	public List<CodeDetailDTO> getCodeDetail() {
		
		return sqlSession.selectList(namespace + ".getCodeDetail");
	}
	
	//대분류 코드 삭제
	public boolean deleteCategory(String code_num) {
	    
	    // SQL 세션을 통해 'deleteCode' 쿼리를 실행하고 영향을 받은 행 수를 반환
	    int rowsAffected = sqlSession.delete(namespace + ".deleteCategory", code_num);
	    
	    // 영향을 받은 행 수가 0보다 크면 삭제가 성공적으로 이루어진 것
	    return rowsAffected > 0;
	}
	
    // 상세분류 코드 삭제
	public boolean deleteCode(String detail_code_num) {
	    
	    // SQL 세션을 통해 'deleteCode' 쿼리를 실행하고 영향을 받은 행 수를 반환
	    int rowsAffected = sqlSession.delete(namespace + ".deleteCode", detail_code_num);
	    
	    // 영향을 받은 행 수가 0보다 크면 삭제가 성공적으로 이루어진 것
	    return rowsAffected > 0;
	}

	
	// 메뉴값 구하기 위함
	public List<CodeDetailDTO> getCategories(String code_id) {
		
		return sqlSession.selectList(namespace + ".getCategories", code_id);
	}
	
	// 대분류 코드 중복확인용
	public boolean codeIdExists(String code_id) {
        int count = sqlSession.selectOne(namespace + ".countCodeId", code_id);
        return count > 0;
    }

    public boolean codeValueExists(String code_value) {
        int count = sqlSession.selectOne(namespace + ".countCodeValue", code_value);
        return count > 0;
    }

    public boolean detailCodeExists(String codeId, String detailCode) {
        Map<String, Object> params = new HashMap<>();
        params.put("codeId", codeId);
        params.put("detailCode", detailCode);
        int count = sqlSession.selectOne(namespace + ".countDetailCode", params);
        return count > 0;
    }

    public boolean detailValueExists(String codeId, String detailValue) {
        Map<String, Object> params = new HashMap<>();
        params.put("codeId", codeId);
        params.put("detailValue", detailValue);
        int count = sqlSession.selectOne(namespace + ".countDetailValue", params);
        return count > 0;
    }
	
	//-------------------------------------------------------------
	
	// 결제 정보 생성
	public void insertPayment(StorePaymentDTO paymentDTO) throws Exception {
	    for (int i = 0; i < paymentDTO.getSt_num().size(); i++) {
	        final int index = i;  // 'i'를 'index'라는 새로운 변수에 할당
	        
	        sqlSession.insert(namespace + ".insertPayment", new HashMap<String, Object>() {{
//	            put("imp_uid", paymentDTO.getImp_uid());
//	            put("merchant_uid", paymentDTO.getMerchant_uid());
	            put("member_num", paymentDTO.getMember_num());
	            put("st_num", paymentDTO.getSt_num().get(index));
	            put("cart_quantity", paymentDTO.getCart_quantity().get(index));
	            put("cart_num", paymentDTO.getCart_num().get(index));
	        }});
	    }
	}
	
	// 장바구니에서 상품 삭제
	public void deleteCart(String cart_num, String member_num) {
		Map<String, Object> params = new HashMap<>();
        params.put("member_num", member_num);
        params.put("cart_num", cart_num);
        sqlSession.delete(namespace + ".deleteCart", params);
		
	}
	
	// 결제완료 후 장바구니 삭제
	public void deleteMemberCart(String member_num) {
		
		sqlSession.delete(namespace + ".deleteMemberCart", member_num);
	}

	// member_num 구하기 위함
	public MemberDTO getMemberInfo(String member_num) {
		
		return sqlSession.selectOne(namespace + ".getMemberInfo", member_num);
	}

	// 장바구니 상품수량 변경
	public void updateCartQuantity(int cartNum, int newQuantity) {
		
        // Map을 사용하여 파라미터를 전달
        Map<String, Object> params = new HashMap<>();
        params.put("cart_num", cartNum);
        params.put("cart_quantity", newQuantity);
        
        sqlSession.update(namespace + ".updateCartQuantity", params);
	
	}
	
	
}
