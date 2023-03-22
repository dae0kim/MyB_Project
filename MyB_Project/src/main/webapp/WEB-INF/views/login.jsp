<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href='https://fonts.googleapis.com/css?family=Nanum Gothic' rel='stylesheet'>
    
    <title>로그인</title>
    <link href="${pageContext.request.contextPath}/resources/css/web/login.css" rel="stylesheet">
</head>
<body>
	<div id="login_body">
	    <div class="logo_wrap">
	        <div id="login_logo"><a href="<c:url value='/' />"><img src="./resources/images/logo.png"></a></div>
	        <div id="logo_name">MyB</div>
	    </div>
	    <div class="login_wrap">
	        <form id="login_form" action="<c:url value='/login'/>" method="post" name="loginfrm">
	            <input type="text" name="email" placeholder="　Email">
	            <input type="password" name="password" placeholder="　Password">
	            <input type="submit" value="Login" onclick="return loginCheck()">
	        </form>
	        <div>
	        	<span style="color:red;">${message}</span>
	        </div>
	        <div id="join">아직 회원이 아니시라면?  <a href="<c:url value='/principal/join' />">회원가입</a></div>
	    </div>
	</div>
	
	<script>
		 function loginCheck() {
				/* 아이디 입력상자 : 이름이 loginfrm인 폼 태그 내부에 존재 */
				if (loginfrm.email.value.length == 0) {
					alert("아이디를 입력하세요!")
		 			loginfrm.email.focus();
		 			return false;
		 		}
				
		 		if (loginfrm.password.value == "") {
		 			alert("비밀번호를 입력하세요!")
		 			loginfrm.password.focus();
		 			return false;
		 		}
		 		var pattern = /\s/g; // 공백체크 (탭, 스페이스)
		 		if (loginfrm.password.value.match(pattern)) {
		 			alert("비밀번호는 공백 없이 입력해주세요.");
		 			frm.password.focus();
		 			return false;
		 		}
		 		return true;
			}
		 </script>
	
</body>
</html>