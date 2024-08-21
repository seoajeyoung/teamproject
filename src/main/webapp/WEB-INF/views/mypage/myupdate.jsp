<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage/mytest.jsp</title>
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/base.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/participate.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/customer.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/content.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/giftstore.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/layout.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/module.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/reset.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/newinsert.css"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

</head>
<body>
	<div id="contaniner" class="">
		<!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->


		<!-- Contents Area -->
		<div id="contents" class="">

			<!-- Contents Start -->

			<!-- Contents Area -->
			<div id="contents">
				<!-- Contents Start -->
				<div class="cols-content">

					<div class="col-aside">
						<h2>MYPAGE 메뉴</h2>
						<div class="snb">
							<ul>
								<li class="on"><a
									href="${pageContext.request.contextPath}/mypage/mymain">MY
										OSTicket HOME<i></i>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/mypage/myinfo">나의
										정보<i></i>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/mypage/mypayment">나의
										결제내역<i></i>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/inquiry/often"
									title="현재선택">자주찾는 질문<i></i></a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/inquiry/write">1 :
										1 문의하기<i></i>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/inquiry/list">문의/답변<i></i></a></li>
							</ul>
						</div>
						<div class="ad-area">
							<div class="ad-partner01">
								<iframe
									src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@C_Rectangle"
									width="160" height="300" title="기업광고-하나TV쇼핑" frameborder="0"
									scrolling="no" marginwidth="0" marginheight="0"
									name="C_Rectangle" id="C_Rectangle"></iframe>
							</div>
							<div class="ad-partner02">
								<iframe
									src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@Image_text"
									width="160" height="35" title="영화광고-꾸뻬씨의행복여행" frameborder="0"
									scrolling="no" marginwidth="0" marginheight="0"
									name="Image_text" id="Image_text"></iframe>
							</div>
						</div>
					</div>
					<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
					<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
					<div class="col-detail">
						<div class="cont_area">
							<div class="mypage_sec">
								<div class="member_info">
									<!-- 기본정보 -->
									<div class="table_header">
										<h3 class="h3_tit">나의 정보 수정</h3>
										<div class="info"></div>
									</div>
									<div class="table_col">
									<form action="${pageContext.request.contextPath}/mypage/myupdatePro" method="post">
									<input type="hidden" name="member_id" value="${sessionScope.member_id}">
										<table>
											<colgroup>
												<col style="width: 25%">
												<col>
											</colgroup>
											<tbody>
							

												<tr class="input">
													<th scope="row">이름</th>
													<td style="padding-top: 20px;"><span
														class="input_txt w330" style="padding-right: 100px;">
															<input type="text" id="name" name="member_name" class="text"
															value="${mypageDTO.member_name}">
													</span></td>
												</tr>
												<tr>
													<th scope="row">아이디</th>
													<td style="padding-top: 20px; padding-right: 140px;"><span
														id="mbr_id_area">${sessionScope.member_id}</span></td>
												</tr>
												<tr>
													<th scope="row">비밀번호</th>
													<td style="padding-top: 18px;"><span
														class="input_txt w330" style="padding-right: 100px;">
															<input type="password" id="originalpwd" name="originalpwd" class="text"
															placeholder="비밀번호를 입력해주세요." title="비밀번호" maxlength="20">
													</span></td>
												</tr>
												<tr>
													<th scope="row" style="padding-top: 30px;">비밀번호 변경</th>
													<td style="padding-top: 18px;"><span
														class="input_txt w330" style="padding-right: 100px;">
															<input type="password" id="changepwd" name="member_pass" class="text"
															placeholder="변경할 비밀번호를 입력해주세요." title="비밀번호"
															maxlength="20">
													</span><br> <span class="passhint"
														style="padding-right: 25px;">(영문, 숫자, 특수문자를 하나 이상
															포함해야 합니다.(5~20자))</span></td>
												</tr>
												<tr>
													<th scope="row" style="padding-top: 39px;">비밀번호 확인</th>
													<td style="padding-top: 18px; padding-bottom: 10px;"><span
														class="input_txt w330" style="padding-right: 100px;">
															<input type="password" id="changepwdcheck" name="member_passcheck" class="text"
															placeholder="변경할 비밀번호를 확인해주세요." title="비밀번호"
															maxlength="20">
													</span><br> <span class="passhint"
														style="padding-right: 25px;">(영문, 숫자, 특수문자를 하나 이상
															포함해야 합니다.(5~20자))</span><br> <span id="password-match-hint"
														style="padding-right: 270px;"></span></td>
												</tr>
												<tr class="input">
													<th scope="row"><label for="birth_yy">생년월일</label></th>
													<td style="padding-top: 20px; padding-right: 120px;"><span
														class="w120 " data-skin="form"> <fmt:formatDate
																value="${member_birth}" pattern="yyyy년 MM월 dd일" />
													</span></td>
												</tr>
												<tr>
													<th scope="row">성별</th>
													<td style="padding-top: 20px; padding-right: 140px;">
														<div class="reg_content radio_area">
															<c:if test="${mypageDTO.member_gender eq '남' }">
																<input type="radio" class="css-radio" id="mmm_lbl"
																	name="member_gender" value="남" checked>
																<label for="mmm_lbl">남</label>
																<input type="radio" class="css-radio" id="www_lbl"
																	name="member_gender" value="여">
																<label for="www_lbl">여</label>
															</c:if>
															<c:if test="${mypageDTO.member_gender eq '여' }">
																<input type="radio" class="css-radio" id="mmm_lbl"
																	name="member_gender" value="남">
																<label for="mmm_lbl">남</label>
																<input type="radio" class="css-radio" id="www_lbl"
																	name="member_gender" value="여" checked>
																<label for="www_lbl">여</label>
															</c:if>
														</div>
													</td>
												</tr>
												<tr class="input">
													<th scope="row" style="padding-top: 24px;"><label
														for="mob_no_1">휴대전화번호</label></th>

													<td style="padding-top: 27px;">
														<div>
															<span class="input_txt w100 phon_write"
																style="padding-right: 100px;" id="mobileNoInfo"><input
																type="text" id="phone" class="text" name="member_phone"
																value="${mypageDTO.member_phone}"></span>
														</div>
													</td>
												</tr>
												<tr class="input">
													<th scope="row"><label for="email_addr1">이메일</label></th>
													<td style="padding-top: 20px;">

														<div class="textForm emailContainer">
															<input id=email name="email_username" type="text"
																class="email"> @ <input name="email_domain"
																type="text" class="emailDomain" id="emailDomain">
															<select class="domainList" id="domainList">
																<option value="">직접 입력</option>
																<option value="naver.com">naver.com</option>
																<option value="gmail.com">gmail.com</option>
																<option value="daum.net">daum.net</option>
															</select>
														</div>
														<input type="hidden" name="member_email" id="completeEmail">

													</td>
												</tr>
												<tr>
													<th scope="row">주소</th>
													<td style="padding-top: 20px;"><span
														class="input_txt w100 phon_write"
														style="padding-right: 100px;" id="mobileNoInfo"><input
															type="text" id="address" class="text" name="member_address"
															value="${mypageDTO.member_address}"></span>
												</tr>
											</tbody>
										</table>
										
										<div class="btn_sec btn_center">
											<button type="button" class="btn" id="btn_cancel">취소</button>
											<button type="submit" class="btn btn_em" id="btn_submit">수정완료</button>
										</div>
										</form>
									</div>
									<!-- //기본정보 -->


								</div>
								<!--/ Contents End -->
							</div>
							<!-- /Contents Area -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
	// JavaScript로 이메일 분리 및 입력 필드에 채우기
	document.addEventListener("DOMContentLoaded", function() {
		var email = "${mypageDTO.member_email}";

		// 이메일을 @ 기준으로 분리
		var emailParts = email.split("@");

		if (emailParts.length === 2) {
			var emailUsername = emailParts[0];
			var emailDomain = emailParts[1];

			// 분리된 값을 각각의 입력 필드에 할당
			document.getElementById("email").value = emailUsername;
			document.getElementById("emailDomain").value = emailDomain;
		}
	});

	document.addEventListener("DOMContentLoaded", function() {
		var domainListElement = document.getElementById("domainList");
		var emailDomainElement = document.getElementById("emailDomain");

		// 원래 이메일 도메인 값을 저장해 둠
		var originalEmailDomain = emailDomainElement.value;

		if (domainListElement) {
			domainListElement.addEventListener("change", function() {
				var selectedDomain = this.value;

				if (selectedDomain === "") {
					// "직접 입력"을 선택하면 원래 값으로 되돌리고, readonly 속성 제거
					emailDomainElement.value = originalEmailDomain;
					emailDomainElement.removeAttribute("readonly"); // 직접 입력 가능하도록 설정
				} else {
					// 선택된 도메인 값을 입력 필드에 설정하고, 읽기 전용으로 설정
					emailDomainElement.value = selectedDomain;
					emailDomainElement.setAttribute("readonly", "readonly"); // 도메인 입력 필드를 읽기 전용으로 설정
				}
			});
		} else {
			console.error("Element with ID 'domainList' not found.");
		}
		
		// 비밀번호 패턴 정의
	    const passPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{5,20}$/;

	    // 폼 제출 시 유효성 검사 및 비밀번호 확인
	    document.querySelector('form').addEventListener('submit', function(event) {
	        event.preventDefault(); // 폼 제출 방지

	        var originalPwd = document.getElementById('originalpwd').value;
	        var changePwd = document.getElementById('changepwd').value;
	        var changePwdCheck = document.getElementById('changepwdcheck').value;

	        // 비밀번호 패턴 체크
	        if (!passPattern.test(changePwd)) {
	            alert('변경할 비밀번호는 영문, 숫자, 특수문자를 하나 이상 포함해야 하며, 5~20자 사이여야 합니다.');
	            return;
	        }

	        // 비밀번호 일치 체크
	        if (changePwd !== changePwdCheck) {
	            alert('변경할 비밀번호가 일치하지 않습니다.');
	            return;
	        }
	        
	     	// 이메일 합치기
	        var emailUsername = document.getElementById('email').value;
	        var emailDomain = document.getElementById('emailDomain').value;
	        var completeEmail = emailUsername + "@" + emailDomain;
	        document.getElementById('completeEmail').value = completeEmail;

	        // 현재 비밀번호 확인 (서버와의 일치 확인은 AJAX 요청으로 처리)
	        var formData = new FormData();
	        formData.append('originalpwd', originalPwd);

	        fetch('${pageContext.request.contextPath}/mypage/checkPassword', {
	            method: 'POST',
	            body: formData
	        })
	        .then(response => response.json())
	        .then(data => {
	            if (!data.valid) {
	                alert('현재 비밀번호가 일치하지 않습니다.');
	            } else {
	                event.target.submit(); // 비밀번호가 일치하고 모든 검사를 통과하면 폼 제출
	            }
	        })
	        .catch(error => {
	            console.error('Error:', error);
	            alert('서버와의 통신에 문제가 발생했습니다.');
	        });
	    });
	    
	    input.addEventListener('keydown', function(event) {
	        if (event.key === 'Enter') {
	            event.preventDefault();
	        }
	    });
	    
	});
	
	</script>
	<script>
		document.getElementById('changepwdcheck').addEventListener(
				'input',
				function() {
					var password = document.getElementById('changepwd').value;
					var passwordCheck = document
							.getElementById('changepwdcheck').value;
					var hintElement = document
							.getElementById('password-match-hint');

					if (password !== passwordCheck) {
						hintElement.textContent = "비밀번호 불일치";
						hintElement.style.color = "red";
					} else {
						hintElement.textContent = "비밀번호 일치";
						hintElement.style.color = "green";
					}
				});
		
	</script>
	<script>
	document.getElementById('btn_cancel').addEventListener('click', function() {
        window.history.back();
    });
	</script>
</body>
</html>