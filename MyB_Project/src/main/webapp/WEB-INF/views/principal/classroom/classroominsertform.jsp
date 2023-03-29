<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<%@include file="../staticFiles.jsp" %>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<%@include file="../header.jsp" %>
	<form action="<c:url value='/classroom/insert'/>" method="post">
		<div class="join_form_text">
         <span>반 이름</span>
        </div>
        <input type="text" name="classroomName" placeholder=" 반 이름" required>
		<input type="hidden" name="kindergartenId" value="${kindergartenId}">
        
        <button class="web_btn_small">
        	등록하기
		</button>
	</form>
<%@include file="../footer.jsp" %>
</body>
</html>