package com.itwillbs.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.MovieResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@Service
public class KobisApiService {

	@Autowired
	private RestTemplate restTemplate;

	private static final String API_KEY = "6a0692634ee3580edc52c38d43334960";
	private static final String Kobis_API_URL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key="
			+ API_KEY;

	public List<MovieResponse> fetchMovies(String targetDt) {
		List<MovieResponse> movieResponses = new ArrayList<MovieResponse>();
		String url = String.format("%s&targetDt=%s", Kobis_API_URL, targetDt);

		// 올바른 API url인지 확인
//		System.out.println("URL : " + url);

		try {
			// RestTemplate을 사용하여 지정된 URL로 GET 요청
			String response = restTemplate.getForObject(url, String.class);

			// 받아온 JSON 응답을 ObjectMapper를 사용하여 JsonNode로 변환
			// ObjectMapper: JSON 데이터를 Java 객체로 변환하는 Jackson 라이브러리의 주요 클래스
			// rootNode: JSON 응답의 루트 노드
			ObjectMapper mapper = new ObjectMapper();
			JsonNode rootNode = mapper.readTree(response);

			// "Data"라는 이름의 자식 노드를 찾기
			JsonNode boxOfficeResultNode = rootNode.path("boxOfficeResult");
			JsonNode weeklyBoxOfficeListArray = boxOfficeResultNode.path("weeklyBoxOfficeList");
			for (JsonNode weeklyBoxOfficeListNode : weeklyBoxOfficeListArray) {
				MovieResponse movieResponse = new MovieResponse();
				movieResponse.setMovieNm(weeklyBoxOfficeListNode.path("movieNm").asText());
				movieResponse.setRank(weeklyBoxOfficeListNode.path("rank").asText());
				movieResponses.add(movieResponse);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return movieResponses;
	}
}
