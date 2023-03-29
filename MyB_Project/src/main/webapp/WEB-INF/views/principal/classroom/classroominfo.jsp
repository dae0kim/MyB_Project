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
				<th>반 이름</th>
				<th>담당 교사</th>
				<th>원생 수</th>
			</tr>
				<tr>
				<td>${classroomName}</td>
				<c:choose>
					<c:when test="${empty classroomInfo.teacherName}">
						<td>등록 된 교사가 없습니다.</td>
					</c:when>
					<c:otherwise>
						<td>${classroomInfo.teacherName}</td>			
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty classroomInfo.count}">
						<td>소속된 원생이 없습니다.</td>
					</c:when>
					<c:otherwise>
						<td>${classroomInfo.count}</td>			
					</c:otherwise>
				</c:choose>
				</tr>
			</table>
			<button class="web_btn_small" type="button" onclick="location.href='<c:url value='/classroom/update/${classroomSeq}'/>'">
			    수정하기
			</button>
			<button class="web_btn_small" type="button" onclick="location.href='<c:url value='/classroom/namelist/${loginUser.adminId}'/>'">
			    돌아가기
			</button>
		</div>
	<%@include file="../footer.jsp" %>
</body>
</html>