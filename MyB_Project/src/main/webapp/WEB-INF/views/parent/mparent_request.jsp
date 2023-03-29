<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../p_header.jsp"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">>
    <title>request</title>
    <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mobile/mparent_request.css" rel="stylesheet">    
</head>
<body>
	<form action="<c:url value='/parent/mparent_request'/>" method="post">
	    <div class="title_wrap">
			<div id="title_name" style="font-weight : 700;">요청사항 작성</div>
			<input type="submit" value="작성하기">	
		</div>
		
	    <div class="request_wrap">
	    	<div id="request-form">
	    		<div class="request-name">해당하는 자녀를 선택해주세요.</div>
	    		<select name="childId" class="childId_input" id="childId" style="
	    			margin-bottom: 20px;
		          	height: 48px;
		        	width: 85%;
		        	border: 1px solid #999;
		        	font-family: inherit;
		            background: url(../resources/images/arrow.jpg) no-repeat 95% 50%;" required> 
	                <option value="">- 자녀 선택</option>
	                <c:forEach var="child" items="${childList}">
	                	<option value="${child.childId}">${child.childName}${child.classroomId}${child.parentId}</option>
	                </c:forEach>
	            </select>
	    	
	    		<div class="request-name">요청날짜를 선택해주세요.</div>
				<input type="date" class="requestDate_input" name="requestDate" id="requestDate" value="${parent.parentEmail}">
				
				<div class="request-name">요청사항을 등록해주세요.</div>
				<input type="text" class="requestContent1_input" name="requestContent1" id="requestContent1" value="${parent.parentName}">
				<input type="text" class="requestContent2_input" name="requestContent2" id="requestContent2" value="${parent.parentName}">
				<input type="text" class="requestContent3_input" name="requestContent3" id="requestContent3" value="${parent.parentName}">
				<input type="text" class="requestContent4_input" name="requestContent4" id="requestContent4" value="${parent.parentName}">
				<input type="text" class="requestContent5_input" name="requestContent5" id="requestContent5" value="${parent.parentName}">
	        </div>
	    </div>
    </form>
</body>
</html>