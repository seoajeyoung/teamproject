<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>theater</title>
<link href="${pageContext.request.contextPath}/resources/css/movie/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/module.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/eggupdate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/preegg.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/cgv.min.css" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">


<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>


<style type="text/css">
#fav_theater {
  font-family: "Jua", sans-serif;
  font-style: italic;
}


</style>
</head>
<body>
<jsp:include page="../ticket/top.jsp" />
	<!-- Contaniner -->
	<div id="contaniner" class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
		<!-- Contents Area -->
		 <div id="contents" class="">
            <!-- Contents Start -->
			
<div class="sect-common">
    <div class="favorite-wrap">
        <div class="sect-favorite">
            <h4 style="z-index: 999; font-size: 24px; color: white; font-weight: 900; top: 20px;"><i id="fav_theater">자주가는 극장</i></h4>
            <ul id="favoriteTheaters">
				<li><a href="#"><span>1</span></a>${favTh.get(0)}</li>
				<li><a href="#"><span>2</span></a>${favTh.get(1)}</li>
				<li><a href="#"><span>3</span></a>${favTh.get(2)}</li>
				<li><a href="#"><span>4</span></a>${favTh.get(3)}</li>
				<li><a href="#"><span>5</span></a>${favTh.get(4)}</li>
            </ul>
            <button id="btn_set_my_favorite" type="button" title="새창">자주가는 극장 설정</button>
        </div>
<script type="text/javascript">

</script>
        <div class="sect-city" style="display: flex; height: auto">
	        <ul>
	        <c:set var="forCount" value="0" />
			<c:set var="endCount" value="0"/>
			<c:forEach var="region" items="${regionList}">
				<li>
				<a href="#" class="region">${region.TH_REGION}</a>
					<div class="area" style="top:80px;">
						<ul id="ulcontent">
							<!-- DB에서 가져온걸로 foreach -->
							<c:set var="endCount" value="${endCount + region.COUNT}" />
							 <c:forEach var="area" items="${areaList}" begin="${forCount}" end="${endCount - 1}">
	                            <li style="display: none;">
	                                <a href="#" class="area-link" title="${area.th_name}">
	                                    ${area.th_name}
	                                    <span hidden="hidden">${area.th_num}</span>
	                                    <input type="hidden" value="${area.th_addr}">
	                                </a>
	                            </li>
	                        </c:forEach>
						</ul>
					</div>
				</li>
				<c:set var="forCount" value="${region.COUNT}" />
			</c:forEach>
	        </ul>
        </div>
    </div>
</div>
<!-- 실컨텐츠 시작 -->
<script type="text/javascript">
var addr;
var thName;
var thNum;
$(function() {
	$('.region').on('click', function() {
		$('.sect-city li').removeClass();
		$('#ulcontent li').hide();
		$(this).parent('li').addClass('on').find('#ulcontent li').show();
		$('.area-link:visible:first').trigger('click');
	});
	
	//특정 극장 클릭시
	$('.area-link').on('click', function() {
		thNum = $(this).find('span').text();
		thName = $(this).attr('title');
		
		$('.sect-showtimes>ul').html('')
		$('.theater-tit span').text(thName + '점');
		
		addr = $(this).find('input').val();
		$('.title>span').text(addr);
		
		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath}/theater/runningDate',
		    data: {'TH_NAME': thName},
		    datatype: 'JSON',
		    success: function(result) {
// 		    	if(result.length == 0) {
// 	    			$('.slider').remove();
// 	    			return;	
// 	    		};
				$('.item').html('');
				result.forEach(function(resultDate) {
		    		var date = resultDate.DATE.split('-');
		    		var dayWeek = resultDate.dayWeek
		    		var text = `		
	                    <li>
	                    <div class="day">
	                        <a href="javascript:void(0)" title="현재 선택">
	                        	<input type="hidden" value="\${resultDate.DATE}">
	                            <span>\${date[1]}월</span> 
	                            <em>\${dayWeek}</em>
	                            <strong>\${date[2]}</strong>
	                        </a>
	                    </div>
	                	</li>`;
 	              	$('.item').append(text);
				});
		    	
              	$('.day').eq(0).find('a').trigger('click');
		    },
		    error: function(error) {
		    	debugger;
			}
		});// ajax 끝
	});
	
