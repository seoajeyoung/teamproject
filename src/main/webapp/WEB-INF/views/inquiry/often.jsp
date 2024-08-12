<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/contact.jsp</title>
<link href="${pageContext.request.contextPath}/resources/css/customer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/module.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
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
    <h2>
        고객센터 메뉴</h2>
    <div class="snb">
        <ul>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/Imain">고객센터 메인<i></i></a></li>
            <li class="on"><a href="${pageContext.request.contextPath}/inquiry/often" title="현재선택">자주찾는 질문<i></i></a></li>
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
			<div class="customer_top">
				<h2 class="tit">자주찾는 질문</h2>
				<p class="stit">회원님들께서 가장 자주하시는 질문을 모았습니다. <br>궁금하신 내용에 대해 검색해보세요.</p>
			</div>
			<div class="search_area">
				<legend><label for="searchtext">검색</label></legend>
				<input id="searchtext" type="text" class="c_input" title="검색어 입력" placeholder="검색어를 입력해 주세요" value="" style="width:275px;">
				<button type="button" class="round inblack" title="검색하기" id="btn_search"><span>검색하기</span></button>
				<div class="qu_txt">
					<em>추천검색어 :</em>
                    
                            <span class="first"> <a href="#none">현금영수증</a></span>
                        
                            <span class=""> <a href="#none">관람권</a></span>
                        
                            <span class=""> <a href="#none">예매</a></span>
                        
                            <span class=""> <a href="#none">환불</a></span>
                        
                            <span class=""> <a href="#none">취소</a></span>
                        
                            <span class=""> <a href="#none"></a></span>
                        
				</div>
			</div>
			<div class="c_tab_wrap">
				<ul class="c_tab type_free">
					<li class="on"><a href="/support/faq/default.aspx?type=0&amp;searchtext=" style="font-size: 11px;" title="선택된 탭메뉴">전체</a></li>
					<li class=""><a href="/support/faq/default.aspx?type=101,239&amp;searchtext=" style="font-size: 11px;">예매/매표</a></li>
					<li class=""><a href="/support/faq/default.aspx?type=243&amp;searchtext=" style="font-size: 11px;">관람권/결제수단</a></li>
					<li class=""><a href="/support/faq/default.aspx?type=102,240&amp;searchtext=" style="font-size: 11px;">멤버쉽/클럽서비스</a></li>
                    <li class=""><a href="/support/faq/default.aspx?type=1262&amp;searchtext=" style="font-size: 11px;">VIP관련</a></li>
					<li class=""><a href="/support/faq/default.aspx?type=242&amp;searchtext=" style="font-size: 11px;">할인혜택</a></li>
					<li class=""><a href="/support/faq/default.aspx?type=103,246&amp;searchtext=" style="font-size: 11px;">영화관이용</a></li>
					<li class=""><a href="/support/faq/default.aspx?type=244&amp;searchtext=" style="font-size: 11px;">특별관</a></li>
					<li class=""><a href="/support/faq/default.aspx?type=104,1259&amp;searchtext=" style="font-size: 11px;">기프트샵</a></li>
					<li class=""><a href="/support/faq/default.aspx?type=105,245&amp;searchtext=" style="font-size: 11px;">홈페이지/모바일</a></li>
                 
				</ul>
			</div>
			<div class="search_result">
				  총<span class="num">156건</span>이 검색되었습니다.
			</div>
			<div class="tbl_area">
				<table cellspacing="0" cellpadding="0" class="tbl_notice_list">
				<caption>목록</caption>
				<colgroup>
					<col style="width:40px;">
                    <col style="width:120px;">
					<col style="width:560px;">
					<col style="auto">
				</colgroup>
				<thead>
					<tr>
					<th scope="col">번호</th>
                    <th scope="col">구분</th>
					<th scope="col" class="tit">제목</th>
					<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
                    
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>1</td>
                            <td>[홈페이지/모바일]</td>
						    <td id="title0" class="txt"><a href="/support/faq/detail-view.aspx?idx=951&amp;type=245&amp;searchtext=&amp;page=1">인터넷 예매 후 CGV 현장에서 환불(예매 취소)이 가능한가요?</a></td>
						    <td class="num">493237</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>2</td>
                            <td>[VIP관련]</td>
						    <td id="title1" class="txt"><a href="/support/faq/detail-view.aspx?idx=968&amp;type=1262&amp;searchtext=&amp;page=1">VIP 등급별 유지, 선정의 VIP점수 기준을 알고 싶어요</a></td>
						    <td class="num">484149</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>3</td>
                            <td>[관람권/결제수단]</td>
						    <td id="title2" class="txt"><a href="/support/faq/detail-view.aspx?idx=969&amp;type=243&amp;searchtext=&amp;page=1">관람권 사용해서 예매했는데 현금영수증 발행을 못했어요!</a></td>
						    <td class="num">483996</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>4</td>
                            <td>[멤버쉽/클럽서비스]</td>
						    <td id="title3" class="txt"><a href="/support/faq/detail-view.aspx?idx=980&amp;type=240&amp;searchtext=&amp;page=1">생일콤보 받는 방법을 알려주세요. (2020.04.01~)</a></td>
						    <td class="num">483533</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>5</td>
                            <td>[VIP관련]</td>
						    <td id="title4" class="txt"><a href="/support/faq/detail-view.aspx?idx=967&amp;type=1262&amp;searchtext=&amp;page=1">VIP 선정 기준은 어떻게 되나요?</a></td>
						    <td class="num">483078</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>6</td>
                            <td>[멤버쉽/클럽서비스]</td>
						    <td id="title5" class="txt"><a href="/support/faq/detail-view.aspx?idx=970&amp;type=240&amp;searchtext=&amp;page=1">아이핀(I-PIN) 이 무엇인가요?</a></td>
						    <td class="num">482270</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>7</td>
                            <td>[홈페이지/모바일]</td>
						    <td id="title6" class="txt"><a href="/support/faq/detail-view.aspx?idx=950&amp;type=245&amp;searchtext=&amp;page=1">인터넷 예매 후 예매 내용 확인은 어떻게 하나요?</a></td>
						    <td class="num">482170</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>8</td>
                            <td>[홈페이지/모바일]</td>
						    <td id="title7" class="txt"><a href="/support/faq/detail-view.aspx?idx=949&amp;type=245&amp;searchtext=&amp;page=1">이미 예매한 내역의 결제수단을 변경하고 싶어요.</a></td>
						    <td class="num">481969</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>9</td>
                            <td>[관람권/결제수단]</td>
						    <td id="title8" class="txt"><a href="/support/faq/detail-view.aspx?idx=971&amp;type=243&amp;searchtext=&amp;page=1">CGV영화관람권(무비머니)은 어떻게 구매하나요?</a></td>
						    <td class="num">481695</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>10</td>
                            <td>[홈페이지/모바일]</td>
						    <td id="title9" class="txt"><a href="/support/faq/detail-view.aspx?idx=990&amp;type=245&amp;searchtext=&amp;page=1">포토플레이 취소 및 환불 규정은 어떻게 되나요?</a></td>
						    <td class="num">479442</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>11</td>
                            <td>[특별관]</td>
						    <td id="title10" class="txt"><a href="/support/faq/detail-view.aspx?idx=972&amp;type=244&amp;searchtext=&amp;page=1">CINE&amp;LIVING ROOM(씨네앤리빙룸) 상영관은 어떤 곳인가요?</a></td>
						    <td class="num">479227</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>12</td>
                            <td>[영화관이용]</td>
						    <td id="title11" class="txt"><a href="/support/faq/detail-view.aspx?idx=996&amp;type=246&amp;searchtext=&amp;page=1">LOLOL(롤롤) 운영시간은 어떻게되나요?</a></td>
						    <td class="num">479181</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>13</td>
                            <td>[홈페이지/모바일]</td>
						    <td id="title12" class="txt"><a href="/support/faq/detail-view.aspx?idx=995&amp;type=245&amp;searchtext=&amp;page=1">통신사(SKT, KT, LGU+) 예매 시 적립/내가 본 영화 등록/포토플레이 제작은 어떻게 하나요?</a></td>
						    <td class="num">478627</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>14</td>
                            <td>[홈페이지/모바일]</td>
						    <td id="title13" class="txt"><a href="/support/faq/detail-view.aspx?idx=992&amp;type=245&amp;searchtext=&amp;page=1">포토플레이 제작 기준은 어떻게 되나요?</a></td>
						    <td class="num">478550</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>15</td>
                            <td>[특별관]</td>
						    <td id="title14" class="txt"><a href="/support/faq/detail-view.aspx?idx=979&amp;type=244&amp;searchtext=&amp;page=1">PRIVATE BOX 상영관은 어떤 곳인가요?</a></td>
						    <td class="num">478301</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>16</td>
                            <td>[홈페이지/모바일]</td>
						    <td id="title15" class="txt"><a href="/support/faq/detail-view.aspx?idx=991&amp;type=245&amp;searchtext=&amp;page=1">포토플레이 출력은 어떻게 하나요?</a></td>
						    <td class="num">477714</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>17</td>
                            <td>[홈페이지/모바일]</td>
						    <td id="title16" class="txt"><a href="/support/faq/detail-view.aspx?idx=993&amp;type=245&amp;searchtext=&amp;page=1">포토플레이 출력 가능 극장은 어떻게 되나요?</a></td>
						    <td class="num">477652</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>18</td>
                            <td>[홈페이지/모바일]</td>
						    <td id="title17" class="txt"><a href="/support/faq/detail-view.aspx?idx=1012&amp;type=105&amp;searchtext=&amp;page=1">영화관람료 소득공제에 대해 알고싶습니다.</a></td>
						    <td class="num">319424</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>19</td>
                            <td>[홈페이지/모바일]</td>
						    <td id="title18" class="txt"><a href="/support/faq/detail-view.aspx?idx=942&amp;type=245&amp;searchtext=&amp;page=1">내가 본 영화를 실수로 삭제했어요. 복구 가능한가요?</a></td>
						    <td class="num">309868</td>
					    </tr>
                        
                        <tr class="first">
                            <!--순번 오름차순으로 변경-->
						    <td>20</td>
                            <td>[홈페이지/모바일]</td>
						    <td id="title19" class="txt"><a href="/support/faq/detail-view.aspx?idx=1013&amp;type=105&amp;searchtext=&amp;page=1">온라인 선착순 경품 신청에 대해 알고싶습니다.</a></td>
						    <td class="num">242910</td>
					    </tr>
                        
				
				</tbody>
				</table>
			</div>
            <!--?xml version="1.0" encoding="utf-8"?-->
