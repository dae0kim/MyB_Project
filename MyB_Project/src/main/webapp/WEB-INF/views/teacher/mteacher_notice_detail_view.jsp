<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../t_header2.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
     <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_notice_detail.css" rel="stylesheet">
</head>

<body>
<div class="wrapper">
	<div class="title_wrap">
		<div id="title_name" style="font-weight : 700;">공지사항 상세</div>	
		<input type="button" value="목록가기" onClick="location.href='javascript:history.back();'">	
	</div>

    <div class="notice_wrap">
    	<div id="notice_form">
    		<div class="title">
    		<div id = "titlegrid">
    		<div>제목</div>
    		<div>작성일: <fmt:formatDate pattern="MM'월' dd'일'" value="${noticeview.noticeDate}"/></div>
    		</div>
    		</div>
			<input type="text" class="notice_title" name="notcietitle" id="noticetitle" value="${noticeview.noticeTitle}" readonly>
			
			<div class="title">내용</div>
			<div class="notice_content">
			${noticeview.noticeContent}
        </div>
    </div>
    </div>
    </div>
</body>
</html>


<%@include file="../t_footer.jsp"%>