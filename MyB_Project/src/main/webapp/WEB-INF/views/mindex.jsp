<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mobile/all_mindex.css"	rel="stylesheet">
</head>

<body>
	<div class="logo_wrap">
		<div id="login_logo">
			<img src="./resources/images/logo.png">
		</div>
		<div id="logo_name">myB</div>
	</div>

	<div class="login-wrap">
		<button id="loginparent">
			<a href='<c:url value="/parent/mparent_login" />'>사용자 로그인</a>
		</button>
		<button id="loginteacher">
			<a href='<c:url value="/teacher/mteacher_login" />'>교사 로그인</a>
		</button>
	</div>

</body>
</html>