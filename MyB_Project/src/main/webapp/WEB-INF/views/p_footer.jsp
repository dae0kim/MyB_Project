<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/p_footer.css">
</head>
<body>


<footer>
	<div id="footer1">
		<div class="mouseevent">
			<div id="childplus">
				<a href='<c:url value="/parent/mparent_select_kinder"/>'>
					<i class="fa-solid fa-baby fa-xl" style="color: #5e5e5e; font-size: 1.4em;"></i>
					<i class="fa-solid fa-plus fa-xs" style="color: #5e5e5e; font-size: 0.7em;"></i>
				</a>
			</div>
			<p>자녀등록</p>
		</div>
	</div>	
	<div id="footer2">
		<div class="mouseevent">
			<a href='<c:url value="/parent/mparent_sidemenu_info"/>'>
				<i class="fa-solid fa-user" style="color: #5e5e5e;"></i>
			</a>
			<p>내 정보</p>
		</div>
	</div>
	<div id="footer3">
		<div class="mouseevent">
			<a href='<c:url value="/parent/mparent_web_main"/>'>
				<i class="fa-solid fa-house" style="color: #5e5e5e;"></i>
			</a>
			<p>홈</p>
		</div>
	</div>
	<div id="footer4">
		<div class="mouseevent">
			<a href='<c:url value="/parent/mparent_sidemenu_qna"/>'>
				<i class="fa-solid fa-comments" style="color: #5e5e5e;"></i>
			</a>
			<p>1:1문의</p>
		</div>
	</div>
	<div id="footer5">
		<div class="mouseevent">
			<a href='<c:url value="/parent/mparent_logout"/>'>
				<i class="fa-solid fa-right-from-bracket" style="color: #5e5e5e;"></i>
			</a>
			<p>로그아웃</p>
		</div>	
	</div>

</footer>

</body>
</html>