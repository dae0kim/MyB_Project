<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../t_header2.jsp"%>
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
	<div class="wrap">
	<div class="title_wrap">
		<div id="title_name" style="font-weight: 700;">요청사항 목록</div>
	</div>
		<div class="diseaselog">
		<input type="hidden" id="parentId" name="parentId" value="${parentId}">
		
		
		<c:forEach items="${getParentId }" var="getParentId" varStatus="status">
		<div id="diseaseform">
		
		
			<div id="childname">${getChildNameList[status.index].childName}　${getParentId.parentRelation}</div>
		
			
			<button type="button" onclick = "location.href = '${pageContext.request.contextPath}/teacher/mteacher_requset_check/${getParentId.requestId}?parentId=${getParentId.parentId}' ">요청사항 확인</button>
	</div>
		</c:forEach>

	</div>

	</div>
</body>

</html>

<%@include file="../t_footer.jsp"%>
