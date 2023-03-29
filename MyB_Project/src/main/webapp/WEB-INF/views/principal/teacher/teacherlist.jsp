<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board"/>   
<!DOCTYPE html>
<html>
	<%@include file="../staticFiles.jsp" %>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
	<%@include file="../header.jsp" %>
		<div id="jb-content">
		<div class="table-title">
	      <h3>교사 목록</h3>
	    </div>
	    <table class="table-fill">
	      <thead>
	        <tr>
	          <th class="text-left">이름</th>
	          <th class="text-left">담당 교실</th>
	          <th class="text-left">연락처</th>
	        </tr>
	      </thead>
	      <tbody class="table-hover">
	        <tr>
	          <c:forEach var="teacherList" items="${teacherList}">
				<tr>
					<td class="text-left"><a href="<c:url value='/teacher/info/${teacherList.teacherId}'/>">${teacherList.teacherName}</a></td>
					<td class="text-left">${teacherList.classroomName}</td>
					<td class="text-left">${teacherList.teacherPhone}</td>
				</tr>
				</c:forEach>
	        </tr>
	      </tbody>
	    </table>
		<button class="web_btn_small" type="button" onclick="location.href='<c:url value='/teacher/insert'/>'">
		    교사 등록하기
		</button>		
		</div>
	<%@include file="../footer.jsp" %>
</body>
</html>