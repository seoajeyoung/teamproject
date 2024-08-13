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
public class KMDBApiService {

    @Autowired
    private RestTemplate restTemplate;

    private static final String API_KEY = "A8G1055F5UHV7VQ9533B";
    private static final String KMDB_API_URL = "https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&listCount=500&ServiceKey=" + API_KEY;

    public List<MovieResponse> fetchMovies(String releaseDts, String releaseDte) {
        List<MovieResponse> movieResponses = new ArrayList<MovieResponse>();
        String url = String.format("%s&releaseDts=%s&releaseDte=%s", KMDB_API_URL, releaseDts, releaseDte);
        
        //올바른 API url인지 확인
        System.out.println("URL : " + url);
        
        try {
        	// RestTemplate을 사용하여 지정된 URL로 GET 요청
            String response = restTemplate.getForObject(url, String.class);
            
            // 받아온 JSON 응답을 ObjectMapper를 사용하여 JsonNode로 변환
            // ObjectMapper: JSON 데이터를 Java 객체로 변환하는 Jackson 라이브러리의 주요 클래스
            // rootNode: JSON 응답의 루트 노드
            ObjectMapper mapper = new ObjectMapper();
            JsonNode rootNode = mapper.readTree(response);
            
            // "Data"라는 이름의 자식 노드를 찾기
            JsonNode dataArray = rootNode.path("Data");
            for (JsonNode dataNode : dataArray) {
            	// data 노드의 Result 배열
                JsonNode resultArray = dataNode.path("Result");
                for (JsonNode resultNode : resultArray) {
                	
                	// 해당 DTO 객체 생성 후 담기
                    MovieResponse movieResponse = new MovieResponse();
                    
                    // result 노드에서 title배열을 찾고 title 값을 문자열로 변환 후 movieResponse.setTitle
                    movieResponse.setTitle(resultNode.path("title").asText());
                    movieResponse.setTitleEng(resultNode.path("titleEng").asText());
                    movieResponse.setDirectorNm(resultNode.path("directors").path("director").get(0).path("directorNm").asText());
                    // movieResponse.setActorNm(resultNode.path("actors").path("actor").get(0).path("actorNm").asText());
                    movieResponse.setNation(resultNode.path("nation").asText());
                    movieResponse.setGenre(resultNode.path("genre").asText());
                    movieResponse.setPlot(resultNode.path("plots").path("plot").get(0).path("plotText").asText());
                    movieResponse.setRuntime(resultNode.path("runtime").asText());
                    movieResponse.setRating(resultNode.path("ratings").path("rating").get(0).path("ratingGrade").asText());
                    movieResponse.setReleaseDate(resultNode.path("ratings").path("rating").get(0).path("releaseDate").asText());
                    movieResponse.setPosterUrl(resultNode.path("posters").asText());
                    movieResponse.setVodUrl(resultNode.path("vods").path("vod").get(0).path("vodUrl").asText());
                                        
                    
                    // stlls 필드를 받아와서 %7C 기준으로 나누기
                    String stlls = resultNode.path("stlls").asText();

                    // %7C를 기준으로 분할
                    String[] stillUrls = stlls.split("\\|");

                    // 분할된 URL들을 ", "로 연결
                    String joinedStillUrls = String.join(", ", stillUrls);

                    // movieResponse의 posterUrl에 설정
                    movieResponse.setStillUrl(joinedStillUrls);
                    
                    
                    movieResponse.setAudiAcc(resultNode.path("stat").path("audiAcc").asText());
                    movieResponse.setThemeSong(resultNode.path("themeSong").asText());
                    movieResponse.setSoundtrack(resultNode.path("soundtrack").asText());
                    movieResponse.setAwards1(resultNode.path("Awards1").asText());
                    
                    // actorNm의 경우 여러명이기 때문에 actors 노드의 actor 배열을 찾고 
                    StringBuilder actorNames = new StringBuilder();
                    JsonNode actorsArray = resultNode.path("actors").path("actor");
                    for(JsonNode actorNode : actorsArray ) {
                    	// actor노드의 actorNm배열을 찾아서 그 모든 값을 반복문을 통해 찾아서 콤마(,)로 구분하여 저장
                    	String actorNm = actorNode.path("actorNm").asText();
                        if (actorNames.length() > 0) {
                            actorNames.append(", ");
                        }
                        actorNames.append(actorNm);
                    }
                    
                    // 배우이름 전부 잘 나오는지 확인
                    // System.out.println("Actor Names: " + actorNames.toString());
                    movieResponse.setActorNm(actorNames.toString());
                    
                    // 파싱된 movieResponse 객체를 리스트에 추가
                    movieResponses.add(movieResponse);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return movieResponses;
    }
}
