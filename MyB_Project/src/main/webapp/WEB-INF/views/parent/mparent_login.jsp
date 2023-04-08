<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>    
    <title>Document</title>
    <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mobile/mparent_login.css" rel="stylesheet">
</head>
<body>
	<div class="border">
		<div class="headgrid">
			<div id="login_logo"><img src="${pageContext.request.contextPath}/resources/images/logo.png"></div>	
			<div id="textlow1">Welcome to MyB</div>
			<div id="textlow2">학부모 로그인</div>
		</div>

		<div class="title_img">
			<div id="titleimage"><img src="${pageContext.request.contextPath}/resources/images/mobile/main.png"></div>
		</div>


    <div class="login-wrap">    
        <form action="<c:url value='/parent/mparent_login'/>" method="post" id="login-form">
            <input type="text" class="parentEmail_input" name="parentEmail" id="parentEmail" placeholder="　Email" required>
            <input type="password" class="parentPw_input" name="parentPw" id="parentPw" placeholder="　Password" required>
            
            <div>
	        	<span style="color:red;">${message}</span>
	        </div>
            
            <input type="submit" value="Login">
            
        </form>
        
        <div id="join">아직 회원이 아니시라면?  <a href='<c:url value="/parent/mparent_terms"/>'>회원가입</a></div>
    </div>
</div>
    
</body>
</html>