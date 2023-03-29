<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board"/>   
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags/complain"%> 
<!DOCTYPE html>
<html>
	<%@include file="../staticFiles.jsp" %>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
	<%@include file="../header.jsp" %>
		<div id="jb-content">
		<div class="table-title">
	      <h3>컴플레인 목록</h3>
	    </div>
	    <table class="table-fill">
	      <thead>
	        <tr>
	          <th class="text-left">글 번호</th>
	          <th class="text-left">제목</th>
	          <th class="text-left">등록일</th>
	          <th class="text-left">처리상태</th>
	        </tr>
	      </thead>
	      <tbody class="table-hover">
	        <tr>
	          <c:forEach var="complainList" items="${complainList}">
				<tr>
				<td class="text-left"><a href="<c:url value='/complain/info/${complainList.complainId}'/>">${complainList.complainId}</a></td>
 				<td class="text-left">${complainList.complainTitle}</td>
				<td class="text-left"><fmt:formatDate value="${complainList.complainDate}" pattern="YYYY-MM-dd"/></td>
				<td class="text-left">${complainList.complainStat}</td>
				</tr>
			</c:forEach>
	        </tr>
	      </tbody>
	    </table>
			<table class="paging_table">
			<tr>
				<td align="left">
					<jk:paging adminId="${loginUser.adminId}" totalPageCount="${totalPageCount}" nowPage="${page}"/>
				</td>
			</tr>
			</table>
		</div>
	<%@include file="../footer.jsp" %>
</body>
</html>