<div class="paging">
  <ul>
    <li class="on">
      <a title="1 페이지 선택" href=" #pg">1</a>
    </li>
    <li>
      <a href="/support/faq/default.aspx?page=2&amp;type=0&amp;searchtext=">2</a>
    </li>
    <li>
      <a href="/support/faq/default.aspx?page=3&amp;type=0&amp;searchtext=">3</a>
    </li>
    <li>
      <a href="/support/faq/default.aspx?page=4&amp;type=0&amp;searchtext=">4</a>
    </li>
    <li>
      <a href="/support/faq/default.aspx?page=5&amp;type=0&amp;searchtext=">5</a>
    </li>
    <li>
      <a href="/support/faq/default.aspx?page=6&amp;type=0&amp;searchtext=">6</a>
    </li>
    <li>
      <a href="/support/faq/default.aspx?page=7&amp;type=0&amp;searchtext=">7</a>
    </li>
    <li>
      <a href="/support/faq/default.aspx?page=8&amp;type=0&amp;searchtext=">8</a>
    </li>
  </ul>
  <button class="btn-paging end" type="button" onclick="location='/support/faq/default.aspx?page=8&amp;type=0&amp;searchtext='">끝</button>
</div>
			<div class="search_order">
				<ol>
				<li><span class="ico_oder find_q">01 자주찾는 질문 검색</span></li>
				<li><span class="ico_oder email_i">02 이메일 문의</span><a href="/support/qna/default.aspx"><img src="http://img.cgv.co.kr/support/faq/btn_inquiry.png" alt="문의"></a></li>	
                <li style="text-align: left;"><span class="ico_oder tel_i">03 고객센터 전화문의</span><span class="num">1544-1122<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(상담가능 시간, 월~금 09:00~18:00)</span></li>
				</ol>
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
                
