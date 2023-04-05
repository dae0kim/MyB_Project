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
			<div id="login_logo"><img src="../resources/images/logo.png"></div>	
			<div id="textlow1"><b>학부모 로그인</b></div>
		</div>

		<div class="title_img">
			<div id="titleimage"><img src="../resources/images/mobile/main.png"></div>
		</div>


    <div class="login-wrap">    
        <form action="<c:url value='/parent/mparent_login'/>" method="post" id="login-form">
            <input type="text" class="parentEmail_input" name="parentEmail" id="parentEmail" placeholder="　Email">
            <input type="password" class="parentPw_input" name="parentPw" id="parentPw" placeholder="　Password">
            <input type="submit" value="Login">
            
            <span class="email_ok">존재하지 않는 이메일입니다.</span>
            <span class="pw_fail">비밀번호가 틀렸습니다.</span>
        </form>
        
        <div id="join">아직 회원이 아니시라면?  <a href='<c:url value="/parent/mparent_terms"/>'>회원가입</a></div>
    </div>
    
 <script type="text/javascript">

	//이메일 존재유무
	$('.parentEmail_input').on("propertychange change keyup paste input", function() {
		var parentEmail = $('.parentEmail_input').val(); // parentEmail_input에 입력되는 값
		var data = {parentEmail : parentEmail} // 컨트롤에 넘길 데이터 이름 : 데이터(입력값)
		
		$.ajax({
			type : "post",
			url : "./parentEmailChk",
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
	$('.parentPw_input').on("propertychange change keyup paste input", function() {
		var parentEmail = $('.parentEmail_input').val();
		var parentPw = $('.parentPw_input').val();
		var data = {"parentEmail" : parentEmail, "parentPw" : parentPw}; // 컨트롤에 넘길 데이터 이름 : 데이터(입력값)
		
		$.ajax({
			type : "post",
			url : "./parentPwChk",
			data : data,
			success : function(result) {
				if(result != 'fail') {
					$('.pw_fail').css("display", "none");
				} else {
					$('.pw_fail').css("display", "inline-block"); // 비밀번호 틀림
				}
			}
		});
	});
	
</script>
</div>
    
</body>
</html>