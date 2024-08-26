$(document).ready(function() {
	 var IMP = window.IMP;
     IMP.init("imp33746408");
    $('#backbtn').on('click', function() {
    
        $.ajax({
            url: '/teamproject/DELETESEAT', 
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
            	tp_num: tp_num.split(','),
                movietitle: movietitle,
                th_name: th_name,
                th_number: th_number,
                th_region: th_region,
                sctime: sctime,
                fulldate: fulldate,
                seseat: seseat.split(',')
            }),
            success: function(response) {
                
            },
            error: function(error) {
            	window.history.back();
            }
        });
    });
    
    // 결제하기 눌렀을때 버튼 
    $('#paymentbtn').on('click', function() {
		requestPay();				
			        
    });
    
    // 결제 api 보여줄 내용 
    function requestPay() {
        IMP.request_pay({
            pg: 'html5_inicis',   
            pay_method: "card",  
            name: seseat,  // 상품명
            amount: totalprice, 
        }, function (rsp) {
            if (rsp.success) {
                alert("결제 성공");
                 var now = new Date();
                var paymentTime = formatDate(now);
                savePaymentDetails(rsp,paymentTime);
            } else {
                alert("결제 실패: " + rsp.error_msg);
            }
        });
    }
    
    // api 결제후 db insert 하는 함수 
    function savePaymentDetails(rsp,paymentTime) {
        $.ajax({
            url: "/teamproject/UPDATEPAYMENT",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({
            	tp_num: tp_num.split(','),
            	payment_time: paymentTime
                
            }),
            success: function(response) {
            },
            error: function() {
            }
        });
        alert("결제 완료 되었습니다");
        window.location.href = `/teamproject/main/main`;
    }
    
    
    // 시간 설정
       function formatDate(date) {
        var year = date.getFullYear();
        var month = ('0' + (date.getMonth() + 1)).slice(-2);
        var day = ('0' + date.getDate()).slice(-2);
        var hours = ('0' + date.getHours()).slice(-2);
        var minutes = ('0' + date.getMinutes()).slice(-2);

        return `${year}-${month}-${day} ${hours}:${minutes}:00`;  
    }
    
    
    
    
    
    
});