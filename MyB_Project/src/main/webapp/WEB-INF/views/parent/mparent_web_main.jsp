<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../p_header.jsp"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">>
    <title>mwebmain</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_notice_detail.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/mparent_web_main.css">    
</head>
<body>
    <div class="profile_box"> 
        <div class="profile_icon"><img id="porfile_img" src="${pageContext.request.contextPath}/resources/images/babytest.jpg"></div>
        <div class="child_name">   
            ${childName}
        </div>
        <div class="kindergarten_name">
            ${kindergartenName}
        </div>
        <div class="kindergarten_class">
             ${classroomName}
        </div>
    </div>

    <div class="parentmain_wrap">
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
				<a href='<c:url value="./mparent_notice_detail" />'>더보기</a>
			</div>
		</div>

        <div>
            <button type="button" id="request_list" onClick="location.href='./mparent_request'">요청사항 작성</button>
            <br>
            <button type="button" id="disease_control" onClick="location.href='./mparent_request_check'">요청사항 확인</button>
        </div>
    </div>
</body>

</html>