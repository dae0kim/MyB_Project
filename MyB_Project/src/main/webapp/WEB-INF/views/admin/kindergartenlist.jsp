<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board"/>
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags/kindergarten"%>    
<!DOCTYPE html>
<html>
	<%@include file="staticFiles.jsp" %>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
	<%@include file="header.jsp" %>
		<div id="jb-content">
			<table border="1">
			<tr>
				<th>No.</th>
				<th>어린이집 이름</th>
				<th>어린이집 전화번호</th>
				<th>주소</th>
				<th>요청 상태</th>
			</tr>
			<c:forEach var="kindergartenList" items="${kindergartenList}">
				<c:choose>
					<c:when test="${kindergartenList.kindergartenStat=='y'}">
						<tr class="background_grey_change">
					</c:when>
					<c:otherwise>
						<tr>
					</c:otherwise>
				</c:choose>
					<td><a href="<c:url value='/kindergarten/info/${kindergartenList.kindergartenId}'/>">${kindergartenList.kindergartenId}</a></td>
<%-- 					<td><a href="<c:url value='/filmrequest/${filmRequestList.filmRequestId}'/>">${filmRequestList.filmRequestId}</a></td> --%>
						<td>${kindergartenList.kindergartenName}</td>
						<td>${kindergartenList.kindergartenPhone}</td>
						<td>${kindergartenList.kindergartenAddress}</td>
						<td>${kindergartenList.kindergartenStat}</td>
					</tr>
			</c:forEach>
			</table>
			<table class="table">
			<tr>
				<td align="left">
					<jk:paging totalPageCount="${totalPageCount}" nowPage="${page}"/>
					<%-- <jk:paging categoryId="${categoryId}" totalPageCount="${totalPageCount}" nowPage="${page}"/> --%>
				</td>
			</tr>
			</table>		
		</div>
	<%@include file="footer.jsp" %>
</body>
</html>