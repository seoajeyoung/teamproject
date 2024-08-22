<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/mypage/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage/content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage/customer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage/giftstore.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage/module.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage/newinsert.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage/participate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage/register.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage/reset.css" rel="stylesheet">




<body class="" style="">

<!-- S Skip Navigation -->
<div class="skipnaiv">
    <a href="#contents" id="skipHeader">메인 컨텐츠 바로가기</a>
    <!--<a href="#goto_ticket" id="">예매하기 바로가기</a>//-->
    <a href="/reserve/show-times/" id="">예매하기 바로가기</a>
</div>
<div id="cgvwrap">
    
    
    <div class="cgv-ad-wrap" id="cgv_main_ad">
        <div id="TopBarWrapper" class="sect-head-ad">
            <div class="top_extend_ad_wrap">
                <div class="adreduce" id="adReduce">                    
                    <iframe src="//ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@TopBar_EX" width="100%" height="80" title="" frameborder="0" scrolling="no" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" name="TopBanner" id="TopBanner"></iframe>
                </div> 
                <div class="adextend" id="adExtend"></div>
            </div><!-- //.top_extend_ad_wrap -->
        </div>    
    </div>    
	
      <!-- S Header
        Description
        - class 'nav' 에 class 'active' 추가시 서브메뉴노출
        - class 'nav' 에 class 'fixed' 추가시 상단고정되며 스타일 변경됨
     -->
	<div class="header">			
            <!-- 서비스 메뉴 --> 
            
<div class="header_content">
    <div class="contents">
        <h1 onclick=""><a href="/"><img src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png" alt="CGV"></a><span>DEEP DIVE SPACE</span></h1>
        <ul class="memberInfo_wrap">
            <!-- Advertisement -->
            
			<div class="ad-partner">
                <a href="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=31426&amp;menu=006">
                    <img src="https://img.cgv.co.kr/WingBanner/2023/0208/16758461047540.png" alt="현대M포인트" onerror="this.onerror=null;javascript:;$('.ad-partner').hide();">
                </a>					
			</div>
            
            <!-- /Advertisement -->

            
            <li><a href="/user/login/logout.aspx" class="logout" title="로그아웃"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그아웃"><span>로그아웃</span></a></li>
            
            
            <li><a href="/user/mycgv/"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png" alt="MY CGV"><span>MY CGV</span></a></li>
            <li><a href="/support/default.aspx"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png" alt="고객센터"><span>고객센터</span></a></li>
        </ul>
    </div>
</div>
            <!-- 서비스 메뉴 -->
           
			<!-- 서브 메뉴 -->
			
