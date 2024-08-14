<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage/mytest.jsp</title>
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
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
		<div class="col-detail">
			<div class="mycgv-info-wrap">
		<div class="skipnaiv">
			<a href="#menu" id="skipPersoninfo">개인화영역 건너띄기</a>
		</div>
        <div class="sect-person-info">
        	<h2 class="hidden">개인화 영역</h2> 
        	<div class="box-image">
				<span class="thumb-image">
					<img src="https://img.cgv.co.kr/MyCGV/Profile/2015/0713/kis0726_053122_M.jpg" alt="김우석                                            님 프로필 사진" onerror="errorImage(this, {'type':'profile'})">
					<span class="profile-mask"></span>
				</span>
        	</div>
        	<div class="box-contents newtype">
        		<div class="person-info">
        			<strong>김우석                                            님</strong>
        			<em>kis0726</em>
        			<span>닉네임 : 조혜령이 </span>
        			<button id="go_edit_page" type="button" title="새창열림">나의 정보 변경</button>
        		</div>
        		<div class="grade-info">
        	        
                    <p style="margin-bottom:4px;color: #342929;font-family: 'NanumBarunGothicBold', '맑은 고딕', '돋움', Dotum, sans-serif;font-size: 20px;line-height: 20px;">
                        
                            고객님은   <strong class="txt-purple">일반</strong> 입니다.             
                        
                    </p>

        			<button type="button" id="view_usergrade" class="round black"><span>MY 지난등급이력 보기</span></button> 
        			

                    <div class="mycgv_btn_special2">
					<!-- 대구 아이피접속자 중 : 동성로 미가입 고객시 a.special_pop_text 노출/ 가입 고객은 a.special0_pop 노출 부탁드립니다.
						또한 아무 해당 없는 고객에게는 .mycgv_btn_special2 에 클래스 none 추가 부탁드립니다. 
						-->
                        
					   
				    </div>


        		</div>
        	</div>
        </div>
        <div class="cols-benefit-info">
        	<div class="col-my-coupon">
        		<h3>MY COUPON</h3>
        		<ul>
                    
                    <li>
        				<strong>CGV VIP에 도전하세요!</strong>
        				<span><a href="/user/vip-lounge/" class="round black1"><i>CGV VIP 혜택보기</i></a></span>
        			</li>
                    
        			<li>
        				<strong>CGV 할인쿠폰</strong>
        				<span><em><a href="/user/mycgv/coupon/discount/list.aspx?g=1#contaniner">0</a></em> 개</span>
        			</li>
        			<li>
        				<strong>영화관람권</strong>
        				<span><em><a href="/user/mycgv/coupon/movie-ticket/list.aspx?g=1#contaniner">0</a></em> 개</span>
        			</li>
        		</ul>
        	</div>
        	
                
                <div class="col-one-point">
               	<h3>CJ ONE POINT</h3>
        		<a href="/user/mycgv/cjone-point/pointlist.aspx">CJ ONE POINT 더보기</a>
        		<ul>
        			<li>
        				<strong>CJ ONE 사용가능 포인트</strong>
        				<span><em class="txt-maroon"><a href="/user/mycgv/cjone-point/pointlist.aspx">167</a></em> 점</span>
        			</li>
                    <!--
        		    <li class="tooltip_list cf">
        				<strong>VIP선정 포인트</strong><a href="/user/mycgv/cjone-point/pointlist.aspx" class="mycgv_tooltip"><img src="https://img.cgv.co.kr/R2014/images/common/mycgv_tooltip/ico_tooltip.png" alt="i" /></a>

                        <div class="tooltip_con tc2"><span><img src="https://img.cgv.co.kr/R2014/images/common/mycgv_tooltip/tooltip_con2.png" alt="CGV에서 구매를 통해 적립된 매표 구매 포인트/매점&amp;씨네샵 구매 포인트/VIP 선정에 포함되는 이벤트 포인트가 누적으로 합산된 포인트 입니다" /></span></div>
        				<span><em>0</em> 점</span>
        			</li>
                    -->
        		</ul> 
                    <!-- 2022.11.15 VIP 1차 개편 관련 수정-->
                    <div class="myCgv_content">
                        <h3>VIP 점수</h3>
                        <ul>
                            <li>
                                <strong>VIP 누적 점수
                                    <a href="#none">
                                        <i class="cgvIcon system notice">system/notice</i>
                                        <em class="tooltip_notice">VIP점수 상세 내역은 모바일-VIP<br>라운지에서 확인가능합니다.</em>
                                    </a>
                                </strong>
                                <span>0/10,000점</span>
                            </li>
                        </ul>
                    </div>

                
        	</div>
        	<div class="col-favorite-theater">
        		<h3 class="hidden">자주가는 CGV</h3>
	    		<div class="sect-favorite">
		            <ul id="favoriteTheaters">
                        
                            <li><a href="#" data-regioncode="05" data-theatercode="0061"><span>1<em>순위</em></span>CGV대연</a></li>
                        
                            <li><a href="#" data-regioncode="" data-theatercode=""><span>2<em>순위</em></span></a></li>
                        
                            <li><a href="#" data-regioncode="" data-theatercode=""><span>3<em>순위</em></span></a></li>
                        
                            <li><a href="#" data-regioncode="" data-theatercode=""><span>4<em>순위</em></span></a></li>
                        
                            <li><a href="#" data-regioncode="" data-theatercode=""><span>5<em>순위</em></span></a></li>
                        
		            </ul>
		            <button id="btn_set_my_favorite" title="새창" type="button" class="setting">자주가는 CGV<br>설정하기</button>
		        </div>
	        </div>
         
                <div class="cols-point-wrap">
                
                </div>
            
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
                location.href = "/support/faq/default.aspx?searchtext=" + escape($("#searchtext").val());
                //return false;
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