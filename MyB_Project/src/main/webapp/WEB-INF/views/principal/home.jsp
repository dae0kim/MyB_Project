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
        	<h2>반 관리</h2>      
      	</div>	
		<div class="home_menu_icon">
      		<i id="home_icon" class="fa-regular fa-user"></i>
        	<h2>교사 관리</h2>      
      	</div>	
		<div class="home_menu_icon">
      		<i id="home_icon" class="fa-regular fa-user"></i>
        	<h2>1:1 게시판</h2>      
      	</div>	
	</div>
	<div style="text-align:center; padding-top:50px;">
		<div class="home_menu_icon">
      		<i id="home_icon" class="fa-regular fa-user"></i>
        	<h2>공지사항</h2>      
      	</div>	
		<div class="home_menu_icon">
      		<i id="home_icon" class="fa-regular fa-user"></i>
        	<h2>출결 통계</h2>      
      	</div>	
		<div class="home_menu_icon">
      		<i id="home_icon" class="fa-regular fa-user"></i>
        	<h2>질병 통계</h2>      
      	</div>	
	</div>
		
	</div>
  <%@include file="footer.jsp" %>
</body>
</html>

