<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<%@include file="../staticFiles.jsp" %>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<%@include file="../header.jsp" %>
	<form action="<c:url value='/teacher/update'/>" method="post">
		<div class="join_form_text">
         <span>이름</span>
        </div>
        <input type="text" name="teacherName" value="${teacherInfo.teacherName}" placeholder=" 이름" required>

		<div class="join_form_text">
         <span>교사 계정 아이디</span>
        </div>
        <input type="text" name="teacherEmail" value="${teacherInfo.teacherEmail}" placeholder=" 아이디" required>

		<div class="join_form_text">
         <span>교사 계정 비밀번호</span>
        </div>
        <input type="text" name="teacherPw" value="${teacherInfo.teacherPw}" placeholder=" 비밀번호" required>

		<div class="join_form_text">
         <span>전화번호</span>
        </div>
        <input type="text" name="teacherPhone" value="${teacherInfo.teacherPhone}" placeholder=" 전화번호" required>
        
        <div class="join_form_text">
         <span>담당 교실</span>
        </div>

        <select name="classroomId">
        	<c:forEach var="classroomList" items="${classroomList}" >
        		<option value="${classroomList.classroomId}">${classroomList.classroomName}</option>
        	</c:forEach>
        </select>
        
        <input type="hidden" name="teacherId" value="${teacherId}">

        <button class="web_btn_small">
        	수정하기
		</button>
	</form>
<%@include file="../footer.jsp" %>
</body>
</html>