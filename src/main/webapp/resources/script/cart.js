let contextPath = "/" + window.location.pathname.split("/")[1];

$(document).ready(function() {
	$('#addCartForm').submit(function(event) {
			
		let member_num = this.getAttribute('data-member-num'); // JSP에서 전달된 세션 정보
        let st_num = $('input[name="st_num"]').val();
        let cart_quantity = $('input[name="cart_quantity"]').val();
        
        let confirmMessage = '로그인이 필요한 서비스입니다. 로그인 하시겠습니까?';
        let path = '/member/login';
        
        alert(member_num);
        
        if(member_num){ // 로그인 유무
        	confirmMessage = '상품이 장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?';
        	path = '/store/storeCart';
    	}
        
        //if(confirm(confirmMessage)) { // 컨펌메시지에 따라 이동
    		//window.location.href = contextPath + path;
		//} else {
			//event.preventDefault(); // 폼 제출 방지
    	//}
    	if (confirm(confirmMessage)) { // 사용자가 '예'를 클릭한 경우
            if (member_num == null) {
                window.location.href = contextPath + path;
            } else {
                // 폼 제출을 진행하도록 한다.
                return true; // 폼 제출 진행
            }
        } else { // '아니오' 클릭했을 시
            event.preventDefault(); // 폼 제출을 막고, 현재 페이지 유지
        }
        
        
    	
    	
		
        
    }); // addCartForm 종료
	
	
	
}); // document.ready 종료