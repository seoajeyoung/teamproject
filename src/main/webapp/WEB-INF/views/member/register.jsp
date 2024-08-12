<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="${pageContext.request.contextPath}/resources/css/member/register.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/register.js"></script>
</head>
<body>
	<!-- 아이디 / 비밀번호 / 비밀번호확인 /생년월일 / 성별 / 이메일 / 휴대폰번호 / 버튼 -->
	<form id="signupForm" class="signupForm" autocomplete="off"
		action="${pageContext.request.contextPath}/member/registerPro" method="post">
		<div class="signupField">
			<h2 class="headText">OSTicket 회원가입</h2>
			<div class="essentialtf">
				<input id="id" name="member_id" type="text" class="id"
					placeholder="아이디" maxlength="20"> 
				<span class="idhint">(영문, 숫자를 하나 이상 포함해야 합니다.(5~20자))</span> 
				<input type="button" value="중복체크" id="idbtn">
				<div id="idck" class="checkText"></div>

			</div>
			<div class="essentialtf">
				<input id="pass" name="member_pass" type="password" class="pass"
					placeholder="비밀번호" maxlength="20"> 
				<span class="passhint">(영문, 숫자, 특수문자를 하나 이상 포함해야 합니다.(5~20자))</span>
			</div>
			<div class="essentialtf">
				<input id="passck" name="member_passck" type="password" class="pass"
					placeholder="비밀번호 확인" maxlength="20"> <span id="confirmPasswdResult"></span>
			</div>
			<div class="essentialtf">
				<input id="name" name="member_name" type="text" class="name" placeholder="이름" maxlength="5">
			</div>
			<div class="essentialtf">
				<input id=nickname name="member_nickname" type="text"
					class="nickname" placeholder="닉네임(활동명)"> <input
					type="button" value="중복체크" id="nickbtn">
				<div id="nickck" class="checkText"></div>
			</div>
			<div class="textForm emailContainer">
				<input id=email name="member_email" type="text" class="email"
					placeholder="이메일"> @ 
				<input name="email_domain" type="text"
					class="emailDomain" id="emailDomain" placeholder="입력" /> 
					<select class="domainList" id="domainList">
					<option value="type">직접 입력</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
				</select>
			</div>
			<div class="essentialtf">
				<input id="birth" name="member_birth" type="text" class="birth"
					placeholder="생년월일(8자리)" maxlength="8">
				<div class="genderContainer">
					<label for="gender" class="genderlabel">남</label> <input type="radio" id="gender" class="gender" name="member_gender" value="남">
					<label for="gender2" class="genderlabel">여</label> <input type="radio" id="gender2" class="gender" name="member_gender" value="여">
				</div>
			</div>
			<div class="essentialtf">
				<input id="phone" name="member_phone" type="text" class="cellphoneNo"
					placeholder="전화번호" maxlength="11">
			</div>
			<input type="submit" class="btn" value="회원가입">
		</div>
	</form>
	
	
</body>
</html>