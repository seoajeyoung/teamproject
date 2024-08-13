<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ticket/real.css">
<script
	src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/script/ticketpayment.js"></script>	
	
	
</head>
<body>
	<article id="seat_select">
		<div id="header_box">
			 <table class="header_box">
        <tbody>
            <tr>
                <td colspan="6" id="titleArea" style="height: 45px;"><h3>인원/좌석</h3></td>
            </tr>
            <tr></tr>
            <tr id="height50">
                <th colspan="2" id="peoSelTableTh">
                    <table class="peoSelTable">
                        <tbody id="peoSelTableBody">
                        </tbody>
                    </table>
                </th>
                <td id="DiscountInformation">
                    <div>*최대 8명 선택 가능</div>
                    <div id="popup">
                        <input type="button" id="DiscountInfo" value="관람할인안내">
                    </div>
                </td>
                <th colspan="3" class="header_box_Runtime">
                    ${param.movieTitle}  ${param.th_number} 
                    남은좌석  ${param.now_count} / ${param.se_count}<br>
                    <b>${param.fullDate} ${param.starttime}  ~ ${param.endtime}</b>
                </th>
            </tr>
        </tbody>
    </table>
		</div>




		<div id="seat_num" class="">


			<h1 id="screenArea">Screen</h1>

			<div class="center">


				<div class="seat 1" onclick="toggleSeat(this)" value="A1">A1</div>


				<div class="seat 2" onclick="toggleSeat(this)" value="A2">A2</div>


				<div class="seat 3" onclick="toggleSeat(this)" value="A3">A3</div>


				<div class="seat 4 selected" onclick="toggleSeat(this)" value="A4">A4</div>


				<div class="seat 5" onclick="toggleSeat(this)" value="A5">A5</div>


				<div class="seat 6" onclick="toggleSeat(this)" value="A6">A6</div>


				<div class="seat 7" onclick="toggleSeat(this)" value="A7">A7</div>


				<div class="seat 8" onclick="toggleSeat(this)" value="A8">A8</div>


				<div class="seat 9" onclick="toggleSeat(this)" value="A9">A9</div>


				<div class="seat 10" onclick="toggleSeat(this)" value="A10">A10</div>


				<div class="seat 11" onclick="toggleSeat(this)" value="A11">A11</div>


				<div class="seat 12" onclick="toggleSeat(this)" value="A12">A12</div>


				<div class="seat 13" onclick="toggleSeat(this)" value="A13">A13</div>


				<div class="seat 14" onclick="toggleSeat(this)" value="A14">A14</div>


				<div class="seat 15" onclick="toggleSeat(this)" value="A15">A15</div>


				<div class="seat 16" onclick="toggleSeat(this)" value="A16">A16</div>

			</div>

			<div class="center">


				<div class="seat 1" onclick="toggleSeat(this)" value="B1">B1</div>


				<div class="seat 2" onclick="toggleSeat(this)" value="B2">B2</div>


				<div class="seat 3" onclick="toggleSeat(this)" value="B3">B3</div>


				<div class="seat 4" onclick="toggleSeat(this)" value="B4">B4</div>


				<div class="seat 5" onclick="toggleSeat(this)" value="B5">B5</div>


				<div class="seat 6" onclick="toggleSeat(this)" value="B6">B6</div>


				<div class="seat 7" onclick="toggleSeat(this)" value="B7">B7</div>


				<div class="seat 8" onclick="toggleSeat(this)" value="B8">B8</div>


				<div class="seat 9" onclick="toggleSeat(this)" value="B9">B9</div>


				<div class="seat 10" onclick="toggleSeat(this)" value="B10">B10</div>


				<div class="seat 11" onclick="toggleSeat(this)" value="B11">B11</div>


				<div class="seat 12" onclick="toggleSeat(this)" value="B12">B12</div>


				<div class="seat 13" onclick="toggleSeat(this)" value="B13">B13</div>


				<div class="seat 14" onclick="toggleSeat(this)" value="B14">B14</div>


				<div class="seat 15" onclick="toggleSeat(this)" value="B15">B15</div>


				<div class="seat 16" onclick="toggleSeat(this)" value="B16">B16</div>

			</div>

			<div class="center">


				<div class="seat 1" onclick="toggleSeat(this)" value="C1">C1</div>


				<div class="seat 2" onclick="toggleSeat(this)" value="C2">C2</div>


				<div class="seat 3" onclick="toggleSeat(this)" value="C3">C3</div>


				<div class="seat 4 selected" onclick="toggleSeat(this)" value="C4">C4</div>


				<div class="seat 5" onclick="toggleSeat(this)" value="C5">C5</div>


				<div class="seat 6" onclick="toggleSeat(this)" value="C6">C6</div>


				<div class="seat 7" onclick="toggleSeat(this)" value="C7">C7</div>


				<div class="seat 8" onclick="toggleSeat(this)" value="C8">C8</div>


				<div class="seat 9" onclick="toggleSeat(this)" value="C9">C9</div>


				<div class="seat 10" onclick="toggleSeat(this)" value="C10">C10</div>


				<div class="seat 11" onclick="toggleSeat(this)" value="C11">C11</div>


				<div class="seat 12" onclick="toggleSeat(this)" value="C12">C12</div>


				<div class="seat 13" onclick="toggleSeat(this)" value="C13">C13</div>


				<div class="seat 14" onclick="toggleSeat(this)" value="C14">C14</div>


				<div class="seat 15" onclick="toggleSeat(this)" value="C15">C15</div>


				<div class="seat 16" onclick="toggleSeat(this)" value="C16">C16</div>

			</div>

			<div class="center">


				<div class="seat 1" onclick="toggleSeat(this)" value="D1">D1</div>


				<div class="seat 2" onclick="toggleSeat(this)" value="D2">D2</div>


				<div class="seat 3" onclick="toggleSeat(this)" value="D3">D3</div>


				<div class="seat 4" onclick="toggleSeat(this)" value="D4">D4</div>


				<div class="seat 5" onclick="toggleSeat(this)" value="D5">D5</div>


				<div class="seat 6" onclick="toggleSeat(this)" value="D6">D6</div>


				<div class="seat 7" onclick="toggleSeat(this)" value="D7">D7</div>


				<div class="seat 8" onclick="toggleSeat(this)" value="D8">D8</div>


				<div class="seat 9" onclick="toggleSeat(this)" value="D9">D9</div>


				<div class="seat 10" onclick="toggleSeat(this)" value="D10">D10</div>


				<div class="seat 11" onclick="toggleSeat(this)" value="D11">D11</div>


				<div class="seat 12" onclick="toggleSeat(this)" value="D12">D12</div>


				<div class="seat 13" onclick="toggleSeat(this)" value="D13">D13</div>


				<div class="seat 14" onclick="toggleSeat(this)" value="D14">D14</div>


				<div class="seat 15" onclick="toggleSeat(this)" value="D15">D15</div>


				<div class="seat 16" onclick="toggleSeat(this)" value="D16">D16</div>

			</div>

			<div class="center">


				<div class="seat 1" onclick="toggleSeat(this)" value="E1">E1</div>


				<div class="seat 2" onclick="toggleSeat(this)" value="E2">E2</div>


				<div class="seat 3" onclick="toggleSeat(this)" value="E3">E3</div>


				<div class="seat 4" onclick="toggleSeat(this)" value="E4">E4</div>


				<div class="seat 5" onclick="toggleSeat(this)" value="E5">E5</div>


				<div class="seat 6" onclick="toggleSeat(this)" value="E6">E6</div>


				<div class="seat 7" onclick="toggleSeat(this)" value="E7">E7</div>


				<div class="seat 8" onclick="toggleSeat(this)" value="E8">E8</div>


				<div class="seat 9" onclick="toggleSeat(this)" value="E9">E9</div>


				<div class="seat 10" onclick="toggleSeat(this)" value="E10">E10</div>


				<div class="seat 11" onclick="toggleSeat(this)" value="E11">E11</div>


				<div class="seat 12" onclick="toggleSeat(this)" value="E12">E12</div>


				<div class="seat 13" onclick="toggleSeat(this)" value="E13">E13</div>


				<div class="seat 14" onclick="toggleSeat(this)" value="E14">E14</div>


				<div class="seat 15" onclick="toggleSeat(this)" value="E15">E15</div>


				<div class="seat 16" onclick="toggleSeat(this)" value="E16">E16</div>

			</div>

			<div class="center">


				<div class="seat 1" onclick="toggleSeat(this)" value="F1">F1</div>


				<div class="seat 2" onclick="toggleSeat(this)" value="F2">F2</div>


				<div class="seat 3" onclick="toggleSeat(this)" value="F3">F3</div>


				<div class="seat 4 selected" onclick="toggleSeat(this)" value="F4">F4</div>


				<div class="seat 5" onclick="toggleSeat(this)" value="F5">F5</div>


				<div class="seat 6" onclick="toggleSeat(this)" value="F6">F6</div>


				<div class="seat 7" onclick="toggleSeat(this)" value="F7">F7</div>


				<div class="seat 8" onclick="toggleSeat(this)" value="F8">F8</div>


				<div class="seat 9" onclick="toggleSeat(this)" value="F9">F9</div>


				<div class="seat 10" onclick="toggleSeat(this)" value="F10">F10</div>


				<div class="seat 11" onclick="toggleSeat(this)" value="F11">F11</div>


				<div class="seat 12" onclick="toggleSeat(this)" value="F12">F12</div>


				<div class="seat 13" onclick="toggleSeat(this)" value="F13">F13</div>


				<div class="seat 14" onclick="toggleSeat(this)" value="F14">F14</div>


				<div class="seat 15" onclick="toggleSeat(this)" value="F15">F15</div>


				<div class="seat 16" onclick="toggleSeat(this)" value="F16">F16</div>

			</div>

			<div class="center">


				<div class="seat 1" onclick="toggleSeat(this)" value="G1">G1</div>


				<div class="seat 2" onclick="toggleSeat(this)" value="G2">G2</div>


				<div class="seat 3" onclick="toggleSeat(this)" value="G3">G3</div>


				<div class="seat 4" onclick="toggleSeat(this)" value="G4">G4</div>


				<div class="seat 5" onclick="toggleSeat(this)" value="G5">G5</div>


				<div class="seat 6" onclick="toggleSeat(this)" value="G6">G6</div>


				<div class="seat 7" onclick="toggleSeat(this)" value="G7">G7</div>


				<div class="seat 8" onclick="toggleSeat(this)" value="G8">G8</div>


				<div class="seat 9" onclick="toggleSeat(this)" value="G9">G9</div>


				<div class="seat 10" onclick="toggleSeat(this)" value="G10">G10</div>


				<div class="seat 11" onclick="toggleSeat(this)" value="G11">G11</div>


				<div class="seat 12" onclick="toggleSeat(this)" value="G12">G12</div>


				<div class="seat 13" onclick="toggleSeat(this)" value="G13">G13</div>


				<div class="seat 14" onclick="toggleSeat(this)" value="G14">G14</div>


				<div class="seat 15" onclick="toggleSeat(this)" value="G15">G15</div>


				<div class="seat 16" onclick="toggleSeat(this)" value="G16">G16</div>

			</div>

			<div class="center">


				<div class="seat 1" onclick="toggleSeat(this)" value="H1">H1</div>


				<div class="seat 2" onclick="toggleSeat(this)" value="H2">H2</div>


				<div class="seat 3" onclick="toggleSeat(this)" value="H3">H3</div>


				<div class="seat 4" onclick="toggleSeat(this)" value="H4">H4</div>


				<div class="seat 5" onclick="toggleSeat(this)" value="H5">H5</div>


				<div class="seat 6" onclick="toggleSeat(this)" value="H6">H6</div>


				<div class="seat 7" onclick="toggleSeat(this)" value="H7">H7</div>


				<div class="seat 8" onclick="toggleSeat(this)" value="H8">H8</div>


				<div class="seat 9" onclick="toggleSeat(this)" value="H9">H9</div>


				<div class="seat 10" onclick="toggleSeat(this)" value="H10">H10</div>


				<div class="seat 11" onclick="toggleSeat(this)" value="H11">H11</div>


				<div class="seat 12" onclick="toggleSeat(this)" value="H12">H12</div>


				<div class="seat 13" onclick="toggleSeat(this)" value="H13">H13</div>


				<div class="seat 14" onclick="toggleSeat(this)" value="H14">H14</div>


				<div class="seat 15" onclick="toggleSeat(this)" value="H15">H15</div>


				<div class="seat 16" onclick="toggleSeat(this)" value="H16">H16</div>

			</div>

			<div class="center">


				<div class="seat 1" onclick="toggleSeat(this)" value="I1">I1</div>


				<div class="seat 2" onclick="toggleSeat(this)" value="I2">I2</div>


				<div class="seat 3" onclick="toggleSeat(this)" value="I3">I3</div>


				<div class="seat 4" onclick="toggleSeat(this)" value="I4">I4</div>


				<div class="seat 5" onclick="toggleSeat(this)" value="I5">I5</div>


				<div class="seat 6" onclick="toggleSeat(this)" value="I6">I6</div>


				<div class="seat 7" onclick="toggleSeat(this)" value="I7">I7</div>


				<div class="seat 8" onclick="toggleSeat(this)" value="I8">I8</div>


				<div class="seat 9" onclick="toggleSeat(this)" value="I9">I9</div>


				<div class="seat 10" onclick="toggleSeat(this)" value="I10">I10</div>


				<div class="seat 11" onclick="toggleSeat(this)" value="I11">I11</div>


				<div class="seat 12" onclick="toggleSeat(this)" value="I12">I12</div>


				<div class="seat 13" onclick="toggleSeat(this)" value="I13">I13</div>


				<div class="seat 14" onclick="toggleSeat(this)" value="I14">I14</div>


				<div class="seat 15" onclick="toggleSeat(this)" value="I15">I15</div>


				<div class="seat 16" onclick="toggleSeat(this)" value="I16">I16</div>

			</div>

			<div class="center">


				<div class="seat 1" onclick="toggleSeat(this)" value="J1">J1</div>


				<div class="seat 2" onclick="toggleSeat(this)" value="J2">J2</div>


				<div class="seat 3" onclick="toggleSeat(this)" value="J3">J3</div>


				<div class="seat 4" onclick="toggleSeat(this)" value="J4">J4</div>


				<div class="seat 5" onclick="toggleSeat(this)" value="J5">J5</div>


				<div class="seat 6" onclick="toggleSeat(this)" value="J6">J6</div>


				<div class="seat 7" onclick="toggleSeat(this)" value="J7">J7</div>


				<div class="seat 8" onclick="toggleSeat(this)" value="J8">J8</div>


				<div class="seat 9" onclick="toggleSeat(this)" value="J9">J9</div>


				<div class="seat 10" onclick="toggleSeat(this)" value="J10">J10</div>


				<div class="seat 11" onclick="toggleSeat(this)" value="J11">J11</div>


				<div class="seat 12" onclick="toggleSeat(this)" value="J12">J12</div>


				<div class="seat 13" onclick="toggleSeat(this)" value="J13">J13</div>


				<div class="seat 14" onclick="toggleSeat(this)" value="J14">J14</div>


				<div class="seat 15" onclick="toggleSeat(this)" value="J15">J15</div>


				<div class="seat 16" onclick="toggleSeat(this)" value="J16">J16</div>

			</div>

			<div class="center">


				<div class="seat 1" onclick="toggleSeat(this)" value="K1">K1</div>


				<div class="seat 2" onclick="toggleSeat(this)" value="K2">K2</div>


				<div class="seat 3" onclick="toggleSeat(this)" value="K3">K3</div>


				<div class="seat 4" onclick="toggleSeat(this)" value="K4">K4</div>


				<div class="seat 5" onclick="toggleSeat(this)" value="K5">K5</div>


				<div class="seat 6" onclick="toggleSeat(this)" value="K6">K6</div>


				<div class="seat 7" onclick="toggleSeat(this)" value="K7">K7</div>


				<div class="seat 8" onclick="toggleSeat(this)" value="K8">K8</div>


				<div class="seat 9" onclick="toggleSeat(this)" value="K9">K9</div>


				<div class="seat 10" onclick="toggleSeat(this)" value="K10">K10</div>


				<div class="seat 11" onclick="toggleSeat(this)" value="K11">K11</div>


				<div class="seat 12" onclick="toggleSeat(this)" value="K12">K12</div>


				<div class="seat 13" onclick="toggleSeat(this)" value="K13">K13</div>


				<div class="seat 14" onclick="toggleSeat(this)" value="K14">K14</div>


				<div class="seat 15" onclick="toggleSeat(this)" value="K15">K15</div>


				<div class="seat 16" onclick="toggleSeat(this)" value="K16">K16</div>

			</div>

			<table id="seatCondition">
				<tbody>
					<tr>
						<td><img src="/iTicket/resources/img/seatCondition.png"
							width="90px" height="160px"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</article>
</body>
</html>