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

<body style="font-family: Nanum Gothic;">
	<div class="border">
		<div class="headgrid">
			<div id="login_logo"><img src="${pageContext.request.contextPath}/resources/images/logo.png"></div>
			
			<div id="textlow1">오류 발생!</div>
			<div id="textlow2" style="font-size:1em;">페이지를 찾지 못했습니다</div>
		</div>
		
		
		<div class="title_img">
			<div id="titleimage"><img src="${pageContext.request.contextPath}/resources/images/mobile/pngwing.com.png"></div>
		</div>
	
		<div class="login-wrap" style="height: 120px; font-size:2em;">
			<button id="loginparent" onClick="location.href='${pageContext.request.contextPath}'">
				메인으로 돌아가기
			</button>
		</div>
	</div>

</body>
</html>