package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.StoreDAO;
import com.itwillbs.domain.StoreDTO;

@Service
public class StoreService {
	
	@Inject
	private StoreDAO storeDAO;

	public List<StoreDTO> getProduct() {
		System.out.println("StoreService getProduct()");
			
		return storeDAO.getProduct();
	}
	
	
	public List<StoreDTO> getProductsByCategory(String category) {
	    System.out.println("StoreService getProductsByCategory()");
	    return storeDAO.getProductsByCategory(category);
	}

	
	
}
