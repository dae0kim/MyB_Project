<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mobile/mparent_login.css" rel="stylesheet">
</head>
<body>
    <a href="login_teacher.html" button class="hiddenbtn">movetoteacherlogin</a></button>

    <div class="logo_wrap">
        <div id="login_logo"><img src="../resources/images/logo.png"></div>
        <div id="logo_name">myB</div>
    </div>

    <div class="login-wrap">
       
        <form action="<c:url value='/parent/mparent_login'/>" method="post" id="login-form">
            <input type="text" name="parentEmail" id="parentEmail" placeholder="　Email">
            <input type="password" name="parentPw" id="parentPw" placeholder="　Password">
            <input type="submit" value="Login">
        </form>
        
        <div id="join">아직 회원이 아니시라면?  <a href='<c:url value="/parent/mparent_terms"/>'>회원가입</a></div>
    </div>
</body>
</html>