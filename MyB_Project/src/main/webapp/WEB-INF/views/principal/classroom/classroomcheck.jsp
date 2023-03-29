<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@include file="../staticFiles.jsp" %>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<%@include file="../header.jsp" %>
	<div id="jb-content">
	<div style="text-align:center; padding-top:50px;">
		<c:choose>
			<c:when test="${classroomCount eq 0}">
				<div class="home_menu_icon">
		      		<i class="fa-sharp fa-solid fa-ban web_kinder_chk_icon"></i>
		        	<h2>최소 한 개 이상의 반 등록이 필요합니다!</h2>   
		        	<button class="web_btn_big" type="button" onclick="location.href='<c:url value='/classroom/insert'/>'">
					    반 등록하기
					</button>   
		      	</div>
			</c:when>
		</c:choose>
	</div>		
	</div>
  <%@include file="../footer.jsp" %>
</body>
</html>

