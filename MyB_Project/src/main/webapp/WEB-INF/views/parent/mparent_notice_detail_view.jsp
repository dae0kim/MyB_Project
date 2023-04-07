<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../p_header2.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
     <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/resources/css/mobile/mparent_notice_detail.css" rel="stylesheet">
</head>

<body>
<div class="wrapper">
	<div class="title_wrap">
		<div id="title_name" style="font-weight : 700;">내 정보</div>
		<input type="button" onClick="location.href='./mparent_sidemenu_info_modify'" value="수정하기">	
	</div>

    <div class="notice_wrap">
    	<div id="notice_form">
    		<div class="title">제목
			<input type="text" class="notice_title" name="notcietitle" id="noticetitle" value="${noticeview.noticeTitle}" readonly>
			
			<div class="title">내용</div>
			<input type="text" class="notice_content" name="noticecontent" id="noticecontent" value="${noticeview.noticeContent}" readonly>
			
        </div>
    </div>
    </div>
</body>
</html>


<%@include file="../p_footer.jsp"%>