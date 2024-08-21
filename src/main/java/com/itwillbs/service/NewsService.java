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

	public Map<String, Object> getNewsContent(Map<String, String> param) {
		return newsDAO.getNewsContent(param);
	}

	public Map<String, Object> NewsPrev(Map<String, String> param) {
		return newsDAO.NewsPrev(param);
	}

	public Map<String, Object> NewsNext(Map<String, String> param) {
		return newsDAO.NewsNext(param);
	}
	
	public Map<String, Object> getNewNews() {
		return newsDAO.getNewNews();
	}

	public List<Map<String, Object>> getShowNews() {
		return newsDAO.getShowNews();
	}


}
