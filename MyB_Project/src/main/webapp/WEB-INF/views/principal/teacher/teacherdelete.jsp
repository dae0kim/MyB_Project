<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<%@include file="../staticFiles.jsp" %>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<%@include file="../header.jsp" %>
	<form action="<c:url value='/teacher/delete/${teacherInfo.teacherId}'/>" method="post">
		<div class="join_form_text">
         <span>${teacherInfo.teacherName} 선생님의 정보를 삭제하시겠습니까?</span>
        </div>
        <input type="submit" value="삭제하기" >
	</form>
<%@include file="../footer.jsp" %>
</body>
</html>