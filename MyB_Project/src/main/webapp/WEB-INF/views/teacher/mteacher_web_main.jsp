<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../t_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mteachermain</title>    
        <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
    	<link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_notice_detail.css" rel="stylesheet">
    	 <link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_web_main.css" rel="stylesheet">

     
     
</head>
<body>
<div class="wrapper">


	<div class="notice_box">
		<button type="button" id="noticebtn"  onClick="location.href='./mteacher_notice_detail'">
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
            <button type="button" id="requestbtn"  onClick="location.href='./mteacher_requset_list/${loginUser.teacherId}'">
            	<div class="btnimg">
					<div class="btnwrite">
						<span class="btntitle">요청사항 확인</span>
						<span class="btncontent">학부모의 요청사항을 확인하세요</span>
					</div>
					<img src="${pageContext.request.contextPath}/resources/images/mobile/mparent_request.png" width="100%" style="padding-top:20px;">
				</div>
            </button>
			</div>
			
			
			<div id="requestchk">
            <button type="button" id="requestchkbtn" onClick="location.href='./mteacher_disease/${loginUser.teacherId}'">
            	<div class="btnimg">
					<div class="btnwrite">
						<span class="btntitle">원생 질병관리</span>
						<span class="btncontent">원생의 질병상태를 입력하세요</span>
					</div>
					<img src="${pageContext.request.contextPath}/resources/images/mobile/mparent_requestchk.png" width="100%" style="padding-top:20px;">
				</div>
            </button>
			</div>
    </div>
</div>
</body>
