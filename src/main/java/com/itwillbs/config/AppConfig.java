package com.itwillbs.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.client.RestTemplate;

@Configuration
@EnableScheduling
public class AppConfig {

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
    
//    RestTemplate은 Spring Framework에서 제공하는 클래스 중 하나로, 
//    RESTful 웹 서비스와 상호작용하기 위한 클라이언트
//    주로 외부 REST API와 통신할 때 사용
    
//    주요 기능 및 사용 사례
//    HTTP 요청 전송:
//     - GET, POST, PUT, DELETE 등의 HTTP 메서드를 사용하여 요청을 전송 가능
//     - ex) 외부 API에서 데이터를 조회하거나 서버에 데이터를 전송할 때 사용
    
//	  응답처리 :
//     - HTTP 요청에 대한 응답을 객체로 변환하여 사용 가능
//     - ex) JSON 응답을 Java 객체로 변환
    
}