// 	$('.region:first'	).trigger('click');
});
</script>
<div class="wrap-theater">
    <h3><img src="https://img.cgv.co.kr/R2014/images/title/h3_theater.gif" alt="THEATER"></h3>
    <div class="sect-theater ">
        <h4 class="theater-tit"><span></span></h4>
        <a href="/support/lease/default.aspx" class="round inred btn_lease"><span style="padding:0 14px;">단체/대관문의</span></a>
        
        <div class="wrap-theaterinfo">
            <div class="box-image">
                <div id="theater_img_container" class="thumb-image"><img src="https://img.cgv.co.kr/Theater/Theater/2014/1211/CGVgangnam.jpg"></div>
            </div>
            <div class="box-contents">
                <div class="theater-info">
                    <span class="txt-info">
                        <em>1544-1122</em>
                        <em>6관 / 874석</em>
                        <span></span>
                    </span>
                    <!-- 최대 10개까지만 보여집니다 2 -->
                    <span class="screentype">
                            <a href="/theaters/special/?regioncode=SCX&amp;theaterCode=0056" class="screenX">SCREENX</a>
                    </span>
                </div>
                <div class="noti-theater">
                    <h5>공지사항</h5>
                    <ul>
                        
                    </ul>
                    <a class="link-more" href="${pageContext.request.contextPath}/inquiry/news" target="" title="새창 열림">공지사항 더보기</a>
                </div>
            </div>
        </div>
    </div>
    <!-- .sect-theater -->
    <div class="theater-ad">
        <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@SponsorBar_980" width="980" height="90" title="광고-파일럿" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="SponsorBar_980" id="SponsorBar_980"></iframe>
    </div>
    <div class="cols-content">
        <!-- 상영시간표 UserControl -->
        
<div class="col-detail"> 
<!-- 탭메뉴 class="on" 에따라서 아래 h4 내용을 바꿔주세요 -->                
<h4 class="hidden"> + [상영시간표]</h4>
            
<!-- Showtimes Start -->
<div class="showtimes-wrap">
        <div class="sect-schedule">
            <div id="slider" class="slider" style="width: 640px;">
				<div class="item-wrap on">
					<ul class="item" style="width: 800px; height: 111px;">
					</ul>
				</div>
				<button type="button" class="btn-prev">이전 날자보기</button>
               	<button type="button" class="btn-next">다음 날자보기</button>
               	<div class="descri-info theater" style="display: block;">
				    <ul>
				        <li><a href="javascript:void(0)" id="viewgrade" class="viewgrade">관람등급 안내</a></li>
				    </ul>
				</div>
			</div>
			<!-- sect-schedule -->
<!-- 탭메뉴 class="on" 에따라서 아래 h4 내용을 바꿔주세요 -->                
<h4 class="hidden"> + [상영시간표]</h4>
            
<!-- Showtimes Start -->
<!-- Contents Start -->
			<!-- sect-schedule -->
