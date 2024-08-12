package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	
	public List<StoreDTO> getProductsByCategory(String category) {
        System.out.println("StoreDAO getProductsByCategory()");
        return sqlSession.selectList(namespace + ".getProductsByCategory", category);
    }
	
	
}
