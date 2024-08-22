<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiry/list.jsp</title>
<link
	href="${pageContext.request.contextPath}/resources/css/inquiry/customer.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/inquiry/content.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/inquiry/giftstore.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/layout.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/module.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/reset.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
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
						<h2>고객센터 메뉴</h2>
						<div class="snb">
							<ul>
								<li class=""><a
									href="${pageContext.request.contextPath}/inquiry/Imain">고객센터
										메인<i></i>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/inquiry/often">자주찾는
										질문<i></i>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/inquiry/news">공지/뉴스<i></i></a></li>
								<li class="on"><a
									href="${pageContext.request.contextPath}/inquiry/write">1 :
										1 문의하기<i></i>
								</a></li>

								<li class=""><a
									href="${pageContext.request.contextPath}/inquiry/list"
									title="현재선택">문의/답변<i></i></a></li>



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
							<h2 class="tit">나의문의내역</h2>
							<p class="stit">
								빠른시간안에 답변드리겠습니다. <br>
							</p>
						</div>

						<div class="search_result">
							총<span class="num">${pageDTO.count}건</span>이 검색되었습니다.
						</div>
						<div class="tbl_area">
							<table cellspacing="0" cellpadding="0" class="tbl_notice_list">
								<caption>목록</caption>
								<colgroup>
									<col style="width: 40px;">
									<col style="width: 120px;">
									<col style="width: 560px;">
									<col style="">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">등록일</th>
										<th scope="col" class="tit">제목</th>
										<th scope="col">답변여부</th>
									</tr>
								</thead>
								<!-- 				@@@@@@@@@@@@@@@ -->
								<c:forEach var="inquiryDTO" items="${mylist}">
									<tbody>
										<tr class="first">
											<!--순번 오름차순으로 변경-->
											<!-- TODO 글쓸때 회원번호 넣고나서 수정해야됨 MEMBER_NICKNAME -->
											<td >${inquiryDTO.RN}</td>
											<td>${inquiryDTO.INQUIRY_DATE_FORMAT}</td>
											<td id="title0" class="txt"><a
												href="${pageContext.request.contextPath}/inquiry/mycontent?inquiry_num=${inquiryDTO.inquiry_num}">${inquiryDTO.inquiry_name}</a></td>
											<td class="num">${inquiryDTO.ISANSWERED}</td>
										</tr>
																								

									</tbody>
									</c:forEach>	
								<!-- 				@@@@@@@@@@@@@@@@@@@@@@@@@ -->
							</table>
						</div>
						<!--?xml version="1.0" encoding="utf-8"?-->
						<div class="paging">
						
						
							<ul>
							
<!-- 								<li class="on"><a title="1 페이지 선택" href=" #pg"></a></li> -->
								
								
<%-- 								<a href="${pageContext.request.contextPath}/inquiry/me?pageNum=${i}">${i}</a> --%>

							<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
								<a href="${pageCountext.request.contextPath}/inquiry/me?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">[이전]</a>
							</c:if>
						
							<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
								<li class="<c:out value="${i == pageDTO.currentPage ? 'on' : ''}" />">
								<a href="${pageContext.request.contextPath}/inquiry/me?pageNum=${i}"> ${i}</a></li>
							</c:forEach>
						
							<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
								<a href="${pageContext.request.contextPath}/inquiry/me?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[다음]</a>
							</c:if>

								

							</ul>
							<button class="btn-paging end" type="button"
								onclick="${pageContext.request.contextPath}/inquiry/me?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">끝</button>
						</div>
						<div class="search_order">
							<ol>
								<li><span class="ico_oder find_q">01 자주찾는 질문 검색</span></li>
								<li><span class="ico_oder email_i">02 이메일 문의</span><a
									href="/support/qna/default.aspx"><img
										src="http://img.cgv.co.kr/support/faq/btn_inquiry.png"
										alt="문의"></a></li>
								<li style="text-align: left;"><span class="ico_oder tel_i">03
										고객센터 전화문의</span><span class="num">1544-1122<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(상담가능
										시간, 월~금 09:00~18:00)
								</span></li>
							</ol>
						</div>
					</div>
				</div>
				<!-- //Contents End -->
			</div>
			<!-- //Contents Area -->

<script type="text/javascript">

$(function(){
	

$('#btn_search').on('click', function() {    
		Search();
		});
		
     function Search() {
			debugger;
	        // 폼 제출
	        $('#searchForm').submit();
	    }		

});

</script>



			<!--/ Contents End -->
		</div>
		<!-- /Contents Area -->
	</div>


</body>
</html>