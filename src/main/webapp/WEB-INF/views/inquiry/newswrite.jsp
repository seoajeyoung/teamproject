<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>inquiry/write.jsp</title>
<link href="${pageContext.request.contextPath}/resources/css/inquiry/customer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/giftstore.css" rel="stylesheet">
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
    <h2>
        고객센터 메뉴</h2>
    <div class="snb">
        <ul>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/Imain">고객센터 메인<i></i></a></li>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/often">자주찾는 질문<i></i></a></li>
            <li class="on"><a href="${pageContext.request.contextPath}/inquiry/news" title="현재선택">공지/뉴스<i></i></a></li>
            <li class="" id="write"><a href="${pageContext.request.contextPath}/inquiry/write">1 : 1 문의하기<i></i></a></li>
            
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
			<div class="email_list_area">
				<div class="customer_top">
					<h2 class="tit">공지/뉴스 등록</h2>
					<p class="stit">공지 유형 구분 잘해서 등록해주세요<br>
					중복 공지 확인!!</p>
				</div>
                <!-- 팝업시작 -->
                <!-- 팝업 노출 시 .layer-wrap 에 클래스 .off는 없애고 .on 추가해주세요.-->
                <form name="aspnetForm" method="post" action="./default.aspx" id="aspnetForm" novalidate="novalidate">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJMTg2NjQxNTUxZGSeDpyMtHK/Zwe/eVXr2kc/8KgtFw==">
</div>

