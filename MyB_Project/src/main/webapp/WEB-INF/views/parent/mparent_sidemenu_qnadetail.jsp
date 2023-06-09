<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../p_header2.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyB</title>
     <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/resources/css/mobile/mparent_sidemenu_qnadetail.css" rel="stylesheet">
</head>

<body>
<div class="wrap">
		<div class="title_wrap">
        <div id="title_name" style="font-weight : 700;">문의내용 확인</div>
	    <button type="button" onclick = "location.href = '${pageContext.request.contextPath}/parent/mparent_sidemenu_qna' ">돌아가기</button>
        </div>


    <div class="notice_wrap">
    	<div id="notice_form">
    		<div class="title">
    		<div id = "titlegrid">
    		<div>제목</div>
    		<div>작성일: <fmt:formatDate pattern="MM'월' dd'일'" value="${complain.complainDate}"/></div>
    		</div>
    		</div>
			<input type="text" class="notice_title" name="notcietitle" id="noticetitle" value="${complain.complainTitle}" readonly>
			
			<div class="title">내용</div>
			<div class="notice_content">
			${complain.complainContent}
        </div>
    </div>
    </div>
    </div>
</body>
</html>


<%@include file="../p_footer.jsp"%>