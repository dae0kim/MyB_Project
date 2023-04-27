<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../t_header2.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>MyB</title>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_alarm.css" rel="stylesheet">
</head>
<body>
	<div class="wrapper">
		<div class="title_wrap">
			<div id="title_name" style="font-weight: 700;">알림</div>
			<div id="noticedetail_btn">
				<button type="button"
					onclick="location.href = '${pageContext.request.contextPath}/teacher/mteacher_web_main' ">돌아가기</button>
			</div>
		</div>
		<div class="notice_wrap">
			<div id="notice_form">
				<div class="title">
					<div id="titlegrid">
						<c:forEach items="${alarms}" var="alarm">
							<div style="font-size: 13px;">
								<fmt:formatDate pattern="MM'월' dd'일' HH:mm"
									value="${alarm.alarmDate}" />
							</div>
							<div class="content">
								<input type="text" class="notice_title" name="notcietitle"
									id="noticetitle" value="${alarm.alarmMessage}" readonly>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<%@include file="../t_footer.jsp"%>