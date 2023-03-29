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
<link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_requset_list.css"ㅍ rel="stylesheet">
</head>
<body>
	<div class="title_wrap">
		<div id="title_name" style="font-weight: 700;">요청사항 목록</div>
	</div>
	
		<c:forEach items="${getRequestIdList }" var="getRequestIdList" varStatus="status2">
		<div>${getRequestIdList.requestId}</div>
		</c:forEach>
		
		
 		
		<%-- <c:set var="getRequestIdList" value="${getRequestIdList.requestId}" />  --%>
		<c:forEach items="${getParentName }" var="getParentName" varStatus="status">
		
			<div id="parentname">${getParentName.parentName}</div>
			<div id="parentRelation">${getParentName.parentRelation}</div>
		
			
			<a href='<c:url value="/teacher/mteacher_requset_check/${getParentName.requestId}" />' class="button">요청사항 확인</a>
			
		</c:forEach>

	
</body>
</html>