//                if ($('#searchtext').val() == "") {
//                    alert("검색어를 입력해 주세요.");
//                    $('#searchtext').focus();
//                    return false;
//                } else {
//                    
                //                }
              
                Search();
            });
			
			$('#searchtext').keypress(function(event){
                if (event.which == 13) {
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
                return false;
            }

            $('.c_tab_wrap').children('.c_tab').children('li').on('click', function () {
                //$('.c_tab_wrap').children('.c_tab').children('li').removeClass("on");
                //$(this).addClass("on");

                location.href = $(this).children('a').attr("href") + escape("");
                return false;
            });

            $('.qu_txt').children('span').children('a').on("click", function () {
                location.href = "/support/faq/default.aspx?searchtext=" + escape($(this).html());
                return false;
            });
            //SR 4020337 검색어 검색 시 검색결과에서 해당 검색어 붉은색으로 변경
            var idx = 0;
           
            if ($('#searchtext').val()) {
                for (idx = 0; idx < 20; idx++) {
                    var search = $('#searchtext').val();
                    search = search.toUpperCase();
                    $("#title" + idx + " > a:contains('" + search + "')").each(function () {
                        var regex = new RegExp(search, 'gi');
                        $(this).html($(this).text().replace(regex, "<span style='color:red'>" + search + "</span>"));
                    });
                }
            }     

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