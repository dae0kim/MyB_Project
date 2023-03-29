<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../t_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mteachermain</title>    
        <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
    	<link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_notice_detail.css" rel="stylesheet">
    	 <link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_web_main.css" rel="stylesheet">

     
     
</head>
<body>
	<div class="profile_box">
		<div class="profile_icon">
			<img id="porfile_img"
				src="${pageContext.request.contextPath}/resources/image/teacher_woman_student.png">
		</div>
		<div class="teacher_name">${loginUser.teacherName}</div>
		<div class="classroom_name">${classroom.classroomName}</div>
		<div class="kindergarten_class">${kindergarten.kindergartenName}</div>
		
	</div>


	<div class="teachermain_wrap">
		<div>
			<div id="noticebox_title">공지사항</div>
			
		
			<div class="notice_box">
				<table class="notice_table">
					<tr>
						<th>날짜</th>						
						<th>내용</th>
					</tr>
						<c:forEach var="noticelist" items="${noticelist}">
					<tr>
						<td class="noticeDate"> <fmt:formatDate pattern="yyyy-MM-dd" value="${noticelist.noticeDate}"/></td>
						<td class="noticeContent">${noticelist.noticeContent}</td>
					</tr>
				</c:forEach>
				</table>
			</div>
			
			<div id="notice_list">
				<a href='<c:url value="./mteacher_notice_detail" />'>더보기</a>
			</div>
		</div>

		<div>

			<button id="request_list" type="button">
				<a href='<c:url value="./mteacher_requset_list/${loginUser.teacherId}" />'>요청사항 확인</a>
			</button>
				
				
			<button id="disease_list" type="button">
				<a href='<c:url value="./mteacher_disease/${loginUser.teacherId}" />'>원생 질병관리</a>
			</button>


		</div>
	</div>
</body>