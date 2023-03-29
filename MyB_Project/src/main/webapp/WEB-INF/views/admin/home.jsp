<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <%@include file="staticFiles.jsp" %>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
  <%@include file="header.jsp" %>
	<div id="jb-content">
	<div style="text-align:center; padding-top:50px;">
		<div class="home_menu_icon">
      		<i id="home_icon" class="fa-regular fa-user"></i>
        	<h2><a href="<c:url value='/kindergarten/request/list' />">어린이집 등록 요청 확인</a></h2>      
      	</div>	
		<div class="home_menu_icon">
      		<i id="home_icon" class="fa-regular fa-user"></i>
        	<h2>통계 - 지역</h2>      
      	</div>	
		<div class="home_menu_icon">
      		<i id="home_icon" class="fa-regular fa-user"></i>
        	<h2>통계 - 날짜</h2>      
      	</div>	
	</div>
		
	</div>
  <%@include file="footer.jsp" %>
</body>
</html>

