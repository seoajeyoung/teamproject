<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OSTicket - MyInfo</title>
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
<script>
function confirmRespite() {
    if (confirm("회원정보는 6개월 후 완전 파기됩니다. 정말 탈퇴하시겠습니까?")) {
        document.getElementById('respiteForm').submit();
    }
    // 취소를 누르면 아무 일도 일어나지 않음
}
</script>	
</head>

<body>
	<div id="contaniner" class="">
		<!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
		<jsp:include page="/WEB-INF/views/ticket/top.jsp" />


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
										결제 내역<i></i>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/movie/bookmarkMovie">나의 선호 영화<i></i>
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
										<h3 class="h3_tit">기본정보</h3>
										<div class="info">
											<a href="${pageContext.request.contextPath}/mypage/myupdate"
												class="btn btn_sm"><span class="arr">내정보수정</span></a>
										</div>
									</div>
									<div class="table_col">
										<table>
											<colgroup>
												<col style="width: 25%">
												<col>
											</colgroup>
											<tbody>


												<tr class="input">
													<th scope="row">이름</th>
													<td style="padding-top: 20px;">
														<div class="input_group"
															style="display: flex; justify-content: center; align-items: center;">
															<span id="hg_nm_area" style="width: 560px;">${mypageDTO.member_name}</span>
														</div>
													</td>
												</tr>

												<tr>
													<th scope="row">아이디</th>
													<td style="padding-top: 20px;"><span id="mbr_id_area">${sessionScope.member_id}</span></td>
												</tr>

												<tr class="input">
													<th scope="row"><label for="birth_yy">생년월일</label></th>
													<td style="padding-top: 20px;"><span class="w120 "
														data-skin="form"> <fmt:formatDate
																value="${member_birth}" pattern="yyyy년 MM월 dd일" />
													</span></td>
												</tr>
												<tr>
													<th scope="row">성별</th>
													<td style="padding-top: 20px;"><span id="mbr_id_area">${mypageDTO.member_gender}</span></td>
												</tr>
												<tr class="input">
													<th scope="row" style="padding-top: 27px;"><label
														for="mob_no_1">휴대전화번호</label></th>
													<td style="padding-top: 27px;">
														<div>
															<span class="input w100 phon_write" id="mobileNoInfo">${mypageDTO.member_phone}</span>
														</div>
													</td>
												</tr>
												<tr class="input">
													<th scope="row"><label for="email_addr1">이메일</label></th>
													<td style="padding-top: 20px;">
														<div class="email_write" style="width: 560px;">
															${mypageDTO.member_email}</div>
													</td>
												</tr>

												<tr>
													<th scope="row">주소</th>
													<td style="padding-top: 20px;"><span id="mbr_id_area">${mypageDTO.member_address}</span></td>
												</tr>
												<tr>
													<th scope="row">가입날짜</th>
													<td style="padding-top: 20px;"><span id="mbr_id_area">${mypageDTO.member_input}</span></td>
												</tr>
												<tr>
													<th scope="row">회원등급</th>
													<td style="padding-top: 20px; padding-right: 0px;"><span
														id="mbr_id_area">${mypageDTO.member_grade}</span><a
														href="${pageContext.request.contextPath}/mypage/mypoint"
														class="btn btn_sm" style="margin-left: 15px;"><span
															class="arr">포인트내역</span></a></td>
												</tr>

											</tbody>
										</table>
										<!-- 										<div class="btn_sec btn_center"> -->
										<!-- 											<button type="button" class="btn" id="btn_cancel">취소</button> -->
										<!-- 											<button type="button" class="btn btn_em" id="btn_submit">수정</button> -->
										<!-- 	
																			</div> -->
										<br>
										<div style="float: right;">
										<form id="respiteForm" action="${pageContext.request.contextPath}/mypage/mydelete" method="post">
												<input type="hidden" name="member_id"
													value="${mypageDTO.member_id}">
												<button type="button" class="btn btn_sm"
													onclick="confirmRespite()">
													<span class="arr">회원탈퇴</span>
												</button>
											</form>
										</div>
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
</body>
</html>