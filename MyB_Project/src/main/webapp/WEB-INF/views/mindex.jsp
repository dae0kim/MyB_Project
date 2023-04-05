<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href='https://fonts.googleapis.com/css?family=Nanum Gothic'rel='stylesheet'>
<link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mobile/all_mindex.css"	rel="stylesheet">
</head>

<body>
	<div class="border">
		<div class="headgrid">
			<div id="login_logo"><img src="./resources/images/logo.png"></div>
			
			<div id="textlow1">Welcome to</div>
			<div id="textlow2">MyB</div>
		</div>
		
		
		<div class="title_img">
			<div id="titleimage"><img src="./resources/images/mobile/main.png"></div>
		</div>
	
		<div class="login-wrap">
			<button id="loginparent" onClick="location.href='./parent/mparent_login'">
				학부모 로그인
			</button>
			<button id="loginteacher" onClick="location.href='./teacher/mteacher_login'">
				교사 로그인
			</button>
		</div>
	</div>

</body>
</html>