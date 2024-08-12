package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.NewsDAO;
import com.itwillbs.domain.NewsDTO;
import com.itwillbs.domain.PageDTO;


@Service
public class NewsService {
	
	@Inject
	private NewsDAO newsDAO;
	
	public void insertNews(NewsDTO newsDTO) {
		
		if(newsDAO.getMaxNum() == null) {
			//글이 없으면 글번호가 1번부터 시작
			newsDTO.setNEWS_NUM("1");
		}else {
			//글이 있으면 max(num) + 1
			String num = Integer.toString(newsDAO.getMaxNum() + 1);
			newsDTO.setNEWS_NUM(num);
		}

		newsDTO.setNEWS_DATE(new Timestamp(System.currentTimeMillis()));
		System.out.println(newsDTO);
		newsDAO.insertNews(newsDTO);
	}//insertBoard
	
	public void updateNews(NewsDTO newsDTO) { // 업데이트 메서드
		newsDTO.setNEWS_DATE(new Timestamp(System.currentTimeMillis()));
		newsDAO.updateNews(newsDTO);
	}

	public void deleteNews(String NEWS_NUM) {
		newsDAO.deleteNews(NEWS_NUM);
	}

	public List<Map<String, Object>> getNewsList(Map<String, String> param) {
		return newsDAO.getNewsList(param);
	}

//	public int getNewsCount(PageDTO pageDTO) {
//		return newsDAO.getNewsCount(pageDTO);
//	}
	
	public int getNewsCount(Map<String, String> param) {
		return newsDAO.getNewsCount(param);
	}
	
	public Map<String, Object> getNews(String num) {
		return newsDAO.getNews(num);
	}
	
	public Map<String, Object> getNewsPrev(String num) {
		return newsDAO.getNewsPrev(num);
	}
	
	public Map<String, Object> getNewsNext(String num) {
		return newsDAO.getNewsNext(num);
	}

//	public List<Map<String, Object>> getNewsSection(Map<String, Object> param) {
//		// 시작하는 행번호
//		PageDTO pageDTO = (PageDTO) param.get("pageDTO");
//		int startRow = (pageDTO.getCurrentPage() - 1)*pageDTO.getPageSize() + 1;
////				//끝나는 행번호
//		int endRow = startRow + pageDTO.getPageSize() - 1;
////				//pageDTO 에 저장
////				// sql에서 사용할 구문 => limit startRow-1, pageSize 
//		pageDTO.setStartRow(startRow-1); //sql구문에서 하기 힘드니까 미리 -1 하기
//		pageDTO.setEndRow(endRow);
//		param.put("pageDTO", pageDTO);
//		return newsDAO.getNewsSection(param);
//	}
	

}
