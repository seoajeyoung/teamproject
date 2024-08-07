<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiry/news.jsp</title>
<link href="${pageContext.request.contextPath}/resources/css/customer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/module.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
</head>
<body>
<div id="contaniner" class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
        

		<!-- Contents Area -->
		 <div id="contents" class="">
        
            
            <!-- Contents Start -->
			
   
<!-- Contents Area -->
<div id="contents">
	<!-- Contents Start -->
	<div class="cols-content">
		
<div class="col-aside">
    <h2> 고객센터 메뉴</h2>
    <div class="snb">
        <ul>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/Imain">고객센터 메인<i></i></a></li>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/often">자주찾는 질문<i></i></a></li>
            <li class="on"><a href="${pageContext.request.contextPath}/inquiry/news" title="현재선택">공지/뉴스<i></i></a></li>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/write">1 : 1 문의하기<i></i></a></li>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/list">문의/답변<i></i></a></li>            
        </ul>
    </div>
    <div class="ad-area">
        <div class="ad-partner01">
            <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@C_Rectangle" width="160" height="300" title="기업광고-하나TV쇼핑" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="C_Rectangle" id="C_Rectangle"></iframe>
        </div>
        <div class="ad-partner02">
            <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@Image_text" width="160" height="35" title="영화광고-꾸뻬씨의행복여행" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="Image_text" id="Image_text"></iframe>
        </div>
    </div>
</div>

		<div class="col-detail">
			<div class="customer_top">
				<h2 class="tit">공지/뉴스</h2>
				<p class="stit">CGV의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</p>
			</div>
			<div class="search_area">
<!-- 				<legend><label for="c_select">검색</label></legend> -->
<!-- 				<select name="selsearchfield" id="selsearchfield" class="c_select" style="width:100px;" selected="selected"> -->
<!-- 					<option selected="selected" value="0">제목</option> -->
<!-- 					<option value="1">내용</option> -->
<!-- 				</select> -->
				<label for="searchtext" class="hidden">검색어 입력</label>
				<form action="${pageContext.request.contextPath}/inquiry/news" method="get" id="searchForm">
					<input id="searchtext" type="text" name="search" class="c_input" title="검색어 입력" placeholder="검색어를 입력해 주세요" style="width:185px;" value="">
					<button type="button" class="round inblack" title="검색하기" id="btn_search"><span>검색하기</span></button>
				</form>
			</div>
			<c:if test="${MEMBER_NAME == 'admin'}">
				<div class="box-btn qna_email  newbox">
                	<button style="width:80px" class="round inred" type="button" id="emailsubmit"><span>뉴스/공지 등록하기</span></button>
				</div>
				
			</c:if>
<%-- 		<form action="${pageContext.request.contextPath}/inquiry/list" method="get" id="searchForm"> --%>
<!-- 						<input id="searchtext" type="text" name="search" class="c_input" title="검색어 입력" -->
<!-- 							placeholder="검색어를 입력해 주세요" value="" style="width: 275px;"> -->
<!-- 						<button type="button" class="round inblack" title="검색하기" -->
<!-- 							id="btn_search"> -->
<!-- 							<span>검색하기</span> -->
			
			
			<div class="c_tab_wrap">
				<ul class="c_tab" id="list">
					<li class="on"><a href="#" data-value="null">전체</a></li>
					<li class=""><a href="#" id="SYS" data-value="SYS" data-name="NEWS_SECTION">시스템점검</a></li>
					<li class=""><a href="#" id="TH" data-value="TH" data-name="NEWS_SECTION">극장</a></li>
					<li class=""><a href="#" id="EV" data-value="EV" data-name="NEWS_SECTION">행사/이벤트</a></li>
					<li class=""><a href="#" id="RE" data-value="RE" data-name="NEWS_SECTION">제휴이벤트</a></li>
					<li class=""><a href="#" id="ECT" data-value="ECT" data-name="NEWS_SECTION">기타</a></li>
				</ul>
			</div>
			<div class="search_result">
                  총<span class="num">${pageDTO.count}</span>건이 검색되었습니다.
			</div>
			<div class="tbl_area">
				<table cellspacing="0" cellpadding="0" class="tbl_notice_list">
				<caption>목록</caption>
				<colgroup>
					<col style="width:70px;">
                    <col style="width:160px;">
					<col style="auto;">
					<col style="width:140px;">
					<col style="width:120px">
				</colgroup>
				<thead>
					<tr>
					<th scope="col">번호</th>
                    <th scope="col">구분</th>
					<th scope="col" class="tit">제목</th>
					<th scope="col">등록일</th>
