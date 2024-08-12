<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiry/newscontent.jsp</title>
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
    <h2>고객센터 메뉴</h2>
    <div class="snb">
        <ul>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/Imain">고객센터 메인<i></i>
					</a></li>
					<li class=""><a href="${pageContext.request.contextPath}/inquiry/often">자주찾는 질문<i></i>
					</a></li>
					<li class="on"><a href="${pageContext.request.contextPath}/inquiry/news" title="현재선택">공지/뉴스<i></i></a></li>
					<li class=""><a href="${pageContext.request.contextPath}/inquiry/write">1 : 1 문의하기<i></i>
					</a></li>
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
			<div class="board_view_area">
				<ul class="top_title_faq">
					<li class="title">${newsDTO.NEWS_NAME}</li>
					<li class="stit_area">
						<span>등록일<em class="regist_day">${newsDTO.NEWS_DATE}</em></span>
						<span class="check_tit_area">구분<em class="check_num">${newsDTO.NEWS_SECTION} </em></span>
					</li>
				</ul>
				<div class="view_area">
					<p></p><p class="ce_exstyle" style="line-height: 1.3; font-family: &quot;맑은 고딕&quot;; font-size: 10pt;">
					<span style="font-size: inherit;">${newsDTO.NEWS_CONTENT}</span>
					</p>
					<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				
				<c:if test="${MEMBER_NAME == 'admin'}">
					<div class="customer_btn"><button type="button" onclick="redirectToUpdatePage('${pageContext.request.contextPath}/inquiry/updatenews?NEWS_NUM=${newsDTO.NEWS_NUM}')" class="round inblack" >
				<span>글수정</span></button>
				<button type="button" onclick="confirmDelete('${pageContext.request.contextPath}/inquiry/deletenews?NEWS_NUM=${newsDTO.NEWS_NUM}')" class="round inblack" ><span>
				 글삭제
				</span></button></div>
				</c:if>
				
				<div class="customer_btn"><button type="button" class="round inblack" id="btn_list"><span>목록으로</span></button></div>
				<!-- 이전글,다음글 (s) -->
				<div class="btm_sup_list">
					<ul class="line_sup_next">
						<li class="stit">이전글</li>
						<c:choose>
							<c:when test="${empty prev}">
								<li class="name">이전글이 없습니다.</li>
							</c:when>
							<c:otherwise>
								<li class="name"><a href="${pageContext.request.contextPath}/inquiry/newscontent?NEWS_NUM=${prev.NEWS_NUM}"
									class="txt">${prev.NEWS_NAME}</a></li>
							</c:otherwise>
						</c:choose>
						
<!-- 						<li class="name"><a href="#" class="txt">이전 글이 없습니다.</a></li> -->
                        
					</ul>
					<ul class="line_sup_prev">
						<li class="stit">다음글</li>
						<c:choose>
							<c:when test="${empty next}">
							<li class="name">다음글이 없습니다.</li>
							</c:when>
						<c:otherwise>
							<li class="name"><a
								href="${pageContext.request.contextPath}/inquiry/newscontent?NEWS_NUM=${next.NEWS_NUM}"
								class="txt">${next.NEWS_NAME}</a></li>
						</c:otherwise>
					</c:choose>
<!-- 						<li class="name"><a href="/support/news/detail-view.aspx?idx=7476&amp;type=4&amp;page=1&amp;searchtext=&amp;searchfield=0" class="txt">만14세 미만 로그인 및 회원가입(약관동의)시 법정대리인 동의의 件</a></li> -->
<%--                         <li class="check_writ_area">등록일<span class="check_num">${next.NEWS_DATE}</span></li> --%>
					</ul>
				</div>
				<!-- 이전글,다음글 (e) -->
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
            $('#btn_list').on('click', function () {
                Search();
            });

            function Search() {
            	location.href = "${pageContext.request.contextPath}/inquiry/news";
                return false;
            }
        });
    })(jQuery);
    
    
    function confirmDelete(url) {
        if (confirm("삭제하시겠습니까?")) {
            window.location.href = url; // 삭제 확인창 띄운후 확인누르면 URL로 이동/삭제
        }
    }
    
    function redirectToUpdatePage(url) {
        window.location.href = url; // 수정 클릭 시 해당 URL로 이동
    }


//]]>
</script>

            
            <!--/ Contents End -->
		 </div>
		<!-- /Contents Area -->
	</div>

</body>
</html>