<script type="text/javascript">
$(document).on('click', '.day>a', function() {
	$('.day').parent('li').removeClass();
	$(this).parents('li').addClass('on');
	var scDate = $(this).find('input').val();
		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath}/theater/runningMovie',
		    data: {'TH_NUM': thNum, 'SC_DATE': scDate},
		    datatype: 'JSON',
		    success: function(result) {
// 		    	$('.sect-showtimes>ul').html('')
		    	var pre;
		    	result.forEach(function(scList, index) {
		    		if(index == 0 || pre.MOVIE_NUM != scList.MOVIE_NUM) {
		    			var rating = scList.RATING === '전체' ? 'all' :
		    						 scList.RATING > 18 ? 18 : scList.RATING;
			            // 받아온 날자값 변환    		
			            var d = new Date(scList.DATE)
			            var date = d.getFullYear() + '.' +  (d.getMonth()+1) + '.' + d.getDate();
			            
			            
			            var rDate = scList.D_DAY <= 0 ? '상영중' : '예매중';
			            
			    		var text = `
		 		    	<li>
		 		    	<div class="col-times">
		 		    		<div class="info-movie">
		 		    			<i class="cgvIcon etc age\${rating}">\${rating}</i>
		 		    			<a href="#" target="_parent">
								<strong>\${scList.TITLE}</strong></a>
		 		    			<span class="round">
		 		    				<em>\${rDate}</em>
		 		    			</span>
		 		    			<span class="round">
		 		    				<em>${D_DAY > 0 ? D_DAY : null}</em>
		 		    			</span>
								<i>\${scList.GENRE}</i> / <i>\${scList.RUNTIME}</i> / <i>\${date} 개봉</i>
		 		    		</div>
		 		    	</div>
		 		    	</li>
						`;
						$('.sect-showtimes>ul').append(text);
						
						if(rDate == '예매중') {
							$('.col-times:last').find('.round').eq(0).addClass('brown').eq(1).addClass('red');
						} else {
							$('.col-times:last').find('.round').eq(0).addClass('round lightblue');
						}
		    		};
		    		
		    		var d = new Date(scList.DATE)
		            var date = d.getHours(); + ':' +  d.getMinutes();
		    		
		    		var text = ` <div class="type-hall">
	    							<div class="info-hall">
		 		    					<ul>
		 		    						<li>2D</li>
		 		    						<li>\${scList.TH_NUMBER}</li>
		 		    						<li>총 158석</li>
		 		    					</ul>
	  		    					<div class="info-timetable">
		                                <ul>
	    	                            </ul>
	                             	</div>
	  		    				</div>
	  		    				</div>`
	  		    				
	  		    	if(index != 0 && scList.MOVIE_NUM != pre.MOVIE_NUM) rNum += 1;
		  		    if(index == 0 || scList.MOVIE_NUM != pre.MOVIE_NUM || scList.TH_NUMBER != pre.TH_NUMBER) {
		  		    	$('.col-times:last').append(text);
		  		    }
		            
		    		
		    		// 상영시작시각 변환
		    		var s = new Date(scList.SC_TIME);
		    		var scTime = s.getHours() + ":" + s.getMinutes();
		    		
		    		
		    		var timeTable = `<li>
						    		    <a href="#" target="_top">
							    	        <em>\${scTime}</em>
							    	        <span class="txt-lightblue">
							    	            <span class="hidden">잔여좌석</span>113석
							    	        </span>
							    	    </a>
							    	</li>`
							    	
		    		$('.info-timetable:last').find('ul').append(timeTable);
	     		
		    		// 값 저장해서 다음 루프에서 값을 비교할때 사용
		    		pre = scList;	
				});
		    	
		    },// success 종료
		    error: function(error) {
// 		    	alert('에러');
			}
		});
});

// 페이지 표시 함수
function pageCount(num) {
	$('.day').hide();
		$('.day').filter(index => index >= (pageSize * num) && index < pageSize * (num + 1)).show();
}

// 보이는 첫 페이지 클릭

$(function() {
	var pageSize = 8;
	// 날자 클릭시
	//이전날짜
	$('.btn-prev').on('click', function() {
		if($('.day:first').is(':visible')) return;
		var class_On = $('.item .on');
		var index = $('.item li').index(class_On);
		var num = (index / pageSize) - 1 < 0 ? 0 : (index / pageSize) - 1;  
		pageCount(num);
		
		$('.day').parent('li').removeClass();
		firstPage()
	});
	
	//다음 페이지
	$('.btn-next').on('click', function() {
		if($('.day:last').is(':visible')) return;
		
		var class_On = $('.item .on');
		var index = $('.item li').index(class_On);
		var num = (index / pageSize) + 1;
		//>  ? return : (index / pageSize) + 1;  
		pageCount(num);
		
		$('.day').parent('li').removeClass();
		firstPage()
	});
	
});

$(document).ready(function() {
	$('.region:first').trigger('click');
// 	$('.area-link:visible:first').trigger('click');
	pageCount(0);
});

</script>
        <div class="sect-guide">
            <div class="descri-timezone">
                <ul>
                    <li><span class="early">모닝</span></li>
                    <li><span class="midnight">심야</span></li>
                </ul>
                <p>
                    * 시간을 클릭하시면 빠른 예매를 하실 수 있습니다.</p>
            </div>
        </div>

        <div class="sect-showtimes">
            <ul>
            </ul>
        </div>
      
        <p class="info-noti">
            </p><p>ㆍ입장 지연에 따른 관람 불편을 최소화하기 위해 영화는 10분 후 상영이 시작됩니다.</p>
        <p></p>
    </div>
