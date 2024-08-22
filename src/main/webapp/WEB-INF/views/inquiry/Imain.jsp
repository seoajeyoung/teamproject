<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiry/Imain.jsp</title>
<link href="${pageContext.request.contextPath}/resources/css/inquiry/customer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/giftstore.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/module.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/reset.css" rel="stylesheet">
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
    <h2>고객센터 메뉴</h2>
    <div class="snb">
        <ul>
            <li class="on"><a href="${pageContext.request.contextPath}/inquiry/Imain">고객센터 메인<i></i></a></li>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/often" title="현재선택">자주찾는 질문<i></i></a></li>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/news">공지/뉴스<i></i></a></li>
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
			<div class="c_check_warp">
				<div class="c_box qna_search">
					<strong class="c_tit">자주찾는 질문 빠른검색</strong>
					<legend><label for="searchtext">검색</label></legend>
					<div class="search_box">
					<form action="${pageContext.request.contextPath}/inquiry/often" method="get" id="searchForm">
						<input id="searchtext" type="text" name="search" title="검색어 입력" placeholder="검색어를 입력해 주세요.">
						<button type="button" class="btn_search" title="검색하기" id="btn_search">검색</button>
					</form>	
					</div>

				</div>
                <div class="c_box talk_inquiry" style="cursor:pointer;">
                    <strong class="c_tit">문의/답변</strong>
                    <span class="c_txt">다양한 문의와 답변을 확인하실 수 있습니다.</span>
                    <a href="${pageContext.request.contextPath}/inquiry/list">바로가기</a>
                </div>
				<div class="c_box email_inquiry" style="cursor:pointer;">
					<strong class="c_tit">1:1 문의하기</strong>
					<span class="c_txt">24시간 365일 언제든지 문의해주세요.</span>
					<a href="${pageContext.request.contextPath}/inquiry/write">문의하기</a>
                </div>
				<div class="c_box my_advice" style="cursor:pointer;">
					<strong class="c_tit">내 상담 내역 확인</strong>
					<span class="c_txt">문의하신 내용을 확인하실 수 있습니다.</span>
					<a href="${pageContext.request.contextPath}/inquiry/me" target="_blank" title="새창열기">문의내역 조회</a>
                </div>
			</div>
			<div class="customer_notice_area">
				<div class="service_area">
					<span class="tit">자주찾는 서비스</span>
					<ul class="list">
						<li><a href="/user/mycgv/reserve/?g=1#contaniner" target="_blank" title="새창열기">신용카드<br>영수증출력</a></li>

                        <!-- 로그아웃일 경우에만 링크  -->
                          
						<li><a href="/user/login/find-account.aspx" target="_blank" title="새창열기">아이디/<br>비밀번호 찾기</a></li>
                          
                        <!-- 로그아웃일 경우에만 링크  -->

						<li><a href="/user/mycgv/reserve/?g=1#contaniner" target="_blank" title="새창열기">예매/<br>취소내역 확인</a></li>

                        <!-- 로그아웃일 경우에만 링크  --> 
                            
						<li><a href="/user/guest/default.aspx" target="_blank" title="새창열기">비회원<br>예매/취소</a></li>
                         
                        <!-- 로그아웃일 경우에만 링크  -->

						<li><a href="/user/mycgv/cjone-point/pointlist.aspx?g=1#contaniner" target="_blank" title="새창열기">멤버십포인트<br>사용안내</a></li>
						<li><a href="/user/mycgv/coupon/movie-ticket/list.aspx?g=1#contaniner" target="_blank" title="새창열기">관람권<br>할인쿠폰 등록</a></li>
					</ul>
				</div>
				<div class="notice_area">
                    <a href="${pageContext.request.contextPath}/inquiry/news">
					    <span class="tit">공지/뉴스</span>
                    </a>
					<ul class="txt">
						<c:forEach var="news" items="${newslist}">
							<li><a href="${pageContext.request.contextPath}/inquiry/newscontent?NEWS_NUM=${newsDTO.NEWS_NUM}">
							${news.NEWS_SECTION} ${news.NEWS_NAME }</a>
							<span class="day">${news.NEWS_DATE}</span></li>
						</c:forEach>
                    
