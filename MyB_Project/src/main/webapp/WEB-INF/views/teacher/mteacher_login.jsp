<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>   
    <title>Document</title>
    <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_login.css" rel="stylesheet">
</head>
<body>
	<div class="border">
		<div class="headgrid">
			<div id="login_logo"><img src="../resources/images/logo.png"></div>	
			<div id="textlow1"><b>교사 로그인</b></div>
		</div>

		<div class="title_img">
			<div id="titleimage"><img src="../resources/images/mobile/main.png"></div>
		</div>


    <div class="login-wrap">    
       <form action="<c:url value='/teacher/mteacher_login'/>" method="post" id="teacher-login-form">
            <input type="text" class="teacherEmail_input" name="teacherEmail" id="teacherEmail" placeholder="　Email" required>
            <input type="password" class="teacherPw_input" name="teacherPw" id="teacherPw" placeholder="　Password" required>
            
            <div>
	        	<span style="color:red;">${message}</span>
	        </div>
            
            <input type="submit" value="Login">

        </form>
        </div>
    </div>
</body>
</html>