<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board"/>
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
				<th>증명 서류</th>
			</tr>
			<tr>
			<td>${kindergartenVO.kindergartenId}</td>
<%-- 					<td><a href="<c:url value='/filmrequest/${filmRequestList.filmRequestId}'/>">${filmRequestList.filmRequestId}</a></td> --%>
				<td>${kindergartenVO.kindergartenName}</td>
				<td>${kindergartenVO.kindergartenPhone}</td>
				<td>${kindergartenVO.kindergartenAddress}</td>
				<td>${kindergartenVO.kindergartenStat}</td>
				<td>
				<c:set var="len" value="${fn:length(kindergartenVO.fileName)}"/>
				<c:set var="filetype" value="${fn:toUpperCase(fn:substring(kindergartenVO.fileName, len-4, len))}"/>
				<a href='<c:url value="/file/${kindergartenVO.fileId}"/>'>${kindergartenVO.fileName} (<fmt:formatNumber>${kindergartenVO.fileSize}</fmt:formatNumber>byte)</a>
				</td>
			</tr>
			</table>
			
			<c:choose>
				<c:when test="${kindergartenVO.kindergartenStat eq 'N'}">
					<button class="web_btn" type="button" onclick="location.href='<c:url value='/kindergarten/approve/${kindergartenVO.kindergartenId}'/>'">
							    등록 승인
					</button>	
					<button class="web_btn" type="button" onclick="location.href='<c:url value='/kindergarten/disapprove/${kindergartenVO.kindergartenId}'/>'">
							    등록 거절 
					</button>	
				</c:when>
			</c:choose>
			<button class="web_btn" type="button" onclick="location.href='<c:url value='/kindergarten/request/list'/>'">
					목록으로 
			</button>
		</div>
	<%@include file="footer.jsp" %>
</body>
</html>