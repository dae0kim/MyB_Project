<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../p_header.jsp"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyB</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_notice_detail.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/mparent_web_main.css">    
</head>
<body style="font-family: Nanum Gothic">
<div class="wrapper">


	<div class="notice_box">
	

	<input type="hidden" value="${teacherId}"> 
	
	
		<button type="button" id="noticebtn"  onClick="location.href='./mparent_notice_detail/${teacherId}'">
			<div class="noticeimg">
				<div class="noticewrite">
					<span id="noticetitle">공지사항</span>
					<span id="noticecontent">공지사항을 확인할 수 있어요</span>
				</div>
				<img src="${pageContext.request.contextPath}/resources/images/mobile/mparent_notice.png" width="148" style="padding-top:13px;">
			</div>
		</button>
	</div>
			
	<div class="request_wrap">
			<div id="request">
            <button type="button" id="requestbtn"  onClick="location.href='./mparent_request'">
            	<div class="btnimg">
					<div class="btnwrite">
						<span class="btntitle">요청사항 작성</span>
						<span class="btncontent">선생님에게 요청사항을 보낼 수 있어요</span>
					</div>
					<img src="${pageContext.request.contextPath}/resources/images/mobile/mparent_request.png" width="100%" style="padding-top:20px;">
				</div>
            </button>
			</div>
			
			
			<div id="requestchk">
            <button type="button" id="requestchkbtn" onClick="location.href='./mparent_request_check'">
            	<div class="btnimg">
					<div class="btnwrite">
						<span class="btntitle">요청사항 확인</span>
						<span class="btncontent">보낸 요청사항을 확인할 수 있어요</span>
					</div>
					<img src="${pageContext.request.contextPath}/resources/images/mobile/mparent_requestchk.png" width="100%" style="padding-top:20px;">
				</div>
            </button>
			</div>
    </div>
</div>
</body>

</html>

<%@include file="../p_footer.jsp"%>