<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OSTicket - MyStorePaymentList</title>
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
<script
	src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
</head>
<body>
	<div id="contaniner" class="">
		<!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->


		<!-- Contents Area -->
		<div id="contents" class="">
		<jsp:include page="/WEB-INF/views/ticket/top.jsp" />

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

					<div class="col-detail">
						<div class="customer_top">
							<h2 class="tit">나의 결제 내역</h2>
							<p class="stit">나의 영화 예매, 스토어 결제 내역을 확인할 수 있습니다.</p>
						</div>
						<div class="search_area">
							<!-- 				<legend><label for="c_select">검색</label></legend> -->
							<!-- 				<select name="selsearchfield" id="selsearchfield" class="c_select" style="width:100px;" selected="selected"> -->
							<!-- 					<option selected="selected" value="0">제목</option> -->
							<!-- 					<option value="1">내용</option> -->
							<!-- 				</select> -->
							<label for="searchtext" class="hidden">검색어 입력</label>
							<form
								action="${pageContext.request.contextPath}/mypage/mystorepayment"
								method="get" id="searchForm">
								<input id="searchtext" type="text" name="search" class="c_input"
									title="검색어 입력" placeholder="검색어를 입력해 주세요" style="width: 185px;"
									value="">
								<button type="button" class="round inblack" title="검색하기"
									id="btn_search">
									<span>검색하기</span>
								</button>
							</form>
						</div>

						<div class="c_tab_wrap">
							<ul class="c_tab" id="list">
								<li><a
									href="${pageContext.request.contextPath}/mypage/mypayment">영화</a></li>
								<li><a
									href="${pageContext.request.contextPath}/mypage/mystorepayment">스토어</a></li>
							</ul>
						</div>

						<div class="tbl_area">
							<table cellspacing="0" cellpadding="0" class="tbl_notice_list">
								<caption>목록</caption>
								<colgroup>
									<col style="width: 70px;">
									<col style="">
									<col style="width: 160px;">
									<col style="width: 140px;">
									<col style="width: 120px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">구매번호</th>
										<th scope="col">상품명</th>
										<th scope="col">상품타입</th>
										<th scope="col">구매시간</th>
										<th scope="col">비고</th>
									</tr>
								</thead>
								<tbody id="newsTableBody">
									<c:forEach var="list" items="${myStorePaymentList}">
										<tr class="first">

											<td>${list.sp_num}</td>
											<td>${list.ST_NAME}</td>
											<td>${list.ST_TYPE}</td>
											<td>${list.payment_date}</td>
											<td><a
												href="${pageContext.request.contextPath}/mypage/mystorepaymentinfo?sp_num=${list.sp_num}"
												class="round inblack" title="상세정보" id="btn_info"
												style="background: #a59f9f; border: 2px solid #a59f9f; text-decoration: none; display: inline-block; color: white;">
													<span>상세정보</span>
											</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="paging" id="pagingList">
								<a
									href="${pageContext.request.contextPath}/mypage/mystorepayment?pageNum=1&search=${pageDTO.search}"
									class="firstpage  pbtn" style="font-size: 14px;">[처음 페이지]</a>
								<c:if test="${pageDTO.currentPage > 1 }">
									<a
										href="${pageContext.request.contextPath}/mypage/mystorepayment?pageNum=${pageDTO.currentPage-1}&search=${pageDTO.search}"
										class="prevpage pbtn" style="font-size: 14px;">[이전 페이지]</a>
								</c:if>

								<c:forEach var="i" begin="${pageDTO.startPage}"
									end="${pageDTO.endPage}" step="1">

									<c:if test="${i eq pageDTO.currentPage}">
										<a
											href="${pageContext.request.contextPath}/mypage/mystorepayment?pageNum=${i}&search=${pageDTO.search}">
											<span class="pagenum currentpage" style="font-size: 14px;">${i}</span>
										</a>
									</c:if>

									<c:if test="${i ne pageDTO.currentPage}">
										<a
											href="${pageContext.request.contextPath}/mypage/mystorepayment?pageNum=${i}&search=${pageDTO.search}">
											<span class="pagenum" style="font-size: 14px;">${i}</span>
										</a>
									</c:if>
									
									&nbsp;

								</c:forEach>

								<c:if test="${pageDTO.currentPage < pageDTO.pageCount }">
									<a
										href="${pageContext.request.contextPath}/mypage/mystorepayment?pageNum=${pageDTO.currentPage+1}&search=${pageDTO.search}"
										class="nextpage  pbtn" style="font-size: 14px;">[다음 페이지]</a>
								</c:if>
								<a
									href="${pageContext.request.contextPath}/mypage/mystorepayment?pageNum=${pageDTO.pageCount > 0 ? pageDTO.pageCount : 1}&search=${pageDTO.search}"
									class="lastpage pbtn" style="font-size: 14px;">[마지막 페이지]</a>
							</div>

						</div>
						<!--?xml version="1.0" encoding="utf-8"?-->

					</div>
				</div>
				<!-- //Contents End -->
			</div>
			<!-- //Contents Area -->
			<script type="text/javascript">
				$(document).ready(function() {
					// 현재 URL 경로를 가져오기
					var currentPath = window.location.pathname;

					// 모든 탭에서 'on' 클래스 제거
					$('#list li').removeClass('on');

					// 현재 URL에 해당하는 링크를 찾아 해당 li 요소에 'on' 클래스 추가
					$('#list a').each(function() {
						var href = $(this).attr('href');
						if (href === currentPath) {
							$(this).parent('li').addClass('on');
						}
					});

					// 처음 페이지 로드 시 영화 탭에 'on' 클래스 추가 (기본 설정)
					if ($('#list li.on').length === 0) {
						$('#list li:first').addClass('on');
					}

					// 섹션 클릭 이벤트
					$('#list').on('click', 'a', function(event) {
						// 모든 탭에서 'on' 클래스 제거
						$('#list li').removeClass('on');

						// 클릭한 a 요소의 부모 li에 'on' 클래스 추가
						$(this).parent('li').addClass('on');
					});

					// 검색 버튼 클릭 이벤트
					$('#btn_search').on('click', function() {
						Search();
					});

					function Search() {
						// 폼 제출
						$('#searchForm').submit();
					}
				});
			</script>



			<!-- <script type="text/javascript"> -->


			<!-- </script> -->


			<!--/ Contents End -->
		</div>
		<!-- /Contents Area -->
	</div>
</body>
</html>