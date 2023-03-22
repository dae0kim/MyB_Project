<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../t_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_disease.css" rel="stylesheet">
</head>
<body>
		<div class="noticedetailtitle_wrap">
        <div id="noticedetail_title" style="font-weight : 700;">요청사항 리스트</div>
        </div>



	<div class="request_list_wrap">
		<div id="request_box">
			
			애 이름
			
			<div class="form_radio_btn radio_male">
				<input id="radio-1" type="radio" name="absent" value="결석">
				<label for="radio-1">결석</label>
			</div>

			<div class="form_radio_btn">
				<input id="radio-2" type="radio" name="leave_early" value="조퇴">
				<label for="radio-2">조퇴</label>
			</div>

			<select id="disease_select" name="disease">
				<option value="">선택하세요</option>
					<option value="strawberry">딸기</option>
					<option value="banana">바나나</option>
					<option value="mango">망고</option>
					<option value="melon">멜론</option>
					<option value="grape">포도</option>
					<option value="watermelon">수박</option>
			</select>
		</div>

	</div>


</body>
</html>