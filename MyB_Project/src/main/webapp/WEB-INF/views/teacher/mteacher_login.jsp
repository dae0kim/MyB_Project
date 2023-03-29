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

    <div class="logo_wrap">
        <div id="login_logo"><img src="../resources/images/logo.png"></div>
        <div id="logo_name">myB</div>
        <div id="teacher_only" style="font-size: 13px; padding-top:10px;">교사 로그인 전용</div>
    </div>

    <div class="login-wrap">
      
        <form action="<c:url value='/teacher/mteacher_login'/>" method="post" id="teacher-login-form">
            <input type="text" class="teacherEmail_input" name="teacherEmail" id="teacherEmail" placeholder="　Email">
            <input type="password" class="teacherPw_input" name="teacherPw" id="teacherPw" placeholder="　Password">
            <input type="submit" value="Login">
            
            <span class="email_ok">존재하지 않는 이메일입니다.</span>
            <span class="pw_fail">비밀번호가 틀렸습니다.</span>
        </form>
    </div>
    
 <script type="text/javascript">
 
//이메일 존재유무
	$('.teacherEmail_input').on("propertychange change keyup paste input", function() {
		var teacherEmail = $('.teacherEmail_input').val(); // teacherEmail_input에 입력되는 값
		var data = {teacherEmail : teacherEmail} // 컨트롤에 넘길 데이터 이름 : 데이터(입력값)
		
		$.ajax({
			type : "post",
			url : "./teacherEmailChk",
			data : data,
			success : function(result) {
				if(result != 'fail') {
					$('.email_ok').css("display", "inline-block");
				} else {
					$('.email_ok').css("display", "none");
				}
			}
		});
	});
	
	//올바른 비밀번호 입력체크 
	$('.teacherPw_input').on("propertychange change keyup paste input", function() {
		var teacherEmail = $('.teacherEmail_input').val();
		var teacherPw = $('.teacherPw_input').val();
		var data = {"teacherEmail" : teacherEmail, "teacherPw" : teacherPw}; // 컨트롤에 넘길 데이터 이름 : 데이터(입력값)
		
		$.ajax({
			type : "post",
			url : "./teacherPwChk",
			data : data,
			success : function(result) {
				if(result != 'fail') {
					$('.pw_fail').css("display", "inline-block"); // 비밀번호 틀림
				} else {
					$('.pw_fail').css("display", "none");
				}
			}
		});
	});
</script>

</body>
</html>