<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['aspnetForm'];
if (!theForm) {
    theForm = document.aspnetForm;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>


<div>

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="20574D40">
	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEdAAWD9Aa/hRH7d0EBA0LTEkADQd2cmKM3DmSS0q8fAL1AFthsxU3vl4YGjIP3SMsaT/LOxY5vxQes7QbmZvYFP+TepAzD3rjRF5ef/g5kCYWib1CrFP5H1XKS8pNUiQOw6h/NbmNt">
</div>
                    <div class="layer-wrap pop_corp_session logpopup off">
                        <div class="pop_wrap">
                            <h1>자동 로그아웃 안내</h1>
                            <button type="button" class="btn-close">자동 로그아웃 안내 팝업 닫기</button>
                            <div class="pop-contents">
                                <div class="sect-corp-session">
                                    <div class="cf ss_con_wrap">
                                        <h5>자동 로그아웃 남은 시간 : <span class="col_red"><em><span id="expTime"></span></em>초</span></h5>
                                        <p>로그인 시간을 연장하시려면 <br>로그인 연장 버튼을 클릭해주세요.</p>
                                    </div>
                                    <div class="cf ss_btn_wrap">
                                        <a id="ctl00_PlaceHolderContent_LinkButton1" class="round inblack" href="javascript:__doPostBack('ctl00$PlaceHolderContent$LinkButton1','')"><span>로그인 연장</span></a>
                                        <a id="ctl00_PlaceHolderContent_LinkButton2" class="round gray" href="javascript:__doPostBack('ctl00$PlaceHolderContent$LinkButton2','')"><span>로그아웃</span></a>
                                    </div>
                                </div>
                            </div>                
                        </div>
                    </div>
                </form>
                <!-- 팝업끝 -->
			    <form id="form1" name="form1" action="${pageContext.request.contextPath}/inquiry/newswritePro" method="post" novalidate="novalidate" enctype="multipart/form-data" onsubmit="return validateForm()">
					
                    <input type="hidden" id="hIsTemp" name="hIsTemp" value="N">
                    <input type="hidden" id="hIdx" name="hIdx" value="">
                    <fieldset>
						<legend>이메일 문의</legend>
						<div class="tbl_area">
							<p class="tbl_info_txt">체크(<em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수"></em>)된 항목은 필수 입력 사항입니다.</p>

							<table cellspacing="0" cellpadding="0" class="tbl_notice_list tbl_left">
								<caption>목록</caption>
								<colgroup>
									<col style="width:96px">
                                    <col style="width:303px">
                                    <col style="width:96px">
                                    <col style="width:303px">
								</colgroup>

									<tr>
										<th scope="row">공지유형 <em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수"></em></th>
										<td colspan="3">
											<ul class="type_list">
												<li id="li_ra_1" class="on"><input type="radio" checked="checked" id="inp_type01" name="NEWS_SECTION" value="SYS"><label for="inp_type01">시스템 점검</label></li>
												<li id="li_ra_2"><input type="radio" id="inp_type02" name="NEWS_SECTION" value="TH"><label for="inp_type02">극장</label></li>
												<li id="li_ra_2"><input type="radio" id="inp_type02" name="NEWS_SECTION" value="EV"><label for="inp_type02">행사/이벤트</label></li>
												<li id="li_ra_2"><input type="radio" id="inp_type02" name="NEWS_SECTION" value="RE"><label for="inp_type02">제휴이벤트</label></li>
												<li id="li_ra_2"><input type="radio" id="inp_type02" name="NEWS_SECTION" value="ECT"><label for="inp_type02">기타</label></li>
											</ul>
										</td>
									</tr>

									<tr>
										<th scope="row"><label for="inp_title">제목 <em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수"></em></label></th>
										<td colspan="3">
											<input type="text" id="inp_title" name="NEWS_NAME" class="inp01" style="width: 672px;">
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="inp_textbox">내용 <em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수"></em></label></th>
										<td colspan="3">
											<textarea cols="60" rows="5" id="inp_textbox" name="NEWS_CONTENT" class="inp_txtbox01" 
													  style=" height:94px !important;" 
													  placeholder="공지 내용 작성"></textarea>
											<p class="byte_info"><span id="sp_ad_content_size_1">0</span>/5000BYTE <span>(<span id="sp_ad_content_size_2">0</span>/2500자)</span></p>
										</td>
									</tr>
							
								</tbody>
							</table>
						</div>
						<div class="box-btn qna_email">
							<a style="margin-left:5px" href="${pageContext.request.contextPath}/inquiry/news" class="round gray"><span style="padding:0 14px;">취소</span></a>
                            <button style="width:80px" class="round inred" type="submit" id="emailsubmit"><span>등록하기</span></button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<!-- //Contents End -->
</div>



<script type="text/javascript">
var isLoggedIn = ${sessionScope.member_id != null};

$(function () {     
	$('#inp_textbox').on('keyup', checkByte);
	
	//로그인
	$('#write a').on('click', function(){
		if(!isLoggedIn){
			alert("로그인이 필요합니다.");
        	event.preventDefault();
		}
    });
});

//필수항목 입력
function validateForm() {
        // 필수 입력 필드 값을 가져옵니다.
        var title = document.getElementById("inp_title").value.trim();
        var content = document.getElementById("inp_textbox").value.trim();

        // 필수 입력 필드 검증
        if (title === "") {
            alert("제목을 입력해 주세요.");
            return false; // 폼 제출을 막습니다.
        }
        if (content === "") {
            alert("내용을 입력해 주세요.");
            return false; // 폼 제출을 막습니다.
        }

        return true; // 모든 검증을 통과하면 폼을 제출합니다.
    }


function checkByte() {
	let maxByte = 5000;
	
    var sString = $('#inp_textbox').val();
    var setBytes = getBytes(sString);
    if (setBytes > maxByte) {
        alert("최대 " + maxByte + "Bytes(한글 " + (maxByte / 2) + "자/영문 " + maxByte + "자)까지만 입력하실 수 있습니다.");
        cutOverText(obj, maxByte, viewAreaID1);
    }

    $('#sp_ad_content_size_1').html(setBytes);
    $('#sp_ad_content_size_2').html(Number(setBytes) / 2);
}

function getBytes(sString) {
    var c = 0;
    for (var i = 0; i < sString.length; i++) {
        c += parseInt(getByte(sString.charAt(i)));
    }
    return c;
}

function getByte(sChar) {
    var c = 0;
    var u = escape(sChar);
    if (u.length < 4) { // 반각문자 : 기본적인 영문, 숫자, 특수기호
        c++; // + 1byte
    } else {
        var s = parseInt(sChar.charCodeAt(0));
        if (((s >= 65377) && (s <= 65500)) || ((s >= 65512) && (s <= 65518))) // 반각문자 유니코드 10진수 범위 : 한국어, 일본어, 특수문자
            c++; // + 1byte
        else // 전각문자 : 위 조건을 제외한 모든 문자
            c += 2; // + 2byte
    }
    return c;
}

function cutOverText(obj, maxByte, viewAreaID) {
    var sString = obj.value;
    var c = 0;
    for (var i = 0; i < sString.length; i++) {
        c += parseInt(getByte(sString.charAt(i)));
        if (c > maxByte) {
            obj.value = sString.substring(0, i);
            break;
        }
    }
}
</script>

            
            <!--/ Contents End -->
		 </div>
		<!-- /Contents Area -->
	</div>

</body>
</html>