<!--/ Contents End -->
<!-- /Showtimes End -->

</div>
        </div>
        <div class="col-aside">
            <div class="ad-partner01"> 
            	<iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@M_Rectangle" width="160" height="300" title="영화광고-파일럿" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="M_Rectangle" id="M_Rectangle"></iframe>
            </div>
            <div class="ad-partner02">
            	<iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@C_Rectangle" width="160" height="300" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="C_Rectangle" id="C_Rectangle"></iframe>
            </div>
    </div>
</div>
<!-- 실컨텐츠 끝 --> 

            
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
    <footer>
		<!-- footer_area (s) -->
		
<div id="BottomWrapper" class="sect-ad">
    <iframe src="https://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@Bottom" width="100%" height="240" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="Bottom" id="Bottom"></iframe>
</div>
<ul class="policy_list">
    <li><a href="http://corp.cgv.co.kr/company/" target="_blank">회사소개</a></li>
    <li><a href="http://corp.cgv.co.kr/company/sustainabilityStrategy/strategy.aspx" target="_blank">지속가능경영</a></li>
    <li><a href="http://corp.cgv.co.kr/company/ir/financial/financial_list.aspx" target="_blank">IR</a></li>
    <li><a href="http://corp.cgv.co.kr/company/recruit/step/default.aspx" target="_blank">채용정보</a></li>
    <li><a href="http://corp.cgv.co.kr/company/advertize/ad_Default.aspx" target="_blank">광고/제휴/출점문의</a></li>
    <li><a href="http://www.cgv.co.kr/rules/service.aspx">이용약관</a></li>
    <li><a href="http://www.cgv.co.kr/rules/organized.aspx">편성기준</a></li>
    <li><a href="http://www.cgv.co.kr/rules/privacy.aspx"><strong>개인정보처리방침</strong></a></li>
    <li><a href="http://www.cgv.co.kr/rules/disclaimer.aspx">법적고지</a></li>
    <li><a href="http://www.cgv.co.kr/rules/emreject.aspx">이메일주소무단수집거부</a></li>
    <li><a href="http://corp.cgv.co.kr/company/ethicalManagement/ceoMessage.aspx" target="_blank">윤리경영</a></li>
    <li><a href="/company/cyberAudit.aspx" class="empha-red">사이버감사실</a></li>
</ul>
<article class="company_info_wrap">
    <section class="company_info">
        <address>(04377)서울특별시 용산구 한강대로 23길 55, 아이파크몰 6층(한강로동)</address>
        <dl class="company_info_list">
            <dt>대표이사</dt>
            <dd>허민회</dd>
            <dt>사업자등록번호</dt>
            <dd>104-81-45690</dd>
            <dt>통신판매업신고번호</dt>
            <dd>2017-서울용산-0662 <a href="#none" onclick="goFtc()" class="btn_goFtc">사업자정보확인</a><a></a></dd>
        </dl>
        <dl class="company_info_list">
            <dt>호스팅사업자</dt>
            <dd>CJ올리브네트웍스</dd>
            <dt>개인정보보호 책임자</dt>
            <dd>도형구</dd>
            <dt>대표이메일</dt>
            <dd>cjcgvmaster@cj.net</dd>
            
        </dl>
        <p class="copyright">© CJ CGV. All Rights Reserved</p>
    </section>
    <section class="familysite_wrap">
        <label for="familysite">CJ그룹 계열사 바로가기</label>
        <select id="familysite">
            <option value="" class="familysiteTitle">계열사 바로가기</option>
            <optgroup label="CJ그룹">
