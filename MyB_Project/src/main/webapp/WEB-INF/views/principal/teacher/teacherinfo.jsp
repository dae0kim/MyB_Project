<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board"/>   
<!DOCTYPE html>
<html>
	<%@include file="../staticFiles.jsp" %>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
	<%@include file="../header.jsp" %>
		<div id="jb-content">
			<table border="1">
				<tr>
					<th>이름</th>
					<th>이메일</th>
					<th>비밀번호</th>
					<th>전화번호</th>
					<th>담당교실</th>
				</tr>
				<tr>
					<td>${teacherInfo.teacherName}</td>
					<td>${teacherInfo.teacherEmail}</td>
					<td>${teacherInfo.teacherPw}</td>
					<td>${teacherInfo.teacherPhone}</td>
					<td>${teacherInfo.classroomName}</td>			
				</tr>
			</table>
			<button class="web_btn_small" type="button" onclick="location.href='<c:url value='/teacher/update/${teacherInfo.teacherId}'/>'">
			    수정하기
			</button>
			<button class="web_btn_small" type="button" onclick="location.href='<c:url value='/teacher/delete/${teacherInfo.teacherId}'/>'">
			    삭제하기
			</button>
			<button class="web_btn_small" type="button" onclick="location.href='<c:url value='/teacher/list/${loginUser.adminId}'/>'">
			    돌아가기
			</button>
		</div>
	<%@include file="../footer.jsp" %>
</body>
</html>