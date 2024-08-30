<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/mypage/base.css" rel="stylesheet">
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
	font-weight: 700;  
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
.title>* {
	margin-bottom: 5px;
}
.rContent>a {
	position: absolute;
	right: -30px;
	z-index: 999;
}
</style>

<body class="" style="">
<jsp:include page="../ticket/top.jsp" />
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
                        <img src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif">
                        <span class="profile-mask"></span>
                    </div>
                </div>
                <div class="box-contents">
	        		<strong>${sessionScope.member_id}</strong>
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
                <a href="javascript:void(0);" data-label="watched">
                    <em>${count.CHECKEDMOVIE}</em>
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
		$('.box-round-on').removeClass().addClass('box-round-wgray');
		$(this).parents('.box-round-wgray, .box-round-on').removeClass().addClass('box-round-on');
		
		label = $(this).data('label'); // 클릭된 영역을 구분하기위한 라벨 data-label
		title = $(this).find('strong').text(); //소제목
		count = $(this).find('em').text(); // 건수
		
		$('#sortBtn').trigger('click'); // GO 버튼 클릭 이벤트
		
	});
	
	// go 버튼
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
					var text = `<li class="movie_info"  style="margin-top: 15px; padding-bottom: 15px; border-bottom: 1px solid #d6d4ca;">
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
				                        	<ol style="margin-bottom:0;">
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
						text2 = `<div class="rContent" style="margin-bottom: 0;">
									<textarea maxlength="200" rows="2" cols="88" data-code="\${movieDTO.REVIEW_NUM}" style="border: 1px solid gray;">\${movieDTO.REVIEW_CONTENT}</textarea>
									<a href="javascript:void(0);"> 수정</a>
								 </div>
								 `
						$('.btn-del:last').addClass('review_del');		 
					} else if(label == 'watched') {
						text2 = `<b>관람일: \${movieDTO.DATEMOVIE} / \${movieDTO.COUNTSEAT}석</b>`
						$('.btn-del').remove();
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
// 수정 버튼 클릭
$(document).on('click', '.rContent>a', function() {
	var title = $(this).parents('.movie_info').find('#strong_id').text();
	var content = $(this).parents('.rContent').find('textarea').val();
	reviewNum = $(this).parents('.rContent').find('textarea').data('code');
	
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/movie/updateReview',
		data: {"REVIEW_NUM":reviewNum, "REVIEW_CONTENT": content},
		success: function() {
			alert('리뷰 수정 완료');
		},
		error: function(str) {
			if(str == "notOK"){
				alert('업데이트실패')
			} else {
				alert('오류')
			}
		}
	});
	$('.btn-close').trigger('click');
	
	
	
	
	
// 	var text = `<div class="mask" style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; z-index: 100; background-color: rgba(0, 0, 0, 0.8);"></div>
// 				<div class="layer-wrap" style="margin-top: -207px; margin-left: -355px; position: fixed;" tabindex="0"><div class="layer-contents on-shadow" style="width:710px;">
// 					<div class="popup-general">
// 					<div class="popwrap">
// 						<h1>평점수정</h1>
// 						<div class="pop-contents write-mygrade">
// 							<div class="mygrade-cont">
// 								<div class="movietit"><strong id="regTitle">\${title}</strong></div>
// 								<div class="likeornot">
// 									<div class="writerinfo">
// 										<div class="box-image">
// 											<span class="thumb-image">   
// 												<img id="regUserPro" src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="사용자 프로필" onerror="errorImage(this, {'type':'profile'})">                                            
// 												<span class="profile-mask"></span>
// 											</span>
// 										</div>
// 										<span class="round red on"><span class="position"><em class="see">${sessionScope.id}</em></span></span>
// 										<span class="writer-name" id="regUserName"></span>
// 									</div>
// 								</div>
	
// 								<div class="textbox">
// 									<textarea id="textReviewContent" name="textReviewContent" title="영화평점 입력" cols="70" rows="2" maxlength="280">\${content}</textarea>
// 								</div>
	
// 								<div class="footbox">
// 									<div class="rbox">
// 										<span class="count"><strong id="text_count">0</strong>/280(byte)</span>
// 										<button type="button" class="round red on" id="regUpBtn"><span>수정완료!</span></button>
// 									</div>
// 								</div>
// 							</div>
// 						</div>
// 						<button type="button" class="btn-close" id="regLayerClose">평점작성 팝업 닫기</button>
// 					</div>
// 				</div>
// 			</div>`
// 	$('body').append(text);		
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
// 	var content = $('#textReviewContent').val();
// 	$.ajax({
// 		type: 'POST',
// 		url: '${pageContext.request.contextPath}/movie/updateReview',
// 		data: {"REVIEW_NUM":reviewNum, "REVIEW_CONTENT": content},
// 		success: function() {
// 			alert('리뷰 수정 완료');
// 			$('.box-round-on').find('a').trigger('click');
// 		},
// 		error: function(str) {
// 			if(str == "notOK"){
// 				alert('업데이트실패')
// 			}
// 		}
// 	});
// 	$('.btn-close').trigger('click');
});

$(document).on('click', '.review_del', function() {
	reviewNum = $(this).parents('.movie_info').find('.rContent>textarea').data('code');
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
<!--             <div class="sect-wishlist-lst none"> -->
<!-- 		       <p>기대되는 영화가 없습니다.<br>영화 상세 프리에그에서 '기대돼요!'를 선택하여 영화를 추가해보세요.</p> -->
<!--                <a href="/movies/" class="round black"><span>무비차트</span></a> -->
<!-- 		    </div> -->
            
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
<link href="${pageContext.request.contextPath}/resources/css/movie/content.css" rel="stylesheet">
</html>