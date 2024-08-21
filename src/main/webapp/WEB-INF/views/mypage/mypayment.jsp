<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage/mypayment.jsp</title>
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
							<form action="${pageContext.request.contextPath}/inquiry/news"
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
<!-- 								<li class="on"><a href="#" id="all" data-value="">전체</a></li> -->
								<li class=""><a href="#" id="SYS" data-value="SYS"
									data-name="NEWS_SECTION">영화</a></li>
								<li class=""><a href="#" id="TH" data-value="TH"
									data-name="NEWS_SECTION">스토어</a></li>
							</ul>
						</div>
						<div class="search_result">
							총<span class="num">${pageDTO.count}</span>건이 검색되었습니다.
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
										<th scope="col">번호</th>
										<th scope="col">영화명</th>
										<th scope="col" class="tit">상영관</th>
										<th scope="col">상영시간</th>
										<th scope="col">비고</th>
										<!-- 					<th scope="col">조회수</th> -->
									</tr>
								</thead>
								<!-- 				@@@@@@@@@@@@@@@ -->
								<tbody id="newsTableBody">
									<c:forEach var="newsDTO" items="${newslist}">
										<tr class="first">
											<!--순번 오름차순으로 변경-->
											<!-- TODO 글쓸때 회원번호 넣고나서 수정해야됨 MEMBER_NICKNAME -->

											<td>${newsDTO.RN}</td>
											<td>${newsDTO.NEWS_SECTION}</td>
											<td id="title0" class="txt"><a
												href="${pageContext.request.contextPath}/inquiry/newscontent?NEWS_NUM=${newsDTO.NEWS_NUM}">${newsDTO.NEWS_NAME}</a></td>
											<td>${newsDTO.NEWS_DATE}</td>
										</tr>

									</c:forEach>
								</tbody>


							</table>


						</div>
						<!--?xml version="1.0" encoding="utf-8"?-->
						<div class="paging" id="pagingList">
							<ul>
								<li class="on"><a title="1 페이지 선택" href=" #pg"></a></li>
								<li id="page"><c:if
										test="${pageDTO.startPage > pageDTO.pageBlock }">
										<a href="#"
											data-page="${pageDTO.startPage - pageDTO.pageBlock}">[이전]</a>
									</c:if> <c:forEach var="i" begin="${pageDTO.startPage}"
										end="${pageDTO.endPage}" step="1">
										<a href="#" data-page="${i}"> ${i}</a>
									</c:forEach> <c:if test="${pageDTO.endPage < pageDTO.pageCount }">
										<a href="#"
											data-page="${pageDTO.startPage + pageDTO.pageBlock }">[다음]</a>
									</c:if></li>
							</ul>
							<button class="btn-paging end" type="button"
								data-page="${pageDTO.pageCount}">끝</button>
						</div>
					</div>
				</div>
				<!-- //Contents End -->
			</div>
			<!-- //Contents Area -->

			<script type="text/javascript">
				$(function() {
					//페이지 로드 시 모든 데이터 로드
					var newsSection = ''; //$('#all').data();
					var searchtext = $('#searchtext').val();
					var pageNum = 1; // 초기 페이지 번호
					//var idValue = ''; => 왜만들었엇찌???
					loadNewsData(searchtext, newsSection, pageNum); // 기본값으로 데이터 로드

					// 페이지 버튼 클릭 이벤트
					$(document).on('click', '#page a', function(event) {
						var pageNum = $(this).data('page');// 데이터 속성에서 페이지 번호 가져오기
						var searchtext = $('#searchtext').val(); // 검색어 입력 필드에서 값 가져오기
						if (pageNum) {
							loadNewsData(searchtext, newsSection, pageNum); // 현재 검색어와 섹션으로 데이터 로드
						}
					});

					// 끝 버튼 클릭 이벤트
					$(document).on('click', '.btn-paging.end', function() {
						var pageNum = $(this).data('page'); // 데이터 속성에서 페이지 번호 가져오기
						var searchtext = $('#searchtext').val();
						if (pageNum) {
							loadNewsData(searchtext, newsSection, pageNum); // 현재 검색어와 섹션으로 데이터 로드
						}
					});

					//검색버튼
					$('#btn_search').on('click', function() {
						var searchtext = $('#searchtext').val();
						loadNewsData(searchtext, newsSection, pageNum); // ajax 호출
					});

					//관리자가 공지 작성 버튼 눌렀을 때
					$('#emailsubmit')
							.on(
									'click',
									function() {
										window.location.href = '${pageContext.request.contextPath}/inquiry/newswrite';
									});

					//섹션클릭
					$('#list').on('click', 'a', function() {
						// 현재 활성화된 섹션에서 'active' 클래스 제거
						$('#list a').removeClass('active');
						// 클릭한 섹션에 'active' 클래스 추가
						$(this).addClass('active');
						// 현재 활성화된 섹션에서 'on' 클래스 제거
						$('#list li').removeClass('on');
						// 클릭한 a 요소의 부모 li에 'on' 클래스 추가
						$(this).parent('li').addClass('on');

						searchtext = $('#searchtext').val();
						newsSection = $(this).data('value');
						if (newsSection !== 'null') {
							// 전체 버튼을 클릭했을 때 검색어를 초기화하고 전체 데이터 로드
							$('#searchtext').val(''); // 검색어 필드 초기화
							searchtext = ''; // 검색어 변수 초기화
						}
						loadNewsData(searchtext, newsSection, pageNum);//ajax호출
					});
				});//function

				//특정 섹션의 데이터 로드 함수
				function loadNewsData(searchtext, newsSection, pageNum) {
					var data = {
						"searchtext" : searchtext,
						"newsSection" : newsSection,
						"pageNum" : pageNum
					// 페이지 번호 추가
					};
					$
							.ajax({
								type : 'POST',
								url : "${pageContext.request.contextPath}/inquiry/newssection",
								data : JSON.stringify(data),
								contentType : 'application/json',
								dataType : 'json',
								success : function(result) {
									updateContent(result);
								},
								error : function(e) {
									alert("에러");
								}
							});//ajax

					//이벤트 한번만 동작하고 멈춤
					$('#list a').off('click');

				};//click

				function formatDate(dateString) { //날자 포멧
					var date = new Date(dateString);
					var year = date.getFullYear();
					var month = (date.getMonth() + 1).toString().padStart(2,
							'0');
					var day = date.getDate().toString().padStart(2, '0');
					return year + '-' + month + '-' + day;
				}

				// function Search() {
				//     // 폼 제출
				//     $('#searchForm').submit();
				// }

				function updateContent(result) {
					//$('.paging').html(result.pageContent);
					updatePaging(result.pageDTO);
					//뉴스 리스트 업데이트
					var tbody = $('#newsTableBody');
					tbody.empty(); // 기존 데이터 제거

					// 현재 검색어와 섹션 정보를 가져오기
					var searchtext = $('#searchtext').val();
					var newsSection = $('#list li.on a').data('value')// 현재 활성화된 섹션

					$
							.each(
									result.newslist,
									function(index, item) {
										var row = '<tr class="first"><td >'
												+ item.RN
												+ '</td><td>'
												+ item.NEWS_SECTION
												+ '</td>'
												+ '<td id="title0" class="txt">'
												+ '<a href="'
												+ '${pageContext.request.contextPath}/inquiry/newscontent?NEWS_NUM='
												+ item.NEWS_NUM
												+ '&searchtext='
												+ encodeURIComponent(searchtext)
												+ '&newsSection='
												+ encodeURIComponent(newsSection)
												+ '">' + item.NEWS_NAME
												+ '</a>' + '</td>' + '<td>'
												+ formatDate(item.NEWS_DATE)
												+ '</td>' + '</tr>';
										tbody.append(row);
									});

					// 카운트 작업
					var count = result.pageDTO.count; // 페이지 DTO에서 총 개수 가져오기
					$('.search_result .num').text(count); // .num 요소의 텍스트를 총 개수로 설정
					// 페이징 작업
					// 페이징 처리
					updatePaging(result.pageDTO);

				}

				function updatePaging(pageDTO) {
					const $page = $('#page');
					$page.empty();
					let pagingHtml = '';

					// "이전" 버튼
					if (pageDTO.startPage > pageDTO.pageBlock) {
						pagingHtml += '<li><a href="#" data-page="'
								+ (currentPage - 1) + '">« Prev</a></li>';
					}
					// 페이지 번호 버튼
					for (let i = pageDTO.startPage; i <= pageDTO.endPage; i++) {
						pagingHtml += '<li><a href="#" data-page="'+ i +'">'
								+ i + '</a></li>'
					}
					// [다음] 버튼
					if (pageDTO.endPage < pageDTO.pageCount) {
						pagingHtml += '<li><a href="#" data-page="'+ pageDTO.startPage + pageDTO.pageBlock +'">'
								+ '[다음]' + '</a></li>'
					}

					// 새로 생성한 페이지네이션 HTML을 삽입
					$page.html(pagingHtml); // 새로운 HTML로 교체
					//  	// "끝" 버튼
					//     const $endButton = $('.btn-paging.end');
					//     if (pageDTO.pageCount > 5) {// 페이지가 5개 이상일 때만 "끝" 버튼 활성화
					//     	$endButton
					//     	.removeAttr('disabled')
					//     	.data('page', pageDTO.pageCount) // 페이지 번호를 data 속성에 설정
					//         .attr('onclick', 'location.href="' + pageDTO.contextPath + '/inquiry/news?pageNum=' + pageDTO.pageCount + '"');
					//     }else{
					//     	$endButton
					//         .attr('disabled', true)
					//         .removeAttr('onclick');
					//     	.removeData('page'); // data 속성 제거
					//     }
					// "끝" 버튼 업데이트
					$('.btn-paging.end').attr('data-page', pageDTO.pageCount)
							.text('끝');

				}
			</script>


			<!-- <script type="text/javascript"> -->


			<!-- </script> -->


			<!--/ Contents End -->
		</div>
		<!-- /Contents Area -->
	</div>
</body>
</html>