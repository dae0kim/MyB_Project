<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../t_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_requset_list.css" rel="stylesheet">
</head>
<body>
	<div class="title_wrap">
		<div id="title_name" style="font-weight: 700;">요청사항 목록</div>
	</div>
	
	
	<input type="hidden" id="parentId" name="parentId" value="${parentId}">
	
<%-- 		<c:forEach items="${getRequestIdList }" var="getRequestIdList" varStatus="status2">
		<div>${getRequestIdList.requestId}</div>
		</c:forEach>
		 --%>
		
 		
		<%-- <c:set var="getRequestIdList" value="${getRequestIdList.requestId}" />  --%>
		
		<div class="requestChk">
		<c:forEach items="${getParentId }" var="getParentId" varStatus="status">
		<div id="requestBox">  
		
			<div id="parentname">${getParentId.parentName}</div>
			<div id="parentRelation">${getParentId.parentRelation}</div>
		
			
			<a href='<c:url value="/teacher/mteacher_requset_check/${getParentId.requestId}?parentId=${getParentId.parentId}" />' class="button">요청사항 확인</a>
		</div>
		</c:forEach>

	</div>
</body>
</html>
