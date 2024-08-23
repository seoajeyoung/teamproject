$(document).ready(function() {
    // 설정할 인원 수
    var person = 8; // 이 값을 변경하여 인원 수 조정 가능
    var selectedPerCategory = {};
    var selectsenum = [];
    var totalSelected ='';
    var categoryname = '';
    var count = '';
    var totalPrice = 0;
    var selectedSeats = '';
    var payment = [];

    // 유형별로 초기화된 배열
    var types = ['일반', '청소년', '경로', '우대'];

    // peoSelTableBody 요소를 가져옴
    var tbody = $('#peoSelTableBody');

    // 각 유형에 대해 행을 추가
    $.each(types, function(index, type) {
        var tr = $('<tr></tr>'); // 새로운 행 생성

        // 유형 이름을 포함하는 첫 번째 셀
        var tdType = $('<td></td>').text(type);
        tr.append(tdType);

        // 인원 수에 따라 동적으로 td 요소 생성
        for (var i = 0; i <= person; i++) {
            var td = $('<td></td>');
            var div = $('<div></div>')
                .addClass('NumOfPeo' + (i === 0 ? ' SelectPeople' : '')) // 첫 번째 div에만 SelectPeople 클래스 추가
                .attr('value', type + i)
                .text(i);
            td.append(div);
            tr.append(td);
        }

        // 행을 tbody에 추가
        tbody.append(tr);
    });
    
    $('#DiscountInformation div').first().text(`*최대 ${person}명 선택 가능`);
    
     $('#peoSelTableBody .NumOfPeo.SelectPeople').addClass('selected');  // 인원선택 기본 초기값
    
    
    // 첫 좌석 가져오는 함수 
  function loadSeats() {
    $.ajax({
        url: '/myweb/LOADSEAT', 
        method: 'GET',
        dataType: 'json',
        data: {
            region: selectRegionName,
            th_name: theaterTitle,
            th_number: thNumber,
            fulldate: fullDate,
            sctime: sc_time,
            movietitle: title
        },
        success: function(data) {
            $('#seat_num').empty(); // 기존 좌석 삭제
	
            var currentRow = '';
            var rowDiv = null;
			$('#seat_num').before('<h1 id="screenArea">Screen</h1>');
			 
            data.savedSeats.forEach(function(seat) {
                var seatRow = seat.SE_SEAT.charAt(0); 
                
                if (currentRow !== seatRow) {
                    currentRow = seatRow;
                    rowDiv = $('<div></div>').addClass('seat-row');
                    $('#seat_num').append(rowDiv);
                }

                var seatDiv = $('<div></div>')
                    .attr('id', 'seat') 
                    .attr('value', seat.SE_SEAT) 
                    .text(seat.SE_SEAT) 
                    .addClass(seat.SE_TYPE);

                // 결제된 좌석과 비교하여 일치하면 'full' 클래스 추가
                data.paymentSeats.forEach(function(paidSeat) {
                    if (seat.SE_SEAT === paidSeat.SP_SEAT) {
                         seatDiv.removeClass('empty').addClass('full');
                    }
                });

                rowDiv.append(seatDiv); // 해당 행의 div에 좌석 추가
            });
        },
    });
}

loadSeats();

	// 인원 선택시 클릭 이벤트처리     
      $('#peoSelTableBody').on('click', '.NumOfPeo', function() {
    var $clickedDiv = $(this);
    var $parentRow = $clickedDiv.closest('tr');
    var category = $parentRow.find('td:first').text(); // 카테고리 이름
    var currentValue = parseInt($clickedDiv.text(), 10);

    // 선택된 카테고리의 기존 값을 가져옵니다.
	
    if ($clickedDiv.hasClass('selected')) {
        // 이미 선택된 항목을 클릭하면 선택 해제
        $clickedDiv.removeClass('selected');
        selectedPerCategory[category] = 0; // 선택 해제 시 0으로 설정

    } else {
        // 현재 선택된 값을 추가
        selectedPerCategory[category] = currentValue;

        // 총 선택 인원 수를 확인합니다.
        var totalSelected = Object.values(selectedPerCategory).reduce((a, b) => a + b, 0);
        if (totalSelected > person) {
            alert('총 인원 수를 초과했습니다!');
            selectedPerCategory[category] = previousValue; // 이전 값으로 복원
            return;
        }
        
         var previousValue = selectedPerCategory[category] || 0;
	 if (selectedSeats > totalSelected) {
        alert('선택한 좌석 수가 예매 인원 수를 초과했습니다!');
        return;
    }
	
        // 현재 선택된 항목 외의 선택을 해제
        $parentRow.find('.NumOfPeo').removeClass('selected');
        $clickedDiv.addClass('selected');
    }
});
	// 좌석  선택 클릭 이벤트     
        $('#seat_num').on('click', '#seat.empty, #seat.choose', function() {
    var seattext = $(this).text(); // 클릭한 좌석의 텍스트
     totalSelected = Object.values(selectedPerCategory).reduce((a, b) => a + b, 0);

    // 인원 선택이 안된 경우
    if (totalSelected === 0) {
        alert('인원 선택을 먼저 해주세요.');
        return;
    }

     selectedSeats = $('#seat_num .choose').length;
     if ($(this).hasClass('choose')) {
        // 이미 선택된 좌석인 경우
        $(this).removeClass('choose').addClass('empty'); 
        var index = selectsenum.indexOf(seattext);
        if (index !== -1) {
            selectsenum.splice(index, 1); // 배열에서 해당 좌석 제거
        }
    } else {
        // 선택된 좌석이 아닌 경우
        if (selectedSeats < totalSelected) {
            $(this).removeClass('empty').addClass('choose'); 
            selectsenum.push(seattext); 
        } else {
            alert('선택 가능한 좌석 수를 초과했습니다.');
        }
    }
    
    $('#seatnum').text(selectsenum.join(', ')); 
});
    
    // 결제하기 버튼 클릭 이벤트함수
     $('#tnb_step_btn_right').on('click', function(event) {
        event.preventDefault(); 


        if ( selectsenum.length < totalSelected) {
            alert(`선택한 인원(${totalSelected}명)만큼 좌석을 선택해주세요.`);
            return;
        }
		
		if(totalSelected == 0 ){
			alert(`좌석을 선택하셔야 합니다.`);
			return;
		}
		
		
		
		
		var categoryPrices = {
        '일반': 10000,
        '청소년': 7000,
        '경로': 5000,
        '우대': 3000
    };

    var summary = [];
	payment = [];
    for (var category in selectedPerCategory) {
        if (selectedPerCategory.hasOwnProperty(category)) {
            count = selectedPerCategory[category];
            var price = categoryPrices[category] || 0;
            var categoryTotal = price * count;
            totalPrice += categoryTotal;
            categoryname = category;
            
             for (var i = 0; i < count; i++) {
             
             	payment.push([category, price]);
             }
            
            summary.push(`${category} ${price} * ${count} = ${categoryTotal}`);
        }
    }
    // Confirm 대화상자 표시
    var confirmMessage = `선택된 좌석:\n${selectsenum.join(', ')}\n\n`;
    confirmMessage += `인원 및 가격:\n${summary.join('\n')}\n\n`;
    confirmMessage += `총합: ${totalPrice} 원\n\n결제하시겠습니까?`;	
    debugger;
        if (confirm(confirmMessage)) {
        // 사용자가 '확인'을 클릭한 경우, AJAX 요청을 보냅니다.
        $.ajax({
            url: '/myweb/SEATPAYMENT', 
            method: 'POST', 
            contentType: 'application/json', 
            data: JSON.stringify({
                th_region: selectRegionName,
                th_name: theaterTitle,
                th_number: thNumber,
                movietitle: title,
                fulldate: fullDate,
                sctime: sc_time,
                seseat: selectsenum, 
                payment: payment
            }),
            success: function(response) {
               if (response.status === "success") {
            		  var tpNumList = response.tpNumList;
               		const queryParams = new URLSearchParams({
                    th_region: selectRegionName,
                    th_name: theaterTitle,
                    th_number: thNumber,
                    movietitle: title,
                    fulldate: fullDate,
                    sctime: sc_time,
                    categoryname: categoryname,
                    count: count,
                    totalprice: totalPrice,
                    seseat: selectsenum.join(','),
                    tp_num: tpNumList.join(',')
                }).toString();
                
                window.location.href = `/myweb/ticketpayment?${queryParams}`;
            	} else {
               	 alert(response.message);
           		 }
            },
        });
    } else {
    	totalPrice = 0;
        return;
    }
    });
    
    
    
    		
    		
    
    
    
    
 });  // ready 끝    
    