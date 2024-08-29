let contextPath = "/" + window.location.pathname.split("/")[1];

let isIdChecked = false; // 아이디 중복확인 눌렀는지 확인
let isNickChecked = false; // 닉네임 중복확인 눌렀는지 확인
let isPhoneChecked = false; // 핸드폰 중복확인 눌렀는지 확인


let isIdValid = false; // 아이디 사용가능 유무 확인
let isNickValid = false; // 닉네임 사용가능 유무 확인
let isPhoneValid = false; // 핸드폰 사용가능 유무 확인

let passCkValid = false;


$( document ).ready(function() {
	// 엔터 키 입력을 감지하여 기본 폼 제출을 막음
    $('#signupForm').on('keypress', function(event) {
        if (event.keyCode === 13) { // 엔터 키의 keyCode
            event.preventDefault(); // 기본 폼 제출을 막음
        }
    });
    
    // 아이디 입력 필드가 변경될 때 중복 확인 상태 초기화
    $('#id').on('input', function () {
        isIdChecked = false; // 아이디 입력 변경 시 중복 확인 상태 초기화
        $('#idck').html(''); // 메시지 초기화
    });

    $("#idbtn").click(function() { // 아이디 중복확인 버튼 눌렀을 때 실행
        $.ajax({
            type: 'get',
            url: contextPath + '/member/idCheck',
            data: {"member_id": $('#id').val()},
            dataType: 'html',
            success: function(result) {
                if (result == "iddup") {  // 아이디가 중복될 경우
                    result = "이미 존재하는 아이디입니다.";
                    $('#idck').html(result).css('color', 'red');
                    isIdValid = false;
                } else {
                    result = "사용 가능한 아이디입니다."
                    $('#idck').html(result).css('color', 'green');
                    isIdValid = true;
                    isIdChecked = true;
                }
            },
            error: function(e) {
                alert("에러! 관리자에게 문의하세요.");
            }
        });
    }); // 아이디 중복확인 클릭 했을때 메서드 끝


	$('#passck').on('keyup', function() {
	    let $content = $('#confirmPasswdResult');
	    let passValue1 = $('#pass').val();
	    let passValue2 = $('#passck').val();
	
	    if (passValue1 === passValue2 && passValue2 !== '') {
	        $content.text("비밀번호 일치").css('color', 'green');
	        passCkValid = true;
	    } else if (passValue2 === '') {
	        $content.text('');
	    } else {
	        $content.text("비밀번호 불일치").css('color', 'red');
	        passCkValid = false;
	    }
	});

    // 비밀번호 입력 필드의 변화가 있을 때 비밀번호 확인 필드의 상태를 업데이트
    $('#pass').on('keyup', function() {
        $('#passck').trigger('keyup');
        passCkValid = false;
    });
    
    // 닉네임 입력 필드가 변경될 때 중복 확인 상태 초기화
    $('#nickname').on('input', function () {
        isNickChecked = false; // 아이디 입력 변경 시 중복 확인 상태 초기화
        isNickValid = false;
        $('#nickck').html(''); // 메시지 초기화
    });

    $("#nickbtn").click(function() {
        $.ajax({
            type: 'get',
            url: contextPath + '/member/nickCheck',
            data: {"member_nickname": $('#nickname').val()},
            dataType: 'html',
            success: function(result) {
                if (result == "nickdup") {
                    result = "이미 존재하는 닉네임입니다.";
                    $('#nickck').html(result).css('color', 'red');
                    isNickValid = false;
                } else {
                    result = "사용 가능한 닉네임입니다."
                    $('#nickck').html(result).css('color', 'green');
                    isNickValid = true;
                    isNickChecked = true;
                }
            },
            error: function(e) {
                alert("에러! 관리자에게 문의하세요.");
            }
        });
    }); // 닉네임 중복확인 클릭 했을때 메서드 끝
    
    // 핸드폰 입력 필드가 변경될 때 중복 확인 상태 초기화
    $('#phone').on('input', function () {
        isPhoneChecked = false; // 아이디 입력 변경 시 중복 확인 상태 초기화
        isPhoneValid = false;
        $('#phoneck').html(''); // 메시지 초기화
    });

    $("#phonebtn").click(function() { // 아이디 중복확인 버튼 눌렀을 때 실행
        $.ajax({
            type: 'get',
            url: contextPath + '/member/phoneCheck',
            data: {"member_phone": $('#phone').val()},
            dataType: 'html',
            success: function(result) {
                if (result == "phonedup") {  // 아이디가 중복될 경우
                    result = "이미 가입하신 계정이 있는 전화번호입니다.";
                    $('#phoneck').html(result).css('color', 'red');
                    isPhoneValid = false;
                } else {
                    result = "사용 가능한 전화번호입니다."
                    $('#phoneck').html(result).css('color', 'green');
                    isPhoneValid = true;
                    isPhoneChecked = true;
                }
            },
            error: function(e) {
                alert("에러! 관리자에게 문의하세요.");
            }
        });
    }); // 아이디 중복확인 클릭 했을때 메서드 끝
	
	// 폼 제출 시 도메인 부분이 올바르게 추가되도록 이벤트 리스너 추가
	$('form').on('submit', function(event) {
	    const $email = $('#email');
	    const $emailDomain = $('#emailDomain');
	
	    let emailValue = $email.val().trim();
	    let emailDomainValue = $emailDomain.val().trim();
	
	    // 이메일 필드에 '@'가 없고 도메인 필드가 비어있지 않은 경우
	    if (emailValue.indexOf('@') === -1 && emailDomainValue) {
	        $email.val(emailValue + '@' + emailDomainValue);
	    }
	
	    // 이메일 필드에 도메인이 이미 포함되어 있는 경우
	    if (emailValue.indexOf('@') !== -1) {
	        // 도메인 필드에 설정된 도메인 값이 이메일 필드와 일치하지 않으면 업데이트
	        const currentDomain = emailValue.split('@')[1];
	        if (emailDomainValue && currentDomain !== emailDomainValue) {
	            $email.val(emailValue.split('@')[0] + '@' + emailDomainValue);
	        }
	    }
	});
	
	
	
	
	
    $('#domainList').on('change', function() {
    	const selectedValue = $(this).val();
    	const $emailDomain = $('#emailDomain');
    	const $email = $('#email');

    	if (selectedValue === 'type') { // 직접 입력 선택 시
        	$emailDomain.show(); // 직접 입력 필드 표시
        	$emailDomain.val(''); // 값 초기화
        	$emailDomain.focus(); // 직접 입력 필드에 포커스

        	// 이메일 앞부분에서 도메인 부분 제거
        	$email.val(function(index, currentValue) {
            	return currentValue.split('@')[0]; // '@' 이후 제거
        	});
    	} else { // 선택된 도메인 값을 사용하는 경우
        	$emailDomain.hide(); // 직접 입력 필드 숨김
        	$emailDomain.val(selectedValue); // 선택된 도메인 값 설정

        	// 이메일 앞부분과 선택된 도메인으로 이메일 주소 설정
        	$email.val(function(index, currentValue) {
            	let parts = currentValue.split('@');
            	// 이메일 값이 도메인을 중복해서 추가하지 않도록
            	if (parts.length > 1) {
                	return parts[0] + '@' + selectedValue;
            	}
            	return currentValue.split('@')[0] + '@' + selectedValue;
			});
		}
	}); // 도메인 값을 그냥 이메일값에 추가해버리는 식으로 변경

    // 초기 상태에서 직접 입력 필드를 기본적으로 보이게 설정
    $('#emailDomain').show();
    
    $('.gender').change(function() { // 성별 눌렀을 때 색 들어오게 하기
        // 모든 라벨의 테두리 색상을 초기화
        $('.genderlabel').css('border-color', '#c6c6c6');
        
        // 체크된 라디오 버튼에 해당하는 라벨의 테두리 색상을 변경
        $('label[for="' + this.id + '"]').css('border-color', '#fb4357');
    });
	
	
	$('#signupForm').on('submit', function(event) { // 회원가입 눌렀을 때 필수 항목, 문자 패턴, 확인
        let essentialFields = ['#id', '#pass', '#passck', '#name', 
            '#nickname', '#birth', '.gender', '#phone'];
        let id = $('#id').val().trim();
        let pass = $('#pass').val().trim();
        let nickname = $('#nickname').val().trim();
        let name = $('#name').val().trim();
        let phone = $('#phone').val().trim();
        let birth = $('#birth').val().trim();
        
        let idPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,20}$/; // 아이디 패턴 (영문 숫자 5~20자)
        let passPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{5,20}$/;// 비밀번호 패턴 (영문 숫자 특수문자 5~20자)
        let nicknamePattern = /^[A-Za-z가-힣0-9]{2,10}$/; // 닉네임 패턴 (한글, 영문, 숫자 따로&섞어서 사용가능 2~10자
        let namePattern = /^[가-힣]{2,5}$/; // 한글 2~5글자
        let phonePattern = /^(010|011|016|017|018|019)\d{7,8}$/; // 전화번호 패턴
        let birthPattern = /^\d{8}$/; // 8자리 숫자 (YYYYMMDD 형식)
        
        let isValid = true;

        for (let i = 0; i < essentialFields.length; i++) {
            let value = $(essentialFields[i]).val().trim();
            if (value === "") {
                alert('모든 필수 항목을 입력해주세요.');
                isValid = false;
                event.preventDefault();
                return;
            }
        }

	        // 패턴 검사
	    if (!idPattern.test(id)) {
	        alert('아이디에는 영문, 숫자가 하나 이상 포함되어야 합니다.(5~20자)');
	        isValid = false;
	        isIdChecked = false;
	    } else if (!passPattern.test(pass)) {
	        alert('비밀번호에는 영문, 숫자, 특수문자가 하나 이상 포함되어야 합니다.(5~20자)');
	        isValid = false;
	    } else if (!nicknamePattern.test(nickname)) {
	        alert('닉네임에는 한글, 영문, 숫자만 사용 가능합니다.(2~10자)');
	        isValid = false;
	        isNickChecked = false;
	    } else if (!namePattern.test(name)) {
	        alert('이름은 한글만 사용 가능합니다.(2~5자)');
	        isValid = false;
	    } else if (!phonePattern.test(phone)) {
	        alert('유효하지 않은 전화번호입니다.');
	        isValid = false;
	        isPhoneChecked = false;
	    } else if (!birthPattern.test(birth)) {
	        alert('유효하지 않은 생년월일입니다.');
	        isValid = false;
	    } else if (!passCkValid) {
	        alert('비밀번호가 일치하지 않습니다.');
	        isValid = false;
	    } 
	    
	    // 중복 확인 검사
	    if (!isIdChecked || !isIdValid) {
	        alert('아이디 중복 확인 결과를 확인해주세요.');
	        isValid = false;
	    } else if (!isNickChecked || !isNickValid) {
	        alert('닉네임 중복 확인 결과를 확인해주세요.');
	        isValid = false;
	    } else if (!isPhoneChecked || !isPhoneValid) {
	        alert('전화번호 중복 확인 결과를 확인해주세요.');
	        isValid = false;
	    }
        

        if (!isValid) {
            event.preventDefault(); // 폼 제출 방지
        }
        
        
	}); // 폼 제출 메서드 끝
	
	
}); // document.ready 끝