<!-- 					<th scope="col">조회수</th> -->
					</tr>
				</thead>
				<!-- 				@@@@@@@@@@@@@@@ -->
				<tbody id="newsTableBody">
					<c:forEach var="newsDTO" items="${newslist}">
					<tr class="first">
						<!--순번 오름차순으로 변경-->
						<!-- TODO 글쓸때 회원번호 넣고나서 수정해야됨 MEMBER_NICKNAME -->
						
						<td >${newsDTO.RN}</td>
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
    <li class="on">
      <a title="1 페이지 선택" href=" #pg"></a></li>
      <li>
      <c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
				<a href="${pageCountext.request.contextPath}/inquiry/news?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">[이전]</a>
			</c:if>
		
			<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
				<a href="${pageContext.request.contextPath}/inquiry/news?pageNum=${i}"> ${i}</a>
			</c:forEach>
		
			<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
				<a href="${pageContext.request.contextPath}/inquiry/news?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[다음]</a>
			</c:if>
    </li>

  </ul>
  <button class="btn-paging end" type="button" 
  onclick="${pageContext.request.contextPath}/inquiry/news?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">끝</button>  
</div>
		</div>
	</div>
	<!-- //Contents End -->
</div>
<!-- //Contents Area -->

<script type="text/javascript">


$(function(){
	//페이지 로드 시 모든 데이터 로드
	var newsSection = $('#sectionList a').first().data('value'); // 기본값을 첫 번째 링크의 data-value에서 가져옴
	var searchtext = $('#searchtext').val();
	var data = { 
			"searchtext": searchtext,
			"newsSection": newsSection
	};
    loadNewsData(data); // 기본값으로 데이터 로드
	
	$('#list').on('click', 'a',function() {
        
        var searchtext = $('#searchtext').val();
        var newsSection = $(this).data('value');
        
//         loadSectionData(newsSection).done(function(result) {
//             sectionData = result.newslist; // 선택된 섹션의 데이터를 저장
//             filterData(); // 검색어에 따라 데이터 필터링
//         });
        
		var data = { 
				"searchtext": searchtext,
				"newsSection": newsSection
		};
		
		$.ajax({
			type:'POST',
			url:"${pageContext.request.contextPath}/inquiry/newssection",
// 			data: { 
// 				searchtext: searchtext,
// 				newsSection: newsSection
// 			},
			data: JSON.stringify(data),
			contentType: 'application/json',
			dataType:'json',
			success:function(result){
				updateContent(result);
				
				
				// newsList tr td 작업
				var tbody = $('#newsTableBody');
                tbody.empty(); // 기존 데이터 제거
				$.each(result.newslist, function(index,item){
					var row =
					'<tr class="first"><td >'+item.RN+'</td><td>'+item.NEWS_SECTION+'</td>'+'<td id="title0" class="txt">'
					+ '<a href="' + '${pageContext.request.contextPath}/inquiry/newscontent?NEWS_NUM=' + item.NEWS_NUM +'">'+item.NEWS_NAME +'</a>'+'</td>'
					+ '<td>'+formatDate(item.NEWS_DATE)+'</td>'+'</tr>';
					tbody.append(row);
				});
                
                
                // 카운트 작업
                var count = result.pageDTO.count; // 페이지 DTO에서 총 개수 가져오기
           		$('.search_result .num').text(count); // .num 요소의 텍스트를 총 개수로 설정
           		
				// 페이징 작업
	            // 페이징 처리
	            
	            //$('.paging').html(a,b,c,d,e);
               
			},
			error: function(e){
				alert("에러");
			}
			
		});//ajax
		
		//이벤트 한번만 동작하고 멈춤
		$('#list a').off('click');
			
	});//click
		
	
	
	$('#emailsubmit').on('click',function(){
		window.location.href = '${pageContext.request.contextPath}/inquiry/newswrite';
	});
	
	$('#btn_search').on('click', function() {    
		Search();
	});
	
});

