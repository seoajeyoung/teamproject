<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiry/list.jsp</title>
<link
	href="${pageContext.request.contextPath}/resources/css/customer.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/content.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/giftstore.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/layout.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/module.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
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
								빠른시간안에 답변드리겠습니다. <br>@@@TODO@@뭔가 더 할말있음 적기@@.
							</p>
						</div>
						<div class="search_area">
							<legend>
								<label for="searchtext">검색</label>
							</legend>
						<form action="${pageContext.request.contextPath}/inquiry/me" method="get" id="searchForm">
							<input id="searchtext" type="text" name="search" class="c_input" title="검색어 입력"
								placeholder="검색어를 입력해 주세요" value="" style="width: 275px;">
							<button type="button" class="round inblack" title="검색하기"
								id="btn_search">
								<span>검색하기</span>
							</button>
						</form>
							<div class="qu_txt">
								<em>추천검색어 :</em> <span class="first"> <a href="#none">현금영수증</a></span>

								<span class=""> <a href="#none">관람권</a></span> <span class="">
									<a href="#none">예매</a>
								</span> <span class=""> <a href="#none">환불</a></span> <span class="">
									<a href="#none">취소</a>
								</span> <span class=""> <a href="#none"></a></span>

							</div>
						</div>
						<div class="c_tab_wrap">
							<ul class="c_tab type_free">
								<li class="on"><a
									href="/support/faq/default.aspx?type=0&amp;searchtext="
									style="font-size: 11px;" title="선택된 탭메뉴">전체</a></li>
								<li class=""><a
									href="/support/faq/default.aspx?type=101,239&amp;searchtext="
									style="font-size: 11px;">예매/매표</a></li>
								<li class=""><a
									href="/support/faq/default.aspx?type=243&amp;searchtext="
									style="font-size: 11px;">관람권/결제수단</a></li>
								<li class=""><a
									href="/support/faq/default.aspx?type=102,240&amp;searchtext="
									style="font-size: 11px;">멤버쉽/클럽서비스</a></li>
								<li class=""><a
									href="/support/faq/default.aspx?type=1262&amp;searchtext="
									style="font-size: 11px;">VIP관련</a></li>
								<li class=""><a
									href="/support/faq/default.aspx?type=242&amp;searchtext="
									style="font-size: 11px;">할인혜택</a></li>
								<li class=""><a
									href="/support/faq/default.aspx?type=103,246&amp;searchtext="
									style="font-size: 11px;">영화관이용</a></li>
								<li class=""><a
									href="/support/faq/default.aspx?type=244&amp;searchtext="
									style="font-size: 11px;">특별관</a></li>
								<li class=""><a
									href="/support/faq/default.aspx?type=104,1259&amp;searchtext="
									style="font-size: 11px;">기프트샵</a></li>
								<li class=""><a
									href="/support/faq/default.aspx?type=105,245&amp;searchtext="
									style="font-size: 11px;">홈페이지/모바일</a></li>

							</ul>
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
											<td class="num">${inquiryDTO.AS_R}</td>
										</tr>
																								

									</tbody>
									</c:forEach>	
								<!-- 				@@@@@@@@@@@@@@@@@@@@@@@@@ -->
							</table>
						</div>
						<!--?xml version="1.0" encoding="utf-8"?-->
						<div class="paging">
						
						
							<ul>
							
								<li class="on"><a title="1 페이지 선택" href=" #pg"></a></li>
								<li>
								
<%-- 								<a href="${pageContext.request.contextPath}/inquiry/me?pageNum=${i}">${i}</a> --%>

							<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
								<a href="${pageCountext.request.contextPath}/inquiry/me?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">[이전]</a>
							</c:if>
						
							<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
								<a href="${pageContext.request.contextPath}/inquiry/me?pageNum=${i}"> ${i}</a>
							</c:forEach>
						
							<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
								<a href="${pageContext.request.contextPath}/inquiry/me?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[다음]</a>
							</c:if>

								</li>

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



<!-- <script type="text/javascript"> -->
// 				//<![CDATA[

//  (function($) {
//  	$(function() {
		
 		
 		
		
//  		$('#btn_search').on('click', function() {

//  			//                if ($('#searchtext').val() == "") {
//  			//                    alert("검색어를 입력해 주세요.");
//  			//                    $('#searchtext').focus();
//  			//                    return false;
//  			//                } else {
//  			//                    
//  			//                }

//  			Search();
			
			
//  		});
		
		
		
   	 	


// 		$('#searchtext').keypress(function(event) {
// 			if (event.which == 13) {
// 				if ($('#searchtext').val() == "") {
// 					alert("검색어를 입력해 주세요.");
// 					$('#searchtext').focus();
// 					return false;
// 				} else {

// 					Search();
// 				}
// 			}

//  		});

// 		function Search() {
// 			location.href = "/support/faq/default.aspx?searchtext="
// 					+ escape($("#searchtext").val());
// 			return false;
// 		}

// 		$('.c_tab_wrap').children('.c_tab').children('li').on(
// 				'click',
// 				function() {
// 					//$('.c_tab_wrap').children('.c_tab').children('li').removeClass("on");
// 					//$(this).addClass("on");

// 					location.href = $(this).children('a').attr(
// 							"href")
// 							+ escape("");
// 					return false;
// 				});

// 		$('.qu_txt')
// 				.children('span')
// 				.children('a')
// 				.on(
// 						"click",
// 						function() {
// 							location.href = "/support/faq/default.aspx?searchtext="
// 									+ escape($(this).html());
// 							return false;
// 						});
// 		//SR 4020337 검색어 검색 시 검색결과에서 해당 검색어 붉은색으로 변경
// 		var idx = 0;

// 		if ($('#searchtext').val()) {
// 			for (idx = 0; idx < 20; idx++) {
// 				var search = $('#searchtext').val();
// 				search = search.toUpperCase();
// 				$(
// 						"#title" + idx + " > a:contains('"
// 								+ search + "')")
// 						.each(
// 								function() {
// 									var regex = new RegExp(
// 											search, 'gi');
// 									$(this)
// 											.html(
// 													$(this)
// 															.TEXT()
// 															.REPLACE(
// 																	REGEX,
// 																	"<SPAN STYLE='COLOR:RED'>"
// 																			+ SEARCH
// 																			+ "</SPAN>"));
// 								});
// 			}
// 		}

//  	});
//  })(jQuery);

// ]]>
  </script> 


			<!--/ Contents End -->
		</div>
		<!-- /Contents Area -->
	</div>


</body>
</html>