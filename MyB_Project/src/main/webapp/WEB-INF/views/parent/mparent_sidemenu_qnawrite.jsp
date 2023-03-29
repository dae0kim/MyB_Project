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
    <title>sidemenuqanwrite</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/mparent_sidemenu_qna.css">    
</head>
<body>
	<form action="<c:url value='/parent/mparent_sidemenu_qnawrite'/>" method="post">
	
	    <div class="title_wrap">
			<div id="title_name" style="font-weight : 700;">1:1 문의</div>
			<input type="submit" value="작성완료">	
		</div>
		<div id="sidemenuqna_subtitle">어린이집에 대한 문의 및 불편사항을 적어주세요.</div>
		
	    <div class="sidemenuqna_wrap">
	        <div class="sidemenuqnacontent_wrap">
	                    <div>
	                <div>
	                    작성자
	                    <input type="text" value="${parentEmail}" readonly>
	                	<input type="hidden" name="parentId" value="${parent.parentId}">
	                </div>
	                <div>
	                    제목
	                    <input type="text" name="complainTitle" maxlength="50" placeholder="글 제목" required>
	                </div>
	                <div>
	                    내용
	                    <br>
	                    <textarea rows="10" cols="40" maxlength="500" name="complainContent"></textarea>
	                </div>
	            </div>
	        
	    </div>
	    </div>
    </form>
</body>
</html>