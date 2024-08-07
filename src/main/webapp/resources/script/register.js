let contextPath = "/" + window.location.pathname.split("/")[1];

let isIdChecked = false; // 아이디 중복확인 눌렀는지 확인
let isNickChecked = false; // 닉네임 중복확인 눌렀는지 확인

let isIdValid = false; // 아이디 사용가능 유무 확인
let isNickValid = false; // 닉네임 사용가능 유무 확인

$( document ).ready(function() {

    $("#idbtn").click(function(){ // 아이디 중복확인 버튼 눌렀을 때 실행
 		//alert("클릭");  // js 적용된건지 테스트

		$.ajax({
			type:'get',
			url: contextPath + '/member/idCheck', 
			data:{"member_id":$('#id').val()},
			dataType:'html',
			success:function(result){
				if(result == "iddup") {  // 아이디가 중복될 경우
					result = "이미 존재하는 아이디입니다.";
					$('#idck').html(result).css('color', 'red');
					isIdValid = false;
				}else {
					result = "사용 가능한 아이디입니다."
					$('#idck').html(result).css('color', 'green');
					isIdValid = true;
				}
				isIdChecked = true;
				

			},
		    error:function(e){
				alert("에러! 관리자에게 문의하세요.");
			}
		}); //ajax 끝
		
	}); // 아이디 중복확인 클릭 했을때 메서드 끝
	
	$('#passck').on('keyup', function() {
        let $content = $('#confirmPasswdResult'); // jQuery 객체로 변경
   	    let passValue1 = $('#pass').val(); // 비밀번호 입력 필드의 값
    	let passValue2 = $('#passck').val(); // 비밀번호 확인 입력 필드의 값
    	let passCkValid = false; // 비밀번호 일치여부
    	
    	
    	if (passValue1 === passValue2 && passValue2 !== '') {
        	$content.text("비밀번호 일치").css('color', 'green'); // 비밀번호 일치 시 텍스트와 색상 설정
        	passCkValid = true;
    	} else if (passValue2 === '') {
        	$content.text(''); // 비밀번호 확인 필드가 비어있는 경우 텍스트 제거
    	} else {
        	$content.text("비밀번호 불일치").css('color', 'red'); // 비밀번호 불일치 시 텍스트와 색상 설정
    	}
	});

// 비밀번호 입력 필드의 변화가 있을 때 비밀번호 확인 필드의 상태를 업데이트
	$('#pass').on('keyup', function() {
    	$('#passck').trigger('keyup');
	});
	
	 $("#nickbtn").click(function(){
 		
		$.ajax({
			type:'get',
			url: contextPath + '/member/nickCheck',
			data:{"member_nickname":$('#nickname').val()},
			dataType:'html',
			success:function(result){
				if(result == "nickdup") {
					result = "이미 존재하는 닉네임입니다.";
					$('#nickck').html(result).css('color', 'red');
					isNickValid = false;
				}else {
					result = "사용 가능한 닉네임입니다."
					$('#nickck').html(result).css('color', 'green');
					isNickValid = true;
					
				}
				isNickChecked = true;
				
			},
			error:function(e){
				alert("에러! 관리자에게 문의하세요.");
			}
		}); //ajax 끝
		
	}); // 닉네임 중복확인 클릭 했을때 메서드 끝
	
	
    $('#domainList').on('change', function() { // 이메일 도메인 상자 조작 시
        const selectedValue = $(this).val();
        const $emailDomain = $('#emailDomain');
        const $email = $('#email');

        if (selectedValue === 'type') { // 직접입력 선택 시
            $emailDomain.show(); // 직접입력 필드 표시
            $emailDomain.val(''); // 값 초기화
            $emailDomain.focus(); // 직접입력 필드에 포커스
            // 도메인 입력 필드를 활성화할 때 이메일 입력 필드에서 '@' 이후를 제거
            
            	  // 이메일 앞부분에서 도메인 부분 제거
            $email.val(function(index, currentValue) {
                return currentValue.split('@')[0]; // '@' 이후 제거
            });
        } else { // 선택된 도메인 값을 사용하는 경우
            $emailDomain.hide(); // 직접 입력 필드 숨김
            $emailDomain.val(selectedValue); // 직접 입력 필드 값 초기화

            // 이메일 앞부분과 선택된 도메인으로 이메일 주소 설정
            $email.val(function(index, currentValue) {
                return currentValue.split('@')//[0] + '@' + selectedValue;
            });
        }
    });

    // 초기 상태에서 직접 입력 필드를 기본적으로 보이게 설정
    $('#emailDomain').show();
    
    $('.gender').change(function() { // 성별 눌렀을 때 색 들어오게 하기
        // 모든 라벨의 테두리 색상을 초기화
        $('.genderlabel').css('border-color', '#c6c6c6');
        
        // 체크된 라디오 버튼에 해당하는 라벨의 테두리 색상을 변경
        $('label[for="' + this.id + '"]').css('border-color', '#fb4357');
    });
	
	
	$('#signupForm').on('submit', function(event) { // 회원가입 눌렀을 때 필수 항목, 문자 패턴,  확인
	    //debugger;
    	let essentialFields = ['#id', '#pass', '#passck', '#name', 
        	'#nickname', '#birth', '.gender', '#phone']; // essentialtf 이용해서 id만 추출가능하도록 하면 좋을듯
        	
    	let id= '$(#id)'.val().trim();
		let pass= '$(#pass)'.val().trim();
    	
        
        let idPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{1,20}$/; // 아이디 닉네임 패턴 (영문 숫자 20자)
        let passPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{1,20}$/;// 비밀번호 패턴 (영문 숫자 특수문자 20자)
        let isValid = true;
        
        for (let i = 0; i < essentialFields.length; i++) {
        	let value = $(essentialFields[i]).val().trim();
        	if (value === "") {
            	alert('모든 필수 항목을 입력해주세요.');
            	isValid = false;
            	break;
        
        	}
        }
		

		
		// 폼 제출 방지
		// if문으로 우선순위 확인
		// 필수 항목 검사
        // if (id === "" || pass === "" || ) {
            // alert('모든 필수 항목을 입력해주세요.');
            // isValid = false;
        if (!idPattern.test(id)) {
            // 아이디 검사
            alert('아이디에는 영문, 숫자가 하나 이상 포함되어야 합니다.');
            isValid = false;
        } else if (!passPattern.test(pass)) {
        	alert('비밀번호에는 영문, 숫자, 대소문자가 하나 이상 포함되어야 합니다.');
            isValid = false;
        } else if (!passConfirmValid) {
            // 비밀번호 확인 검사
            alert('비밀번호가 일치하지 않습니다.');
            isValid = false;
        } else if (!isIdChecked || !isIdValid) { //중복
            alert('아이디 중복 확인 결과를 확인해주세요.');
            isValid = false;
        } else if (!isNickChecked || !isNickValid) {
            alert('닉네임 중복 확인 결과를 확인해주세요.');
            isValid = false;
        }

        if (!isValid) {
            event.preventDefault();
        }
        
	}); // 폼 제출 메서드 끝
}); // document.ready 끝