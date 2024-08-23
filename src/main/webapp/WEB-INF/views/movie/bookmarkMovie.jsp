<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/mypage/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage/content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage/giftstore.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage/newinsert.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage/participate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage/register.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/movie/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/module.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/eggupdate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/preegg.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/cgv.min.css" rel="stylesheet">



<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>


<style type="text/css">
.link-info {
	position: relative;
	top: 10px;
	font-size: 14px;
	padding: 5px;
	background-color: #fb4357;
	font-weight: 900;  
	color: white;
	border-radius: 5px;
}
.rContent {
	position: relative;
	top: 10px;
	font-size: 12px;
	font-weight: 600;
	border-top: 1px solid gray;
	display: block;
	padding-top: 5px;
	width: 100%;
	overflow: visible;
}
.title {
	overflow: visible;
}
.rContent>a {
	position: absolute;
	right: -30px;
	z-index: 999;
}
</style>

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
                <a href="javaScript:void(0);" class="bookmark" data-label="bookmark">
                    <em>${count.BOOKMARK}</em>
                    <strong>기대되는 영화</strong>
                </a>
            </div>
        </div>
    </div>
    <div class="box-round-wgray">
        <div class="box-round-inner">
            <div class="inner-contents-log">	
                <a href="/user/movielog/watched.aspx" data-label="watched">
                    <em>1</em>
                    <strong>내가 본 영화</strong>
                </a>
            </div>
        </div>
    </div>
    <div class="box-round-wgray">
        <div class="box-round-inner">
            <div class="inner-contents-log">
                <a href="javaScript:void(0);" class="review" data-label="review">
                    <em>${count.REVIEW}</em>
                    <strong>내가 쓴 평점</strong>
                </a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
let label;
let title;
let count;
$(function() {
	$('.box-round-wgray a, .box-round-on a').on('click', function() {
		label = $(this).data('label'); // 클릭된 영역을 구분하기위한 라벨 data-label
		title = $(this).find('strong').text(); //소제목
		count = $(this).find('em').text(); // 건수
		$('.box-round-on').removeClass().addClass('box-round-wgray');
		$(this).parents('.box-round-wgray, .box-round-on').removeClass().addClass('box-round-on');
		$('#sortBtn').trigger('click');
	});
	
	$('#sortBtn').on('click', function() {
		var sortType = $('#order_type').val();
		
		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath}/movie/myMovieList',
			data: {"LABEL":label, "SORTTYPE":sortType},
			dataType: 'json',
			success: function(result) {
				$('.tit-mycgv>h3').html(title);
				$('.count').html(count);
				
				$('.watched_list_container').html('');
				result.forEach(function(movieDTO) {
					var text = `<li class="movie_info">
								<input type="hidden" class="movieNum" value="\${movieDTO.MOVIE_NUM}">
								<div class="article-movie-info" style="height:160px; margin-bottom: 10px;">
									<div class="box-image" style="height:100%"> 
										<a title="포스터 크게 보기" href="\${movieDTO.POSTERURL}">
											<span class="thumb-image"> 
												<img alt="포스터" src="\${movieDTO.POSTERURL}" onerror="errorImage(this)">
											</span> 
										</a> 
									</div>
									<div class="box-contents" style="display:block;height:100%">
										<div class="title" style="display:block;height:100%"> 
											<a href="${pageContext.request.contextPath}/movie/information?num=\${movieDTO.MOVIE_NUM}">
												<strong id="strong_id">\${movieDTO.TITLE}</strong>
											</a>
											<p>\${movieDTO.TITLEENG}</p>
											<span class="txt-info">
				                            <i>\${movieDTO.RELEASEDATE} 개봉</i>
				                        	</span>
				                        	<ol>
				                        		<li>장르 : \${movieDTO.GENRE}</dt>
				                        		<li>\${movieDTO.RATING}<dt>
				                        	</ol>
										</div>
										<!-- add_css82 평점 개편 -->
									</div>
									<button type="button" class="btn-del">
										<img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_del.gif" alt="\${movieDTO.TITLE} 삭제">
									</button>
								</div>
							</li>`
					$('.watched_list_container').append(text);
					var text2;
					if(label == 'bookmark') {
						text2 = `<a href="${pageContext.request.contextPath}/movie/information?num=\${movieDTO.MOVIE_NUM}" class="link-info">상세정보</a>`;
						$('.btn-del:last').addClass('bookmark_del');
					} else if(label == 'review') {
						text2 = `<div class="rContent">
									<span data-code="\${movieDTO.REVIEW_NUM}">\${movieDTO.REVIEW_CONTENT}</span>
									<a href="javascript:void(0);"> 수정</a>
								 </div>
								 `
						$('.btn-del:last').addClass('review_del');		 
					}
					$('.title:last').append(text2);	
				});
			},
			error: function() {
				
			}
		});// ajax 종료
	});
	$('.inner-contents-log>a:first').trigger('click');
});
let reviewNum;
$(document).on('click', '.rContent>a', function() {
	var title = $(this).parents('.movie_info').find('#strong_id').text();
	var content = $(this).parents('.rContent').find('span').text();
	reviewNum = $(this).parents('.rContent').find('span').data('code');
	
	var text = `<div class="mask" style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; z-index: 100; background-color: rgba(0, 0, 0, 0.8);"></div>
				<div class="layer-wrap" style="margin-top: -207px; margin-left: -355px; position: fixed;" tabindex="0"><div class="layer-contents on-shadow" style="width:710px;">
					<div class="popup-general">
					<div class="popwrap">
						<h1>평점수정</h1>
						<div class="pop-contents write-mygrade">
							<div class="mygrade-cont">
								<div class="movietit"><strong id="regTitle">\${title}</strong></div>
								<div class="likeornot">
									<div class="writerinfo">
										<div class="box-image">
											<span class="thumb-image">   
												<img id="regUserPro" src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="사용자 프로필" onerror="errorImage(this, {'type':'profile'})">                                            
												<span class="profile-mask"></span>
											</span>
										</div>
										<span class="round red on"><span class="position"><em class="see">${sessionScope.id}</em></span></span>
										<span class="writer-name" id="regUserName"></span>
									</div>
								</div>
	
								<div class="textbox">
									<textarea id="textReviewContent" name="textReviewContent" title="영화평점 입력" cols="70" rows="2" maxlength="280">\${content}</textarea>
								</div>
	
								<div class="footbox">
									<div class="rbox">
										<span class="count"><strong id="text_count">0</strong>/280(byte)</span>
										<button type="button" class="round red on" id="regUpBtn"><span>수정완료!</span></button>
									</div>
								</div>
							</div>
						</div>
						<button type="button" class="btn-close" id="regLayerClose">평점작성 팝업 닫기</button>
					</div>
				</div>
			</div>`
	$('body').append(text);		
});
//리뷰 길이
$(document).on('input', '#textReviewContent', function() {
	$('#text_count').html($(this).val().length);
});
//리뷰창 닫기
$(document).on('click', '.btn-close', function() {
    $('.mask').remove();
    $('.layer-wrap').remove();
});

