<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href='https://fonts.googleapis.com/css?family=Nanum Gothic' rel='stylesheet'>
    
    <title>회원가입</title>
    <link href="${pageContext.request.contextPath}/resources/css/web/join.css" rel="stylesheet">
</head>
<body>
	<div id="join_body">
	    <div class="logo_wrap">
	        <div id="login_logo"><a href="<c:url value='/' />"><img src="../resources/images/logo.png"></a></div>
	        <div id="logo_name">MyB</div>
	    </div>
	    <div class="join_wrap">
	        <form id="join_form" action="<c:url value='/principal/insert'/>" method="post" name="joinfrm">
	            <div class="join_form_text">
		            <span>이메일</span>
	            </div>
	            <input type="text" name="adminEmail" placeholder="　Email" required>
	            	            
	            <div class="join_form_text">
		            <span>비밀번호</span>
	            </div>
	            <input type="password" name="adminPw" placeholder="　Password" required>
	            <div id="joinstring">
	            	<span>● 비밀번호는 8자 이상으로 해주세요.</span><br>
            		<span>● 영문, 숫자, 특수문자중 2가지 이상 혼합 해주세요.</span>
            	</div>
	            
	            <div class="join_form_text">
		            <span>비밀번호 재확인</span>
	            </div>
	            <input type="password" name="adminPw2" placeholder="　Password2" required>
	            
	            <div class="join_form_text">
		            <span>이름</span>
	            </div>
	            <input type="text" name="adminName" placeholder="　name" required>
	            
	            <div class="join_form_text">
		            <span>휴대폰번호</span>
	            </div>
	            <input type="tel" name="adminPhone" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="　Phone">
	         
	            <input type="submit" value="Join" onclick="return joinCheck()">
	        </form>
	        <div>
	        	<span style="color:red;">${message}</span>
	        </div>
	    </div>
	</div>
	
	<script>
/* 		 function loginCheck() {
				아이디 입력상자 : 이름이 loginfrm인 폼 태그 내부에 존재
				if (loginfrm.email.value.length == 0) {
					alert("아이디를 입력하세요!")
		 			loginfrm.email.focus();
		 			return false;
		 		}
				쓸거면 joinfrm으로 변경
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
			} */
		 </script>
	
</body>
</html>