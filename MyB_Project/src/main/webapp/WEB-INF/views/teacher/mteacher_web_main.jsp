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
		<div class="child_name">${loginUser.teacherName}</div>
		<div class="kindergarten_name">${loginUser.kindergartenId}</div>
		<div class="kindergarten_class">${loginUser.classroomId}</div>
	</div>


	<div class="teachermain_wrap">
		<div>
			<div id="noticebox_title">공지사항</div>
			
			<div class="notice_box">
				<table>
					<thead>
						<tr>
							<td scope="col">제목</td>
							<td scope="col">날짜</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row">제목입니다</td>
							<td scope="row">230317</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div id="notice_list">
				<a href='<c:url value="./notice_detail" />'>더보기</a>
			</div>
		</div>

		<div>

			<button id="request_list" type="button">
				<a href='<c:url value="./mteacher_requset_list" />'>요청사항 확인</a>
			</button>
				
				
				<a href="./mteacher_disease">원생 질병관리</a>
			<button id="disease_control" type="button">
				
			</button>


		</div>
	</div>
</body>