//특정 섹션의 데이터 로드 함수
function loadSectionData(newsSection, searchtext) {
	
	
}


function formatDate(dateString) { //날자 포멧
    var date = new Date(dateString);
    var year = date.getFullYear();
    var month = (date.getMonth() + 1).toString().padStart(2, '0');
    var day = date.getDate().toString().padStart(2, '0');
    return year + '-' + month + '-' + day;
}

function Search() {
    // 폼 제출
    $('#searchForm').submit();
}

function updateContent(result){
	$('.paging').html(result.pageContent);
	
	updatePaging(result.pageDTO);
}

function updatePaging(pageDTO) {
	const $pagingList = $('#pagingList ul');
    $pagingList.empty();
    
    // "이전" 버튼
    if (pageDTO.startPage > pageDTO.pageBlock) {
    	$pagingList.append(
    	'<li><a href='+'"${pageCountext.request.contextPath}/inquiry/news?pageNum='+ pageDTO.startPage - pageDTO.pageBlock+'">'+'[이전]'+'</a></li>'
    	);
    }
 	// 페이지 번호 버튼
    for (let i = pageDTO.startPage; i <= pageDTO.endPage; i++) {
    	$pagingList.append(
    	'<li><a href='+'"${pageContext.request.contextPath}/inquiry/news?pageNum='+ i +'">'+ i + '</a>'
    	);
    }
 	// [다음] 버튼
    if (pageDTO.endPage < pageDTO.pageCount) {
    	$pagingList.append(
    	'<li><a href='+'"${pageContext.request.contextPath}/inquiry/news?pageNum='+ pageDTO.startPage + pageDTO.pageBlock +'">'+'[다음]'+'</a></li>'		
    	);
    }
 	// "끝" 버튼
    const $endButton = $('.btn-paging.end');
    if (pageDTO.pageCount > 5) {// 페이지가 5개 이상일 때만 "끝" 버튼 활성화
    	$endButton
    	.removeAttr('disabled')
        .attr('onclick', 'location.href="' + pageDTO.contextPath + '/inquiry/news?pageNum=' + pageDTO.pageCount + '"');
    }else{
    	$endButton
        .attr('disabled', true)
        .removeAttr('onclick');
    }
 	//debugger;
    	
}

//페이지 버튼 클릭 이벤트 리스너 추가
$(document).on('click', '#pagingList a', function(event) {
    event.preventDefault(); // 링크 기본 동작 방지
    const pageNum = $(this).data('page'); // 데이터 속성에서 페이지 번호 가져오기
    if (pageNum) {
        loadPage(pageNum); // 선택한 페이지 로드
    }
});


// function updatePaging(pageDTO) {
// 	var pagingHtml = '<ul>';



//     // 페이지 번호 링크
//     for (var i = pageDTO.startPage; i <= pageDTO.endPage; i++) {
//         pagingHtml += '<li><a href="#" class="page-link" data-page="' + i + '">' + i + '</a></li>';
//     }

//     // "다음" 버튼
//     if (pageDTO.currentPage < pageDTO.totalPageCount) {
//         pagingHtml += '<li><a href="#" class="page-link" data-page="' + (pageDTO.currentPage + 1) + '">[다음]</a></li>';
//     }
//     pagingHtml += '</ul>';

//     $('#pagingList').html(pagingHtml);

//     // 페이지 링크 클릭 이벤트 처리
//     $('#pagingList').on('click', '.page-link', function(e) {
//         e.preventDefault(); // 기본 링크 동작 방지

//         var pageNum = $(this).data('page');
        
//         // 현재 상태의 검색어와 뉴스 섹션을 포함하여 새로운 AJAX 요청
//         var searchtext = $('#searchtext').val();
//         var newsSection = $('#list a.active').data('value');
        
//         var data = { 
//             "searchtext": searchtext,
//             "newsSection": newsSection,
//             "pageNum": pageNum // 페이지 번호 추가
//         };

</script>


<!-- <script type="text/javascript"> -->


<!-- </script> -->

            
            <!--/ Contents End -->
		 </div>
		<!-- /Contents Area -->
	</div>
</body>
</html>