<!--                             <li><a href="/support/news/detail-view.aspx?idx=8001&amp;type=3"> [CGV] 무대인사 예매취소 정책 변경 안내</a><span class="day">2024.01.02</span></li> -->
                        
<!--                             <li><a href="/support/news/detail-view.aspx?idx=8030&amp;type=1">[시스템점검] 2024년 8월 시스템공지</a><span class="day">2024.07.17</span></li> -->
                        
<!--                             <li><a href="/support/news/detail-view.aspx?idx=8029&amp;type=4">[기타] CGV 사칭 계정 메시지 주의 안내</a><span class="day">2024.07.15</span></li> -->
                        
<!--                             <li><a href="/support/news/detail-view.aspx?idx=8028&amp;type=5"> [아시아나 마일리지] 제휴 종료 안내</a><span class="day">2024.07.05</span></li> -->
                        
<!--                             <li><a href="/support/news/detail-view.aspx?idx=8026&amp;type=1">[시스템점검] 2024년 7월 시스템공지</a><span class="day">2024.06.28</span></li> -->
                        
					</ul>
					<a href="${pageContext.request.contextPath}/inquiry/news" class="more">공지/뉴스 더보기</a>
				</div>
			</div>

		</div>
	</div>
	<!-- //Contents End -->
</div>
<!-- //Contents Area -->
<script type="text/javascript">
//<![CDATA[

    (function ($) {
        $(function () {
            $('#btn_search').on('click', function () {
                if ($('#searchtext').val() == "") {
                    alert("검색어를 입력해 주세요.");
                    $('#searchtext').focus();
                    return false;
                } else {
                    Search();
                }
            });
			
			$('#searchtext').keypress(function(event){
				if(event.which == 13){
					if ($('#searchtext').val() == "") {
						alert("검색어를 입력해 주세요.");
						$('#searchtext').focus();
						return false;
					} else {
						Search();
					}
				}
			});

            function Search() {
            	// 폼 제출
    	        $('#searchForm').submit();
            }

            $('.c_qu').children('a').on("click", function () {
                location.href = "/support/faq/default.aspx?searchtext=" + escape($(this).html());
                //return false;
            });

            $('.email_inquiry').on('click', function () {
                location.href = "/support/qna/default.aspx";
            });

            /**  중복링크 제거
            $('.my_advice').on('click', function () {
                var openNewWindow = window.open("/user/mycgv/inquiry/qna/list.aspx?g=1#contaniner", "_blank");
                if (openNewWindow)
                    openNewWindow.submit();
                else
                    alert("팝업이 허용되어 있지 않습니다.");
                //openNewWindow.focus();
                return false;

            });
            **/
            $('.talk_inquiry').on('click', function () {

                var popupWidth = 600;
                var popupHeight = 600;

                // 듀얼 모니터 기준
                var _left = (screen.availWidth - popupWidth) / 2;
                if( window.screenLeft < 0){
                    _left += window.screen.width*-1;
                }
                else if ( window.screenLeft > window.screen.width ){
                    _left += window.screen.width;
                }

                var _top= (screen.availHeight - popupHeight) / 2 - 10;

                var openNewWindow = window.open("https://cgv.enomix.co.kr/sharedfront/jsp/view/chatWindow.jsp?channelId=pcweb", "cgvTalk", "width="+popupWidth+",height="+popupHeight+",resizable=yes, toolbar=no, menubar=no, status=no, scrollbars=yes,left="+ _left + ", top="+ _top);
                if (openNewWindow)
                    openNewWindow.submit();
                else
                    alert("팝업이 허용되어 있지 않습니다.");
                //openNewWindow.focus();
                return false;
            });

        });
    })(jQuery);

//]]>
</script>

            
            <!--/ Contents End -->
		 </div>
		<!-- /Contents Area -->
	</div>
</body>
</html>