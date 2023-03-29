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
			<form action="<c:url value='/classroom/update'/>" method="post">
			<div class="join_form_text">
	         <span>반 이름</span>
	        </div>
	        <input type="text" name="classroomName" value="${classroomName}" required>
	        
			<div class="join_form_text">
	         <span>담당 교사</span>
	        </div>
	        <c:choose>
				<c:when test="${empty classroomInfo.teacherName}">
					<input type="text" value="등록 된 교사가 없습니다." readonly>
				</c:when>
				<c:otherwise>
					<input type="text" value="${classroomInfo.teacherName}" readonly>			
				</c:otherwise>
			</c:choose>
	        
			<div class="join_form_text">
	         <span>원생 수</span>
	        </div>
	        <c:choose>
				<c:when test="${empty classroomInfo.count}">
					<input type="text" value="소속된 원생이 없습니다." readonly>
				</c:when>
				<c:otherwise>
					<input type="text" value="${classroomInfo.count}" readonly>			
				</c:otherwise>
			</c:choose>
			<input type="hidden" name="classroomId" value="${classroomSeq}">
	        <button class="web_btn_small">
	        	수정하기
			</button>
			</form>		
		</div>
	<%@include file="../footer.jsp" %>
</body>
</html>