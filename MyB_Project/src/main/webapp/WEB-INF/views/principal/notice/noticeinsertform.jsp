<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<%@include file="../staticFiles.jsp" %>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<%@include file="../header.jsp" %>
	<form action="<c:url value='/notice/insert'/>" method="post">
		
		<div class="join_form_text">
         <span>제목</span>
        </div>
        <input type="text" name="noticeTitle" required>
		
		<div class="join_form_text">
         <span>내용</span>
        </div>
        <textarea name="noticeContent" required></textarea>
		
		<div class="join_form_text">
         <span>상단 고정 여부</span>
        </div>
        <input type="radio" name="noticeStat" value='O' />O
        <input type="radio" name="noticeStat" value='X' checked/>X
        
		<input type="hidden" name="adminId" value="${loginUser.adminId}">
        
        <input type="submit" value="등록하기">
	</form>
<%@include file="../footer.jsp" %>
</body>
</html>