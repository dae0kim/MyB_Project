<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../p_header.jsp"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">>
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script>
    <title>sidemenuqnadetail</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/mparent_sidemenu_qnadetail.css">    
</head>
<body>
    <div class="title_wrap">
		<div id="title_name" style="font-weight : 700;">1:1 문의</div>
		<input type="button" value="목록가기" onClick="location.href='javascript:history.back();'">	
	</div>
	<div id="sidemenuqna_subtitle">어린이집에 대한 문의 및 불편사항을 적어주세요.</div>
	
    <div class="sidemenuqna_wrap">
    	<div class="sidemenuqnacontent_wrap">
            <div>제목: ${complain.complainTitle}</div>
            <div>작성일: <fmt:formatDate pattern="yyyy-MM-dd" value="${complain.complainDate}"/></div>
            <br>
            <p>${complain.complainContent}</p>
        </div>
    </div>
</body>
</html>