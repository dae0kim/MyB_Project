<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_login.css" rel="stylesheet">
</head>
<body>

    <div class="logo_wrap">
        <div id="login_logo"><img src="../resources/images/logo.png"></div>
        <div id="logo_name">myB</div>
        <div id="teacher_only" style="font-size: 13px; padding-top:10px;">교사 로그인 전용</div>
    </div>

    <div class="login-wrap">
      
        <form action="<c:url value='/teacher/mlogin_teacher'/>" method="post" id="teacher-login-form">
            <input type="text" name="teacherEmail" id="teacherEmail" placeholder="　Email">
            <input type="password" name="teacherPw" id="teacherPw" placeholder="　Password">
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>