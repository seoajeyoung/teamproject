$(document).ready(function() {
    const seatData = [];
    let isOnetouchActive = false; // 버튼 클릭 상태를 관리하는 플래그

    // 관 등록 버튼 클릭 시 모달 열기
    $('.btn-open-modal').on('click', function() {
        $('.modal').css('display', 'flex');
        // 관 , 좌석  불러오는거      
         $.ajax({
                    url:'/myweb/CI_NUMBER',     // 임시 
                    method: 'GET',
                    success: function(response) {
                        const theaterSelect = $('#theater-select');
                        theaterSelect.empty(); // 기존 옵션 제거
                        theaterSelect.append('<option value="" selected>극장 불러오기</option>'); // 기본 옵션 추가
                        response.forEach(function(theater) {
                            theaterSelect.append('<option value="' + theater + '">' + theater + '</option>');
                        });
                    },
                });
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
        const rows = $('#rows').val();
        const cols = $('#cols').val();
        const seatTable = $('#seat-table');
        
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
            const row = [];
            $(this).find('td').each(function() {
                const seatInfo = {
                    text: $(this).text(),
                    class: $(this).attr('class')
                };
                row.push(seatInfo);
            });
            seatData.push(row);
        });
        $('.modal').css('display', 'none');
        $('#seat-table').empty(); 
        $('#btn-save').addClass('hidden');
        $('#onetouch').addClass('hidden'); 
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