// 수정완료 버튼 수정
$(document).on('click', '#regUpBtn', function() {
	var content = $('#textReviewContent').val();
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/movie/updateReview',
		data: {"REVIEW_NUM":reviewNum, "REVIEW_CONTENT": content},
		success: function() {
			alert('리뷰 수정 완료');
			$('.box-round-on').find('a').trigger('click');
		},
		error: function(str) {
			if(str == "notOK"){
				alert('업데이트실패')
			}
		}
	});
	$('.btn-close').trigger('click');
});

$(document).on('click', '.review_del', function() {
	reviewNum = $(this).parents('.movie_info').find('.rContent>span').data('code');
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/movie/deleteReview',
		data: {"REVIEW_NUM":reviewNum},
		success: function() {
			alert('리뷰 삭제 완료');
			$('.box-round-on').find('a').trigger('click');
			count = $('.count').text();
			count -= 1;
			$('.count').html(count);
			$('.review>em').html(count);
		},
		error: function(e) {
			if(e.responseText == 'failed') {
				alert('리뷰 삭제 실패');
			}
		}
	});
});

$(document).on('click', '.bookmark_del', function() {
	var movieNum = $('.movieNum').val();
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/movie/deleteBookmark',
		data: {"MOVIE_NUM": movieNum},
		success: function() {
			$('.box-round-on').find('a').trigger('click');
			count = $('.count').text();
			count -= 1;
			$('.count').html(count);
			$('.bookmark>em').html(count);
		},
		error: function(e) {
			if(e.responseText == 'failed') {
				alert('찜 목록 취소 실패');
			}
		}
	});
	
});

</script>
	<div class="col-detail">
	    <div class="movielog-detail-wrap">
	        <!-- Title & Button Combo -->
	        <div class="tit-mycgv">
		        <h3>기대되는 영화</h3>
		        <p><em class="count">0</em>건</p>
		        <div class="sect-sorting">
		            <label for="order_type" class="hidden">정렬</label>
		            <select id="order_type" name="sort_field">
		                <option value="savedDate" title="현재 선택됨" selected="selected">등록일 순</option>
		                <option value="releaseDate">개봉일 순</option>
		            </select>
		            <button class="round gray" id="sortBtn" type="button"><span>GO</span></button>
		        </div>
		    </div>
		    <!-- //Title & Button Combo -->
			<div class="warp-my-reviewlist">
				<ul class="watched_list_container">
				
				</ul>
			</div>
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