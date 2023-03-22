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
    <link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_requset_list.css" rel="stylesheet">
</head>
<body>
		<div class="noticedetailtitle_wrap">
        <div id="noticedetail_title" style="font-weight : 700;">요청사항 리스트</div>
        </div>



	<div class="request_list_wrap">
		<div id="request_box">
		<from> 
			애 이름
			
						<label class="test_obj">
						    <input type="radio" name="근태" value="조퇴">
						    <span>조퇴</span>
						</label>
						 
							<label class="test_obj">
						    <input type="radio" name="근태" value="결석">
						    <span>결석</span>
						</label>
						
						
						
			<select id="disease_select" name="disease">
				<option value="">--질병선택--</option>
					<option value="감기">감기</option>
					<option value="독감">독감</option>
					<option value="폐렴">폐렴</option>
					<option value="중이염">중이염</option>
					<option value="수족구">수족구</option>
					<option value="이하선염">이하선염(볼거리)</option>
					<option value="결막염">결막염(눈병)</option>
					<option value="수두">수두</option>
					<option value="장염">장염</option>
					<option value="성홍열">성홍열</option>	
			</select>
			
			</from>

		</div>

	</div>


</body>
</html>