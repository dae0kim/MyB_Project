<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@include file="staticFiles.jsp" %>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<%@include file="header.jsp" %>
	<div id="jb-content">
	<div class="web_prin_icon_container">
		<div class="home_menu_icon">
      		<i class="fa-solid fa-chalkboard web_prin_home_icon"></i>
        	<h2><a href="<c:url value='/classroom/namelist/${loginUser.adminId}' />">반 관리</a></h2>      
      	</div>	
		<div class="home_menu_icon">
			<i class="fa-solid fa-chalkboard-user web_prin_home_icon"></i>
        	<h2><a href="<c:url value='/teacher/list/${loginUser.adminId}' />">교사 관리</a></h2>      
      	</div>	
		<div class="home_menu_icon">
			<i class="fa-regular fa-face-angry web_prin_home_icon"></i>
        	<h2><a href="<c:url value='/complain/list/${loginUser.adminId}' />">컴플레인 게시판</a></h2>      
      	</div>	
	</div>
	<div class="web_prin_icon_container">
		<div class="home_menu_icon">
      		<i class="fa-solid fa-clipboard-list web_prin_home_icon"></i>
        	<h2><a href="<c:url value='/notice/list/${loginUser.adminId}' />">공지사항</a></h2>      
      	</div>	
		<div class="home_menu_icon">
      		<i class="fa-solid fa-person-circle-question web_prin_home_icon"></i>
        	<h2><a href="<c:url value='#' />">출결 통계</a></h2>      
      	</div>	
		<div class="home_menu_icon">
			<i class="fa-solid fa-virus-covid web_prin_home_icon"></i>
        	<h2><a href="<c:url value='#' />">질병 통계</a></h2>      
      	</div>	
	</div>
		
	</div>
  <%@include file="footer.jsp" %>
</body>
</html>

