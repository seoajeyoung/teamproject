package com.itwillbs.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final String clientId = "kI5Lk9LlaxIv_GO0bt57";

	private static final String clientSecret = "rJlw4TMlJH";

	private static final String redirectURI = "http://localhost:8080/myweb/member/callback";

	@Inject
	private MemberService memberService;

	@GetMapping("/register") // 회원가입페이지로 이동
	public String register() {
		System.out.println("MemberController register()");

		return "/member/register";
	}

	@PostMapping("/registerPro") // 회원가입페이지에 입력한 정보를 memberDTO에 저장
	public String registerPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController registerPro()");
		System.out.println(memberDTO); // 정보 들어왔나 확인
		memberService.registerMember(memberDTO);

//		session.setAttribute("member_id", memberDTO.getMember_id()); // 세션에 아이디값 저장
		return "redirect:/member/login";
	}
						
								     // 회원가입완료화면 // session에 저장된 id값으로 아이디 조회,
	@GetMapping("/naverRegister")
    public String naverRegister(HttpSession session, Model model) {
        String member_id = (String) session.getAttribute("member_id");
        MemberDTO memberDTO = memberService.getMemberId(member_id);

        if (memberDTO == null) {
            return "redirect:/error"; // 회원 정보가 없으면 에러 페이지로 이동 (버그 방지)
        }

        if (memberDTO.getMember_nickname() != null) {
            return "redirect:/main/main"; // 이미 닉네임이 설정된 경우 -> 메인 페이지로 이동
        }

        model.addAttribute("memberDTO", memberDTO);
        return "member/naverRegister"; // 새 사용자 -> 추가 정보 입력 페이지로 이동
    }

    @PostMapping("/naverRegisterPro")
    public String naverRegisterPro(MemberDTO memberDTO, HttpSession session) {
        String member_id = (String) session.getAttribute("member_id");
        MemberDTO existingMember = memberService.getMemberId(member_id);

        if (existingMember != null && existingMember.getMember_nickname() == null) {
            // 닉네임을 업데이트하고 데이터베이스에 저장
            existingMember.setMember_nickname(memberDTO.getMember_nickname()); // naverRegister에서 입력한 닉네임 네이버 정보에 저장
            memberService.saveNaverNickname(existingMember); // 업데이트된 회원 정보 DB에 저장

            session.setAttribute("member_nickname", existingMember.getMember_nickname()); // 메인 문구에 사용하기 위해 세션에 저장
            return "redirect:/member/main"; // 메인 페이지로 이동
        }

        return "redirect:/error"; // 만약 문제가 발생한다면 에러 페이지로 이동
    }
	
	@GetMapping("/login") // 로그인 페이지로 이동, 네이버 로그인 URL을 생성하여 뷰에 전달
	public String login(Model model, HttpSession session) {
		System.out.println("MemberController login");

		try {
			String redirectURIEncoded = URLEncoder.encode(redirectURI, "UTF-8"); //리다이렉트 uri 생성
			// 보안을 위해 토큰 생성
			SecureRandom random = new SecureRandom(); 
			String state = new BigInteger(130, random).toString();
			// 로그인 apiURL 생성
			String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
			apiURL += "&client_id=" + clientId;
			apiURL += "&redirect_uri=" + redirectURIEncoded;
			apiURL += "&state=" + state;
			session.setAttribute("state", state);
			model.addAttribute("naverLoginUrl", apiURL); // 모델에 추가 -> login.jsp에서 사용
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "member/login";
	}

	@PostMapping("/loginPro") // post방식, 실제 로그인 진행
	public String loginPro(MemberDTO memberDTO, HttpSession session, Model model) {
		System.out.println("MemberController loginPro()");

		MemberDTO memberDTO2 = memberService.memberCheck(memberDTO); // 로그인 처리 (아이디 비밀번호 일치하는지 정보 조회)

		if (memberDTO2 != null) {
			// 아이디 비밀번호 일치 -> 로그인표시값을 session 저장 -> /member/main 이동
			session.setAttribute("member_num", memberDTO2.getMember_num());
			session.setAttribute("member_id", memberDTO2.getMember_id());

			// /member/main 주소변경하면서 이동
			return "redirect:/main/main";
		} else {
			// 아이디 비밀번호 틀림 => 주소변경하면서 /member/login 이동
			// /member/login 주소변경하면서 이동
			model.addAttribute("errorMessage", "아이디 또는 비밀번호가 일치하지 않습니다.");
			System.out.println(memberDTO.getMember_num());
			return "member/login";
		}
	}
	// 네이버 api에 get요청을 보내고, 응답을 받아오는 메서드
	private String sendRequest(String apiURL, String header) throws IOException {
		// url을 생성하고 서버에 정보를 요청(get)
	    URL url = new URL(apiURL);
	    HttpURLConnection con = (HttpURLConnection) url.openConnection();
	    con.setRequestMethod("GET");
	    // 헤더 설정(null이 아닐 경우)
	    if (header != null) {
	        con.setRequestProperty("Authorization", header);
	    }
	    
	    int responseCode = con.getResponseCode();
	    
	    // 응답 코드 확인
	    BufferedReader br;
	    if (responseCode == 200) {
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	    } else {
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	    }
	    // 응답 내용 읽기
	    String inputLine;
	    StringBuffer response = new StringBuffer();
	    while ((inputLine = br.readLine()) != null) {
	        response.append(inputLine);
	    }
	    br.close();
	    
	    return response.toString();
	}
	
	@GetMapping("/naverLogin") // 네이버 로그인 후 사용자 정보를 가져옴
	public String naverLogin(HttpSession session, Model model) {
		System.out.println("MemberController naverLogin()");
		// 세션에서 토큰을 가져옴(네이버 api와 통신하는데 사용)
		String accessToken = (String) session.getAttribute("accessToken"); 
		if (accessToken == null) {
			return "error"; // 액세스 토큰이 없으면 에러 페이지로 리디렉션
		}
		// 네이버 API에 액세스 토큰을 이용해 사용자 정보 요청
		// HTTP 요청 헤더(추가적인 정보 제공)에 사용할 인증정보 / Bearer는 OAuth 2.0에서 사용하는 토큰 유형
		String header = "Bearer " + accessToken;
		// 네이버 API의 사용자 정보 요청 URL
		String apiURL = "https://openapi.naver.com/v1/nid/me";
		try {
			String response = sendRequest(apiURL, header);
			
			// JSON 응답을 파싱하여 사용자 정보를 Map으로 변환
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Object> userInfoMap = objectMapper.readValue(response, Map.class); // JSON -> java map
			System.out.println(userInfoMap);
			Map<String, Object> responseMap = (Map<String, Object>) userInfoMap.get("response"); // response에 해당하는 값만 
			System.out.println(responseMap); // responseMap은 네이버에서 제공하는 사용자 정보
			
			MemberDTO memberDTO = new MemberDTO(responseMap);
			session.setAttribute("member_id", memberDTO.getMember_id());
			
			
			MemberDTO existingMember = memberService.getMemberId(memberDTO.getMember_id());
			
			if (existingMember != null) {
	            if ("T".equals(existingMember.getMember_sns())) {
	                // 이미 네이버로 가입된 회원인 경우
	                session.setAttribute("userInfo", userInfoMap);
	                model.addAttribute("memberDTO", existingMember);
	                return "redirect:/member/main"; // 메인 페이지로 이동
	            } else {
	                // 이메일이 이미 사용 중이지만 다른 방법으로 가입된 경우
	                return "redirect:/member/dupError"; // 에러 페이지로 리디렉션
	            }
	        }
			
			memberDTO.setMember_sns("T"); // 첫 네이버 로그인 시에만 설정
	        memberService.registerMember(memberDTO);
		        
		    // session에 사용자 정보 저장
			session.setAttribute("userInfo", userInfoMap);
			System.out.println("naverLogin" + memberDTO.getMember_id());
			model.addAttribute("memberDTO", memberDTO);

			return "redirect:/member/naverRegister"; // 회원가입 완료 페이지로 이동

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	// 네이버 로그인 콜백 처리하고 다시 naverLogin으로 이동
	// code, state를 이용하여 토큰 요청
	@GetMapping("/callback")
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session) {
		System.out.println("MemberController callback()");
		// 엑세스 토큰을 요청하는 URL 생성
		String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=" + clientId
				+ "&client_secret=" + clientSecret + "&redirect_uri=" + redirectURI + "&code=" + code + "&state="
				+ state;

		try {
			String response = sendRequest(apiURL, null);
			
			// JSON 응답을 파싱하여 액세스 토큰을 Map으로 변환
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Object> map = objectMapper.readValue(response, Map.class);

			String accessToken = (String) map.get("access_token");
			// 액세스 토큰을 세션에 저장
			session.setAttribute("accessToken", accessToken);

			return "redirect:/member/naverLogin"; // 액세스 토큰을 세션에 저장한 후 naverLogin으로 리다이렉트

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@GetMapping("/dupError")
	public String dupError() {
		System.out.println("MemberController dupError()");
		
		return "member/dupError";
	}
	
	@GetMapping("/findId")
	public String findId() {
		System.out.println("MemberController findId()");
		
		
		return "member/findId";
	}
	
	@PostMapping("/informId")
	public String informId(MemberDTO memberDTO, Model model, RedirectAttributes redirectAttributes) {
		System.out.println("MemberController informId()");
		System.out.println(memberDTO);
		MemberDTO memberDTO2 = memberService.findId(memberDTO);
		System.out.println(memberDTO2);
		
		if (memberDTO2 != null && memberDTO2.getMember_id() != null && memberDTO2.getMember_sns() == null) {
			model.addAttribute("memberDTO2", memberDTO2);
			return "member/informId";
	    } else {
	    	redirectAttributes.addFlashAttribute("error", "입력하신 정보에 해당하는 계정이 없습니다. 네이버 계정의 경우에는 네이버 사이트의 아이디/비밀번호 찾기를 이용해 주세요.");
	        return "redirect:/member/findId";
	    }
		
		
	}
	
	@GetMapping("/findPass")
	public String findPass() {
		System.out.println("MemberController findPass()");
		
		
		return "member/findPass";
	}
	
	@PostMapping("/tempPass")
	public String tempPass(MemberDTO memberDTO, Model model, RedirectAttributes redirectAttributes) {
		System.out.println("MembmerController tempPass()");
		
		MemberDTO memberDTO2 = memberService.findPass(memberDTO);
		System.out.println(memberDTO2);
		
		if(memberDTO2 != null && memberDTO2.getMember_pass() != null) {
			String pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+[]{}|;:,.<>?";
			SecureRandom srandom = new SecureRandom();
			int length = srandom.nextInt(9) + 12; // 12에서 20 사이의 난수 생성
		
			StringBuilder stringBuilder = new StringBuilder(length);
			// 임시 비밀번호 생성
			for (int i = 0; i < length; i++) {
				int index = srandom.nextInt(pattern.length()); // pattern의 인덱스
				char randomChar = pattern.charAt(index); // 인덱스에 해당하는 문자 
				stringBuilder.append(randomChar);
			}
        
			String tempPassword = stringBuilder.toString();
			System.out.println("임시 비밀번호: " + tempPassword);
        
			memberService.getTempPass(memberDTO.getMember_id(), tempPassword);
			model.addAttribute("tempPassword", tempPassword);
			
			return "member/tempPass";
			
		}else {
			redirectAttributes.addFlashAttribute("error", "입력하신 정보에 해당하는 계정이 없습니다.");
		    return "redirect:/member/findPass"; // URL을 변경하면서 사용자 정보를 다시 입력하도록 유도
		}
		
	}

	@GetMapping("/logout") // 로그아웃 진행
	public String logout(HttpSession session) {
		System.out.println("MemberController logout()");

		session.invalidate(); // 로그아웃처리

		return "redirect:/member/main";
	}
}
