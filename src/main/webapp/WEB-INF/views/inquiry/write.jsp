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
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/Imain" title="현재선택">고객센터 메인<i></i></a></li>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/often">자주찾는 질문<i></i></a></li>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/news">공지/뉴스<i></i></a></li>
            <li class="on"><a href="${pageContext.request.contextPath}/inquiry/write">1 : 1 문의하기<i></i></a></li>
            
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
					<h2 class="tit">1 : 1 문의</h2>
					<p class="stit">자주찾는 질문에서 원하는 답변을 찾지 못하셨군요 <br>
					불편사항이나 문의사항을 남겨주시면 최대한 신속하게 답변 드리겠습니다.</p>
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
			    <form id="form1" name="form1" action="${pageContext.request.contextPath}/inquiry/newswritePro" method="post" novalidate="novalidate">
					
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
								<tbody>
                                    <tr>
										<th scope="row"><label for="inp_name">이름</label></th>
										<td colspan="3"><strong>${member_name}</strong></td>
                                        <input type="hidden" id="HiddenUserID" name="HiddenUserID" value="49d86214f151d8588e1db70c4984e8e7">
                                        <input type="hidden" id="HiddenUserName" name="HiddenUserName" value="b8adb5c7e9659292">
									</tr>
									<tr>
										<th scope="row">휴대전화</th>
										<td><strong>${member_phone}</strong></td>
                                            <input type="hidden" id="HiddenMobile1" name="HiddenMobile1" value="ba76c0600b696fc22903d1b70b271741">
										<th scope="row">이메일</th>
										<td><span>${member_email}</span></td>
                                            <input type="hidden" id="HiddenEmail1" name="HiddenEmail1" value="bb9c1a16073b44512055ba27d0a9e0a65ce0395b7ccdfeb5">
									</tr>
                                    <tr class="check_info">
                                        <td colspan="4">
                                            <div>
                                                <strong>※&nbsp;&nbsp;문의에 대한 빠른 답변을 위해&nbsp;회원 가입 시 입력하신 연락처를 확인해주세요.</strong>
                                                <a href="https://www.cjone.com/cjmweb/member/passwd.do?coopco_cd=7010&amp;brnd_cd=1000" id="A1" class="round gray on" title="수정" target="_blank"><span>수정</span></a>
                                            </div>
                                            <div class="desc_miso">
                                                <p class="desc_txt1">고객님의 문의에 답변하는 직원은 <em>고객 여러분의 가족 중 한 사람</em>일 수 있습니다.</p>
                                                <p class="desc_txt2">OSTiket는 고객의 언어폭력(비하, 욕설, 반말, 성희롱 등)으로부터 고객상담직원을 보호하기 위해<br>관련 법에 따라 수사기관에 필요한 조치를요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.</p>
                                            </div>
                                        </td>
                                    </tr>
									<tr>
										<th scope="row">문의유형 <em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수"></em></th>
										<td colspan="3">
											<ul class="type_list">
												<li id="li_ra_1" class="on"><input type="radio" checked="checked" id="inp_type01" name="inquiry_type" value="T"><label for="inp_type01">전체 공개</label></li>
												<li id="li_ra_2"><input type="radio" id="inp_type02" name="inquiry_type" value="F"><label for="inp_type02">비공개</label></li>
											</ul>
										</td>
									</tr>
<!-- 									<tr> -->
<!-- 										<th scope="row">영화관 선택</th> -->
<!-- 										<td colspan="3"> -->
<!-- 											<ul class="type_list"> -->
<!-- 												<li class="on"><input type="radio" id="no_sel" name="sel_theaterchoise" checked="checked" value="0"><label for="no_sel">선택하지 않음</label></li> -->
<!-- 												<li><input type="radio" id="sel" name="sel_theaterchoise" value="1"><label for="sel">선택함</label></li> -->
<!-- 											</ul> -->
<!-- 											<label for="sel_t_group" class="hidden">국내,국외 선택</label> -->
<!-- 											<select title="국내,국외 선택" class="sel01" id="sel_t_group" name="sel_t_group" disabled="disabled" style="width: 96px;"> -->
<!-- 												<option value="dm">국내</option> -->
<!--                                                 <option value="oc">국외</option> -->
<!-- 											</select> -->
<!-- 											<label for="sel_regioncode" class="hidden">지역 선택</label> -->
<!-- 											<select title="지역 선택" class="sel01" id="sel_regioncode" name="sel_regioncode" disabled="disabled" style="width: 114px;"><option value="" selected="selected">지역 선택</option><option value="12">강원</option><option value="02">경기</option><option value="204">경상</option><option value="206">광주</option><option value="11">대구</option><option value="03">대전</option><option value="05">부산</option><option value="01">서울</option><option value="207">울산</option><option value="202">인천</option><option value="04">전라</option><option value="06">제주</option><option value="205">충청</option></select> -->
<!-- 											<label for="sel_theatercode" class="hidden">영화관 선택</label> -->
<!-- 											<select title="영화관 선택" class="sel01" id="sel_theatercode" name="sel_theatercode" disabled="disabled" style="width: 114px;"><option value="" selected="selected">영화관 선택</option></select> -->
<!-- 										</td> -->
<!-- 									</tr> -->
									<tr>
										<th scope="row"><label for="inp_title">제목 <em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수"></em></label></th>
										<td colspan="3">
											<input type="text" id="inp_title" name="inquiry_name" class="inp01" style="width: 672px;">
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="inp_textbox">내용 <em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수"></em></label></th>
										<td colspan="3">
											<textarea cols="60" rows="5" id="inp_textbox" name="inquiry_detail" class="inp_txtbox01" 
													  style=" height:94px !important;" 
													  placeholder="※문의 내용 및 첨부파일 내에 개인정보(신용카드번호, 계좌번호, 주민번호 등)가 포함되지 않도록 유의하시기 바랍니다. 
※ 이벤트 굿즈 재고 문의 안내  
   경품 특성상 실시간으로 소진되어 재고 안내가 어려운 관계로 문의 글에 대한 답변이 어렵습니다.

[재고 확인 불가 상품]
- 관람 특전 굿즈 재고 (포스터/뱃지/엽서/필름 마크 등의 영화 관람 시 제공되는 굿즈 상품 모두 포함)
- 씨네샵 재고/ 매점 프로모션 콤보 재고 (상품 판매 여부 및 재고 등)
- 선재물 재고 (영화 전단지 비치 여부 및 재고 등)"></textarea>
											<p class="byte_info"><span id="sp_ad_content_size_1">0</span>/5000BYTE <span>(<span id="sp_ad_content_size_2">0</span>/2500자)</span></p>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="voc_upload_file">첨부파일</label></th> 
										<td colspan="3">
                                             <input style="width:300px" type="file" id="voc_upload_file" name="inquiry_picture" title="voc파일 업로드" size="51" onclick="javascript:alert('주민번호 등 개인정보가 포함된 파일이 첨부되지 않도록 유의하시기 바랍니다.');"> 
                                             <br>*<b>첨부가능 확장자</b>: 이미지(jpg, gif, bmp, png, jpeg) ,워드문서(hwp, ppt, pptx, xls, xlsx, doc, docx, zip, pdf, txt)
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="box-btn qna_email">
							<a style="margin-left:5px" href="${pageContext.request.contextPath}/inquiry/Imain" class="round gray"><span style="padding:0 14px;">취소</span></a>
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

$(function () {     
	$('#inp_textbox').on('keyup', checkByte);
});

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