<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/t_footer.css">
</head>
<body style="font-family: Nanum Gothic">


<footer>
	<div id="footer1">
		<div class="mouseevent">
			<div id="childplus">
				<a href='<c:url value="/teacher/mteacher_requset_list/${loginUser.teacherId}"/>'>
					<i class="fa-solid fa-baby fa-xl" style="color: #5e5e5e; font-size: 1.4em;"></i>
					<i class="fa-solid fa-plus fa-xs" style="color: #5e5e5e; font-size: 0.7em;"></i>
				</a>
			</div>
			<p>요청확인</p>
		</div>
	</div>	
	<div id="footer2">
		<div class="mouseevent">
			<a href='<c:url value="/teacher/mteacher_disease/${loginUser.teacherId}"/>'>
				<i class="fa-solid fa-user" style="color: #5e5e5e;"></i>
			</a>
			<p>질병관리</p>
		</div>
	</div>
	<div id="footer3">
		<div class="mouseevent">
			<a href='<c:url value="/teacher/mteacher_web_main"/>'>
				<i class="fa-solid fa-house" style="color: #5e5e5e;"></i>
			</a>
			<p>홈</p>
		</div>
	</div>
	<div id="footer4">
		<div class="mouseevent">
			<a href='<c:url value="/teacher/mteacher_notice_detail"/>'>
				<i class="fa-solid fa-comments" style="color: #5e5e5e;"></i>
			</a>
			<p>공지사항</p>
		</div>
	</div>
	<div id="footer5">
		<div class="mouseevent">
			<a href='<c:url value="/teacher/mteacher_logout"/>'>
				<i class="fa-solid fa-right-from-bracket" style="color: #5e5e5e;"></i>
			</a>
			<p>로그아웃</p>
		</div>	
	</div>

</footer>

</body>
</html>