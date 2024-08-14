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
import com.itwillbs.domain.StoreDTO;

@Repository
public class StoreDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.StoreMapper";

	public List<StoreDTO> getProduct() {
		System.out.println("StoreDAO getProduct()");
		
		return sqlSession.selectList(namespace + ".getProduct");
	}
	
	public List<StoreDTO> productCategory(String category) {
        System.out.println("StoreDAO productCategory()");
        
        return sqlSession.selectList(namespace + ".productCategory", category);
    }

	public StoreDTO getProductByNum(String st_num) {
        System.out.println("StoreDAO getProductByNum()");
        
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

    // 장바구니 항목 업데이트 (수량 수정)
    public void updateCartItem(CartDTO cartItem) {
        sqlSession.update(namespace + ".updateCartItem", cartItem);
    }

    // 장바구니 항목 조회
    public List<CartDTO> getCartItem(String member_num) {
        return sqlSession.selectList(namespace + ".getCartItem", member_num);
    }

	public void addCode(CodeDTO codeDTO) {
		System.out.println("storeDAO addCode()");
		
		sqlSession.insert(namespace + ".addCode", codeDTO);
		
	}


	public void addDetailCode(CodeDetailDTO codeDetailDTO) {
		System.out.println("storeDAO addDetailCode()");
		
		sqlSession.insert(namespace + ".addDetailCode", codeDetailDTO);
	}
	
	public List<CodeDTO> getCodeList() {
		System.out.println("storeDAO getCodeList()");
		
		return sqlSession.selectList(namespace + ".getCodeList");
	}

	public List<CodeDetailDTO> getCodeDetail() {
		System.out.println("storeDAO getCodeDetail()");
		
		return sqlSession.selectList(namespace + ".getCodeDetail");
	}
    
	public boolean deleteCode(String detail_code_num) {
	    System.out.println("storeDAO deleteCode()");
	    
	    // SQL 세션을 통해 'deleteCode' 쿼리를 실행하고 영향을 받은 행 수를 반환
	    int rowsAffected = sqlSession.delete(namespace + ".deleteCode", detail_code_num);
	    
	    // 영향을 받은 행 수가 0보다 크면 삭제가 성공적으로 이루어진 것
	    return rowsAffected > 0;
	}

	public CodeDTO codeIdCheck(String code_id) {
		System.out.println("storeDAO codeIdCheck()");
		
		return sqlSession.selectOne(namespace + ".codeIdCheck", code_id);
	}
	
	public CodeDTO codeValCheck(String code_value) {
		System.out.println("storeDAO codeValCheck()");
		
		return sqlSession.selectOne(namespace + ".codeValCheck", code_value);
	}
	
	public CodeDetailDTO codeDetailCheck(CodeDetailDTO codeDetailDTO) {
		System.out.println("storeDAO codeDetailCheck()");
		
		return sqlSession.selectOne(namespace + ".codeDetailCheck", codeDetailDTO);
	}

	public List<CodeDetailDTO> getCategories(String code_id) {
		System.out.println("storeDAO getCategories()");
		
		return sqlSession.selectList(namespace + ".getCategories", code_id);
	}
}