<div class="nav">
    <div class="contents">
        <h1><a href="/" tabindex="-1"><img src="https://img.cgv.co.kr/R2014/images/common/logo/logoWhite.png" alt="CGV"></a></h1>
        <ul class="nav_menu">
            <li>
                <h2><a href="/movies/?lt=1&amp;ft=0">영화</a></h2>
                <dl class="nav_overMenu" style="">
                    <dt><h2><a href="/movies/?lt=1&amp;ft=0" tabindex="-1">영화</a></h2></dt>
                    <dd><h3><a href="/movies/?lt=1&amp;ft=0">무비차트</a></h3></dd>
                    <dd><h3><a href="/arthouse/">아트하우스</a></h3></dd>
                    <dd><h3><a href="/culture-event/event/detailViewUnited.aspx?seq=30717">ICECON</a></h3></dd>
                </dl>
            </li>
            <li>
                <h2><a href="/theaters/">극장</a></h2>
                <dl class="nav_overMenu" style="">
                    <dt><h2><a href="/theaters/" tabindex="-1">극장</a></h2></dt>
                    <dd><h3><a href="/theaters/">CGV 극장</a></h3></dd>
                    <dd><h3><a href="/theaters/special/defaultNew.aspx">특별관</a></h3></dd>
                </dl>
            </li>
            <li>
                <h2><a href="/ticket/"><strong>예매</strong></a></h2>
                <dl class="nav_overMenu" style="">
                    <dt><h2><a href="/ticket/" tabindex="-1">예매</a></h2></dt>
                    <dd><h3><a href="/ticket/">빠른예매</a></h3></dd>
                    <dd><h3><a href="/reserve/show-times/">상영스케줄</a></h3></dd>
                    <dd><h3><a href="/ticket/eng/newdefault.aspx">English Ticketing</a></h3></dd>
                    <dd><h3><a href="/reserve/show-times/eng/">English Schedule</a></h3></dd>
                </dl>
            </li>
            <li>
                <h2><a href="/culture-event/popcorn-store/">스토어</a></h2>
                <dl class="nav_overMenu" style="">
                    <dt><h2><a href="/culture-event/popcorn-store/" tabindex="-1">스토어</a></h2></dt>
                    
                            <dd><h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=1">패키지</a></h3></dd>
                        
                            <dd><h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=2">영화관람권</a></h3></dd>
                        
                            <dd><h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=3">기프트카드</a></h3></dd>
                        
                            <dd><h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=4">콤보</a></h3></dd>
                        
                            <dd><h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=5">팝콘</a></h3></dd>
                        
                            <dd><h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=6">음료</a></h3></dd>
                        
                            <dd><h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=7">스낵</a></h3></dd>
                        
                            <dd><h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=10">플레이존</a></h3></dd>
                        
                    <!-- 2024.06.27 씨네샵 URL 변경 요청 -->
                    <dd><h3><a href="https://brand.naver.com/cgv" class="arrowR" target="_blank">씨네샵</a></h3></dd>
                </dl>
            </li>
            <li>
                <h2 onclick="gaEventLog('PC_GNB','주메뉴_이벤트','')"><a href="/culture-event/event/defaultNew.aspx">이벤트</a></h2>
                <dl class="nav_overMenu" style="">
                    <dt><h2><a href="/culture-event/event/defaultNew.aspx?mCode=001" tabindex="-1">이벤트</a></h2></dt>
                    <dd><h3><a href="/culture-event/event/defaultNew.aspx?mCode=001">SPECIAL</a></h3></dd>
                    <dd><h3><a href="/culture-event/event/defaultNew.aspx?mCode=004">영화/예매</a></h3></dd>
                    <dd><h3><a href="/culture-event/event/defaultNew.aspx?mCode=008">멤버십/CLUB</a></h3></dd>
                    <dd><h3><a href="/culture-event/event/defaultNew.aspx?mCode=005">CGV 극장별</a></h3></dd>
                    <dd><h3><a href="/culture-event/event/defaultNew.aspx?mCode=006">제휴할인</a></h3></dd>
                    <dd><h3><a href="/user/mycgv/event/result_list.aspx">당첨자 발표</a></h3></dd>
                    <dd><h3><a href="/culture-event/event/end-list.aspx">종료된 이벤트</a></h3></dd>
                </dl>
            </li>
            <li>
                <h2 onclick="gaEventLog('PC_GNB','주메뉴_해택','')"><a href="/discount/discountlist.aspx">혜택</a></h2>
                <dl class="nav_overMenu" style="">
                    <dt><h2><a href="/discount/discountlist.aspx" tabindex="-1">혜택</a></h2></dt>
                    <dd><h3><a href="/discount/discountlist.aspx">CGV 할인정보</a></h3></dd>
                    <dd><h3><a href="https://www.cgv.co.kr/user/memberShip/ClubService.aspx">CLUB 서비스</a></h3></dd>
                    <dd><h3><a href="/user/vip-lounge/">VIP 라운지</a></h3></dd>
                </dl>
            </li>
        </ul>
        <div class="totalSearch_wrap">
            <!-- 24.03 홈페이지 內 검색 영역 광고 텍스트 미노출의 件 -->
            <label for="totalSearch">
                
                <input name="ctl00$subMenu$header_keyword" type="text" id="header_keyword" value="이매지너리">
                <input name="ctl00$subMenu$header_ad_keyword" type="hidden" id="header_ad_keyword" value="이매지너리">
            </label>
            <button type="button" class="btn_totalSearch" id="btn_header_search">검색</button>
            <!-- 24.03 홈페이지 內 검색 영역 광고 텍스트 미노출의 件 (iframe 주석 -->
            <!-- <iframe src="//ad.cgv.co.kr/NetInsight/text/CGV/CGV_201401/main@Search_txt" width="0" height="0" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" allowfullscreen="allowfullscreen" mozallowfullscreen="mozallowfullscreen" msallowfullscreen="msallowfullscreen" oallowfullscreen="oallowfullscreen" webkitallowfullscreen="webkitallowfullscreen"></iframe> -->
            <!--<div class="totalSearchAutocomplete_wrap">
                <dl class="totalSearchAutocomplete_list">
                    <dt>영화</dt>
                    <dd><a href="#none"><strong>전지</strong>적 작가시점</a></dd>
                    <dd><a href="#none">내언니 <strong>전지</strong>현과 나</a></dd>
                    <dd><a href="#none">수호<strong>전지</strong> 영웅본색</a></dd>
                </dl>
                <dl class="totalSearchAutocomplete_list">
                    <dt>인물</dt>
                    <dd><a href="#none"><strong>전지</strong>현</a></dd>
                    <dd><a href="#none"><strong>전지</strong>희</a></dd>
                    <dd><a href="#none">이<strong>전지</strong></a></dd>
                </dl>
                <a href="#none" class="btn_totalSearchAutocomplete_close">닫기</a>
            </div>//-->
        </div>
    </div>
</div>
            <!-- 서브 메뉴 -->			
	</div>
	<!-- E Header -->

	<!-- Contaniner -->
<div id="contaniner" class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
        

		<!-- Contents Area -->
		 <div id="contents" class="">
        
            
            <!-- Contents Start -->
			
<div class="cols-content">
    
<div class="col-aside">
	<h2>프로필 및 서브메뉴</h2>
	<div class="box-round-dgray">
        <div class="box-round-inner">
            <div class="inner-contents-profile">
                <div class="box-image">
                	<div class="thumb-image">
                        <img src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="김동희님 프로필 사진" onerror="errorImage(this, {type:'profile'})">
                        <span class="profile-mask"></span>
                        
                    </div>
                     <!-- 등급종류 클래스 : vip, rvip, vvip -->
                </div>
                <div class="box-contents">
	        		<strong>${sessionScope.id}</strong>
		        </div>
            </div>
        </div>
    </div>
    <div class="box-round-on">
        <div class="box-round-inner">
            <div class="inner-contents-log">
                <a href="javaScript:void(0);">
                    <em>${count.BOOKMARK}</em>
                    <strong>기대되는 영화</strong>
                </a>
            </div>
        </div>
    </div>
    <div class="box-round-wgray">
        <div class="box-round-inner">
            <div class="inner-contents-log">
                <a href="/user/movielog/watched.aspx">
                    <em>1</em>
                    <strong>내가 본 영화</strong>
                </a>
            </div>
        </div>
    </div>
    <div class="box-round-wgray">
        <div class="box-round-inner">
            <div class="inner-contents-log">
                <a href="/movies/point/my-list.aspx">
                    <em>${count.REVIEW}</em>
                    <strong>내가 쓴 평점</strong>
                </a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
</script>
	<div class="col-detail">
	    <div class="movielog-detail-wrap">
	        <!-- Title & Button Combo -->
	        <div class="tit-mycgv">
		        <h3>기대되는 영화</h3>
		        <p><em>0건</em></p>
		        <div class="sect-sorting">
		            <label for="order_type" class="hidden">정렬</label>
		            <select id="order_type" name="sort_field">
		                <option value="1" title="현재 선택됨" selected="">등록일 순</option>
		                <option value="2">개봉일 순</option>
		            </select>
		            <button class="round gray" type="button"><span>GO</span></button>
		        </div>
		    </div>
		    <!-- //Title & Button Combo -->
            
            <div class="sect-wishlist-lst none">
		       <p>기대되는 영화가 없습니다.<br>영화 상세 프리에그에서 '기대돼요!'를 선택하여 영화를 추가해보세요.</p>
               <a href="/movies/" class="round black"><span>무비차트</span></a>
		    </div>
            
	    </div>
	</div>
</div>
            <!--/ Contents End -->
		 </div>
		<!-- /Contents Area -->
	</div>
    <!-- E Contaniner -->
    
    <!-- S Popup -->
    <div class="com_pop_wrap">
        <div class="com_pop_fog"></div>
    </div>
    <div class="pop_wrap">
    <!-- S > [팝업] 지원 OS 업데이트 유도-->
        <div id="pop_supportOS" class="popup" style="display:none">
            <div class="pop_iexp_wrap" style="position:fixed; left:50%; top:50%; width:600px; margin:-165px 0 0 -300px; z-index:1000;">
                <div class="pi_headline">
                    <img src="https://img.cgv.co.kr/images/popup/1606_iexp/pop_iexp_headline2.jpg" alt="CGV 홈페이지는 고객님께서 사용중인 MS Windows XP에서 정상적인 서비스 이용이 어려울 수 있으며, OS업데이트를 권장합니다.">
                </div>
                <div class="down_app">
                    <p><img src="https://img.cgv.co.kr/images/popup/1606_iexp/pop_iexp_downtxt.jpg" alt="OS 업데이트가 어려운 경우 모바일앱을 이용하세요!!!"></p>
                    <a class="btn" href="https://itunes.apple.com/kr/app/id370441190?mt=8" target="_blank"><img src="https://img.cgv.co.kr/images/popup/1606_iexp/btn_down_ios.jpg" alt="Ios down"></a>
                    <a class="btn" href="https://play.google.com/store/apps/details?id=com.cgv.android.movieapp" target="_blank"><img src="https://img.cgv.co.kr/images/popup/1606_iexp/btn_down_android.jpg" alt="Android down"></a>
                </div>
                <a class="btn_close">닫기</a>
            </div>
         </div>
    <!-- S > [팝업] 지원 브라우저 다운로드 유도-->
         <div id="pop_supportBrower" class="popup" style="display:none">
            <div class="pop_iexp_wrap" style="position:fixed; left:50%; top:50%; width:600px; margin:-265px 0 0 -300px; z-index:1000;">
                <div class="pi_headline">
                    <img src="https://img.cgv.co.kr/images/popup/1606_iexp/pop_iexp_headline1.jpg" alt="CGV 홈페이지는 Internet Explorer 9이상에서 최적의 서비스 이용이 가능합니다. IE9 이하 브라우저에서 이용 시 정상적인 서비스 이용이 어려울 수 있으며, 브라우저 업그레이드 하시기를 권장합니다.">
                </div>
                <ul class="down_browser">
                    <li><a href="https://www.microsoft.com/ko-kr/edge" target="_blank"><img src="https://img.cgv.co.kr/images/popup/1606_iexp/btn_down_ie.jpg" alt="Internet Explorer 다운받기"></a></li>
                    <li><a href="https://www.google.com/chrome/browser/desktop/index.html" target="_blank"><img src="https://img.cgv.co.kr/images/popup/1606_iexp/btn_down_chrome.jpg" alt="Chrome 다운받기"></a></li>
                </ul>
                <div class="down_app">
                    <p><img src="https://img.cgv.co.kr/images/popup/1606_iexp/pop_iexp_downtxt.jpg" alt="OS 업데이트가 어려운 경우 모바일앱을 이용하세요!"></p>
                    <a class="btn" href="https://itunes.apple.com/kr/app/id370441190?mt=8" target="_blank"><img src="https://img.cgv.co.kr/images/popup/1606_iexp/btn_down_ios.jpg" alt="Ios down"></a>
                    <a class="btn" href="https://play.google.com/store/apps/details?id=com.cgv.android.movieapp " target="_blank"><img src="https://img.cgv.co.kr/images/popup/1606_iexp/btn_down_android.jpg" alt="Android down"></a>
                </div>
                <a class="btn_close">닫기</a>
            </div>
        </div>
	</div>

    <!-- E Popup -->
    
    <!-- S 예매하기 및 TOP Fixed 버튼 -->
    <div class="fixedBtn_wrap">
     
        <a href="/ticket/" class="btn_fixedTicketing">예매하기</a>
        
        <a href="#skipHeader" class="btn_gotoTop"><img src="https://img.cgv.co.kr/R2014/images/common/btn/gotoTop.png" alt="최상단으로 이동"></a>
    </div>
    
    <!-- E 예매하기 및 TOP Fixed 버튼 -->
	
    <!-- S Footer -->

</body>
</html>