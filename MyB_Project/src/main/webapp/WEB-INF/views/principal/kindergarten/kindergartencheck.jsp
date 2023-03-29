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
			<c:when test="${empty kindergartenStat}">
				<div class="web_kinder_chk_container">
		      		<i class="fa-sharp fa-solid fa-ban web_kinder_chk_icon"></i>
		        	<h2>아직 어린이집을 등록하지 않았습니다!</h2>   
		        	<button class="web_btn_big" type="button" onclick="location.href='<c:url value='/kindergarten/form'/>'">
					    어린이집 등록하기
					</button>   
		      	</div>
			</c:when>
			<c:when test="${kindergartenStat eq 'Y'}">
				<div class="web_kinder_chk_container">
		      		<i class="fa-solid fa-circle-check web_kinder_chk_icon"></i>
		        	<h2>이미 어린이집을 등록했습니다!</h2>      
		      	</div>
			</c:when>		
			<c:when test="${kindergartenStat eq 'N'}">
				<div class="web_kinder_chk_container">
		      		<i class="fa-solid fa-hourglass-half web_kinder_chk_icon"></i>
		        	<h2>어린이집 등록 승인 대기중 입니다!</h2>      
		      	</div>
			</c:when>		
		    
		</c:choose>
	</div>		
	</div>
  <%@include file="../footer.jsp" %>
</body>
</html>

