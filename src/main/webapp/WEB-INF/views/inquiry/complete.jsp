<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiry/complete.jsp</title>
<link href="${pageContext.request.contextPath}/resources/css/inquiry/customer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/module.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/reset.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/ticket/top.jsp" />
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
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/Imain">고객센터 메인<i></i></a></li>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/often" title="현재선택">자주찾는 질문<i></i></a></li>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/news">공지/뉴스<i></i></a></li>
            <li class="on" id="write"><a href="${pageContext.request.contextPath}/inquiry/write">1 : 1 문의하기<i></i></a></li>
            
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
			<div class="complete_area">
				<p class="tit">작성하신 1 : 1 문의가 정상적으로 <strong class="point">접수 완료</strong>되었습니다.</p>
				<span class="notice_txt">문의하신 내용은 <a href="${pageContext.request.contextPath}/inquiry/me">My PAGE &gt; 나의 문의내역 &gt; 1:1문의</a>에서 확인하실 수 있으며,<br>신속히 답변해 드리겠습니다.</span>
				<ul class="data_box">
					<li><strong>접수일시</strong> : <span class="day"></span></li>
					<li><strong>전체공개/비공개</strong> : <span class="tf"></span></li>
				</ul>
				<div class="box-btn">
					<button type="button" class="round inred"  style="width:120px" id="btn_complete"><span>문의내용 확인하기</span></button>
					<a class="round gray" href="${pageContext.request.contextPath}/inquiry/Imain" style="margin-left:5px"><span style="padding:0 20px;">고객센터 메인</span></a>
				</div>
			</div>
		</div>
	</div>
	<!-- //Contents End -->
</div>
<!-- //Contents Area -->
<script type="text/javascript">
//<![CDATA[
	var isLoggedIn = ${sessionScope.member_id != null};

    (function ($) {
        $(function () {
            $('#btn_complete').on('click', function () {
                Search();
            });
            
            $('#write a').on('click', function(){
				if(!isLoggedIn){
					alert("로그인이 필요합니다.");
	            	event.preventDefault();
				}
            });

            function Search() {
                location.href = "${pageContext.request.contextPath}/inquiry/me";
                //return false;
            }
        });
    })(jQuery);
    
 $(document).ready(function(){
	var datePart = "${IQ_DATE}".split(" ")[0];
	 $('.day').text(datePart);
	 
	 var result = "${IQ_TYPE}";
	 if(result == "T"){
		 $('.tf').text("전체공개");
	 }else{
		 $('.tf').text("비공개");
	 }
	 
});
    

//]]>
</script>


            
            <!--/ Contents End -->
		 </div>
		<!-- /Contents Area -->
	</div>
</body>
</html>