<option value="http://www.cj.net/">CJ주식회사</option>
</optgroup><optgroup label="식품 &amp; 식품서비스">
<option value="https://www.cj.co.kr/kr/index">CJ제일제당</option>
<option value="https://www.cjfoodville.co.kr/main.asp">CJ푸드빌</option>
<option value="http://www.cjfreshway.com/index.jsp">CJ프레시웨이</option>
</optgroup><optgroup label="생명공학">
<option value="https://www.cj.co.kr/kr/about/business/bio">CJ제일제당 BIO사업부문</option>
<option value="https://www.cj.co.kr/kr/about/business/bio">CJ Feed&amp;Card</option>
</optgroup><optgroup label="물류 &amp; 신유통">
<option value="https://www.cjlogistics.com/ko/main">CJ대한통운</option>
<option value="http://www.cjenc.co.kr/kr/Default.asp">CJ대한통운 건설부문</option>
<option value="https://www.oliveyoung.co.kr/store/company/brandStory.do">CJ올리브영</option>
<option value="https://www.cjolivenetworks.co.kr:449/">CJ올리브네트웍스</option>
<option value="https://www.cjoshopping.com:9002/index.asp">CJ ENM 커머스부문</option>
</optgroup><optgroup label="엔터테인먼트 &amp; 미디어">
<option value="https://www.cjenm.com/ko/">CJ ENM 엔터테인먼트부문</option>
<option value="http://corp.cgv.co.kr/">CJ CGV</option>
</optgroup>

        </select>
        <a href="#none" class="btn_familysite" onclick="goFamilySite()">GO</a>
    </section>
</article>
        <!-- footer_area (e) -->

        <div class="adFloat" style="display:block">

            <iframe src="//ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@Popicon" width="154" height="182" frameborder="0" scrolling="no" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" allowtransparency="true" id="ad_float1"></iframe>
        </div>
        <!-- //Float Ad -->
	</footer>
	<!-- E Footer -->

    
</div>
</body>
<script type="text/javascript">
$(function() {
	$('#viewgrade').on('click', function() {
		var text = `<div class="layer-wrap" style="">
						<div class="layer-contents" style="width:650px;">
					    <div class="popwrap">
				        <h5>CGV 관람 등급 안내</h5>
				        <div class="pop-contents">
				            <div class="tbl-list">
				                <table summary="CGV 등급별 관람 안내">
				                    <caption>CGV 관람 등급 안내</caption>
				                    <colgroup>
				                        <col width="136">
				                        <col width="*">
				                    </colgroup>
				                    <thead>
				                        <tr>
				                            <th scope="col">구분</th>
				                            <th scope="col">성명</th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                        <tr>
				                            <!--<th scope="row"><span class="ico-grade grade-all">전체 관람가</span>전체 관람가</th>
				                            <td>모든 연령의 고객님께서 관람하실 수 있습니다.</td>-->
				                            <th scope="row"><i class="cgvIcon etc ageAll">ALL</i>전체 관람가</th>
				                            <td>모든 연령의 고객님께서 관람하실 수 있습니다.</td>
				                        </tr>
				                        <tr>
				                            <th scope="row"><i class="cgvIcon etc age12">12</i>12세 관람가</th>
				                            <td>만 12세 미만의 고객님은 보호자를 동반하셔야 관람하실 수 있습니다.</td>
				                        </tr>
				                        <tr>
				                            <th scope="row"><i class="cgvIcon etc age15">15</i>15세 관람가</th>
				                            <td>만 15세 미만의 고객님은 보호자를 동반하셔야 관람하실 수 있습니다.</td>
				                        </tr>
				                        <tr>
				                            <th scope="row"><i class="cgvIcon etc age18">18</i>청소년관람불가</th>
				                            <td>만 19세 미만(영/유아 포함)은 보호자가 동반하여도 관람이 불가합니다.<br>
				                                (단, 만19세가 되는 해의 1월 1일을 맞이한 사람은 제외) <br>
				                                - 입장 시 신분증을 꼭 지참하시기 바랍니다<br>
				                                - 신분증(사진/캡쳐 불가)<br>
				                                &nbsp;&nbsp;주민등록증, 운전면허증, 여권, 모바일신분증(PASS, 정부24등)
				                            </td>
				                        </tr>
				                        <tr>
				                            <th scope="row"><i class="cgvIcon etc ageNotyet">미정</i>미정</th>
				                            <td>등급 미정 영화입니다.</td>
				                        </tr>
				                    </tbody>
				                </table>
				            </div>
				        </div>
				    </div>
			
				    <button type="button" class="btn-close">관람 등급 안내 닫기</button>
				</div></div>`
				
				$(this).parent('li').append(text);
	});
});
$(document).on('click', '.btn-close', function() {
	$('.layer-wrap').remove();
});
</script>
</head>
 </html>