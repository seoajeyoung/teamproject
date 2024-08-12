$(document).ready(function() {
    const seatData = [];
    var regionvalue = '';
    var th_namevalue = '';
    var ci_number = '';
    var rows = '';
    var cols = '';
    let isOnetouchActive = false; // 버튼 클릭 상태를 관리하는 플래그

     // 지역 선택시 극장이름 가져오는 ajax 
     $('#region').change(function() {
    	 regionvalue = $(this).val();
    	 if(regionvalue){
    	 $.ajax({
    		url: '/myweb/MODALTH_NAME',
   			type: 'GET',
    		dataType: 'json', 
    		data: {
        		region: regionvalue
    		},
    		success: function(theaters) {
 		       $('#th_name').empty();
 		       $('#th_name').append('<option value="" disabled selected>극장 이름 선택해주세요</option>');
        	theaters.forEach(function(theater) {
        		 
       		     $('#th_name').append('<option value="' + theater.TH_NAME + '">' + theater.TH_NAME + '</option>');
        	});
    		},
		});
    }
   });
    
    // 극장이름 클릭시 값 저장 함수 
     $('#th_name').change(function() {
     	th_namevalue = $(this).val();
     	getci_number();
     });
     
    
    // 관 등록 버튼 클릭 시 모달 열기
    $('.btn-open-modal').on('click', function() {
         $('.modal').css('display', 'flex');
    });
    
	// 관 불러오는 함수    
    function getci_number() {
    $.ajax({
        url: '/myweb/CI_NUMBER', // 임시 
        type: 'GET',
        dataType: 'json',
        data: {
            region: regionvalue,
            th_name: th_namevalue
        },
        success: function(response) {
            $('.theater-select').empty(); // 기존 옵션 제거
            $('.theater-select').append('<option value="" selected>극장 불러오기</option>'); // 기본 옵션 추가
            response.forEach(function(theater) {
                $('.theater-select').append('<option value="' + theater.CI_NUMBER + '">' + theater.CI_NUMBER + '</option>');
            });
        }
    });
	}
	
	// 관 클릭시 값 저장 함수     
      $('#theater-insert').on('change', function() {
            ci_number = $(this).val();
            $('#namecinema').text(th_namevalue  + "극장 " + ci_number);
        });    
    

    // 생성 버튼 클릭 시 좌석 생성
    $('#btn-create-seats').on('click', function() {
        createSeats();
        $('#btn-save').removeClass('hidden'); 
        $('#onetouch').removeClass('hidden'); 
    });

    // 모달 닫기 버튼 클릭 시 모달 닫기
    $('.close').on('click', function() {
        $('.modal').css('display', 'none');
        $('#seat-table').empty(); 
        $('#btn-save').addClass('hidden');
        $('#onetouch').addClass('hidden');
        $('#onetouch').text('마우스 올리면 삭제');
        isOnetouchActive = false; 
    });

    // 가로 세로 크기 조정 버튼 클릭 시 값 변경
    $('#decrease-rows').on('click', function() {
        changeValue('rows', -1);
    });
    $('#increase-rows').on('click', function() {
        changeValue('rows', 1);
    });
    $('#decrease-cols').on('click', function() {
        changeValue('cols', -1);
    });
    $('#increase-cols').on('click', function() {
        changeValue('cols', 1);
    });

    function changeValue(id, delta) {
        const input = $('#' + id);
        let value = parseInt(input.val());
        value += delta;
        if (value < 1) value = 1;
        input.val(value);
    }

    function createSeats() {
         rows = $('#rows').val();
         cols = $('#cols').val();
         seatTable = $('#seat-table');
         seatTable.empty(); // 좌석 테이블 초기화

        // 테이블 생성
        const table = $('<table></table>');
        const thead = $('<thead></thead>');
        const tbody = $('<tbody></tbody>');

        // 좌석 및 행 추가
        for (let i = 0; i < rows; i++) {
            const tr = $('<tr></tr>');
            tr.append('<th>' + String.fromCharCode(65 + i) + '</th>'); 
            for (let j = 1; j <= cols; j++) {
                const seatLabel = String.fromCharCode(65 + i) + j; 
                const td = $('<td></td>')
                    .addClass('empty')
                    .text(seatLabel) // 셀에 좌석 레이블 표시
                    .on('click', function() {
                        if ($(this).hasClass('empty')) {
                            $(this).removeClass('empty').addClass('removed');
                        } else if ($(this).hasClass('removed')) {
                            $(this).removeClass('removed').addClass('empty');
                        }
                    });
                tr.append(td);
            }
            tbody.append(tr);
        }
        table.append(tbody);
        seatTable.append(table);
    }

    // 저장 버튼 클릭 시, tbody 안의 모든 td 요소의 텍스트 값과 클래스 이름을 가져옴
    $('#btn-save').on('click', function() {
        $('#seat-table tbody tr').each(function() {
            var row = [];
             $(this).find('td').each(function() {
            if ($(this).hasClass('removed')) {
               	var seatInfo = {
                    text: $(this).text(),
                };
                 row.push(seatInfo);
       			 }
        });
            if (row.length > 0) {
            seatData.push(row);
       		 }
        });
         $.ajax({
        url: '/myweb/INSERTSEAT', 
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
        	region: regionvalue,
        	th_name: th_namevalue,
        	ci_number: ci_number,
        	rows: rows,
        	cols: cols,
        	seat_data: seatData 
   		    }),
            
            success: function(response) {
        		alert("성공");
        		},
    		});
        
        $('.modal').css('display', 'none');
        $('#seat-table').empty(); 
        $('#btn-save').addClass('hidden');
        $('#onetouch').addClass('hidden');
        $('#onetouch').text('마우스 올리면 삭제'); 
 		isOnetouchActive = false;       
    });
   
    // 한번에 처리 버튼 
    $('#onetouch').on('click', function() {
        if (isOnetouchActive) {
            // onetouch 비활성화 상태로 변경
            $(this).text('마우스 올리면 삭제'); // 텍스트 초기화
            isOnetouchActive = false; // onetouch 모드 비활성화
        } else {
            // onetouch 활성화 상태로 변경
            $(this).text('사용중(Enter 누를시 종료)'); // 텍스트 변경
            isOnetouchActive = true; // onetouch 모드 활성화
        }
    });

    // Enter 키로 onetouch 모드 종료
    $(document).on('keydown', function(e) {
        if (e.key === 'Enter' && isOnetouchActive) { // Enter 키 확인 및 onetouch 모드 활성화 여부 확인
            $('#onetouch').text('마우스 올리면 삭제'); // 텍스트 초기화
            isOnetouchActive = false; // onetouch 모드 비활성화
        }
    });

    // 테이블 셀에 마우스를 올리면 클릭처럼 처리 (onetouch 모드일 때만 적용)
    $('#seat-table').on('mouseover', 'td', function() {
     $('#onetouch').blur(); 
        if (isOnetouchActive) {
            if ($(this).hasClass('empty')) {
                $(this).removeClass('empty').addClass('removed');
            } else if ($(this).hasClass('removed')) {
                $(this).removeClass('removed').addClass('empty');
            }
        }
    });
});
