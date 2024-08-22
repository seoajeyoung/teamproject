$(document).ready(function() {
	 var IMP = window.IMP;
     IMP.init("imp33746408");
    $('#backbtn').on('click', function() {
    
        $.ajax({
            url: '/myweb/DELETESEAT', 
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
            amount: 100, // 결제 금액 totalprice
        }, function (rsp) {
            if (rsp.success) {
                alert("결제 성공");
                savePaymentDetails(rsp);
            } else {
                alert("결제 실패: " + rsp.error_msg);
            }
        });
    }
    
    // api 결제후 db insert 하는 함수 
    function savePaymentDetails(rsp) {
        $.ajax({
            url: "/myweb/UPDATEPAYMENT",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({
            	tp_num: tp_num.split(','),
                
            }),
            success: function(response) {
            window.location.href = `/myweb/main`;
            },
            error: function() {
            }
        });
    }
    
    
    
    
    
    
    
    
    
});