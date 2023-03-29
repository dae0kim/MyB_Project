<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
        <form id="join-form" action="<c:url value='/principal/insert'/>" method="post">
        
        	<div class="join_form_text">
	            <span>이메일</span>
            </div>
	       <input type="email" class="adminEmail_input" name="adminEmail" id="adminEmail" value="${adminVO.adminEmail}"onkeyup="noSpace(this);" onchange="noSpace(this);" placeholder="　Email" required>
            <!-- email 중복 체크 -->
<!-- 			<span class="email_ok">사용 가능한 이메일입니다.</span> -->
			<span class="email_already">해당 이메일이 이미 존재합니다.</span>
			<!-- email 정규식 체크 -->
			<span class="email_validation">이메일 형식대로 입력해주세요.</span>
			
			<div class="join_form_text">
	            <span>비밀번호</span>
            </div>
            <input type="password" class="adminPw_input" name="adminPw" id="adminPw" value="${adminVO.adminPw}" placeholder="　Password" onkeyup="noSpace(this);" onchange="noSpace(this);" required>
            <div id="joinstring">
	            <span class="pw_input">비밀번호 조건을 충족해주세요.</span>
            	<span>● 비밀번호는 8자 이상으로 해주세요.</span><br>
           		<span>● 영문, 숫자, 특수문자중 2가지 이상 혼합 해주세요.</span>
           	</div>
           	
           	<div class="join_form_text">
	            <span>비밀번호 재확인</span>
            </div>
            <input type="password" class="adminPw_re_input" name="adminPw_re" id="adminPw_re" placeholder="　Password2" onkeyup="noSpace(this);" onchange="noSpace(this);" required>
            <span class="pw_re_input_1">비밀번호가 일치합니다.</span>
            <span class="pw_re_input_2">비밀번호가 일치하지 않습니다.</span>
            
            <div class="join_form_text">
	            <span>이름</span>
            </div>
            <input type="text" class="adminName_input" name="adminName" id="adminName" value="${adminVO.adminName}" placeholder="　Name" onkeyup="noSpace(this);" onchange="noSpace(this);" required>
            
            <div class="join_form_text">
	            <span>휴대폰번호</span>
            </div>
            <input type="text" class="adminPhone_input" name="adminPhone" id="adminPhone" value="${adminVO.adminPhone}" placeholder="　Phone('-'없이 번호만 입력)" oninput="autoHyphen(this)" maxlength="13" required>
            <span class="phone_already">해당 번호가 이미 존재합니다.</span>
            

            <input type="submit" class="join_btn" value="Join">
        </form>
    </div>
	</div>
<script type="text/javascript">

	// 유효성 검사 체크
	var emailokCheck = false;
	var emailvalCheck =false;
	var pwchkCheck = false;
	var pwvaliCheck = false;
	var phoneokCheck = false;
	
	$(document).ready(function() {	
		$(".join_btn").click(function() {
			
			if(emailokCheck&&emailvalCheck&&pwchkCheck&&pwvaliCheck&&phoneokCheck) {
				$("#login-form").attr("action", "./insert");
				$("#login-form").submit();
			}
			alert("기입하신 정보를 확인해주세요.");
			return false;
		});
	});
	
	// 이메일 중복검사
	$('.adminEmail_input').on("propertychange change keyup paste input", function() {
		var adminEmail = $('.adminEmail_input').val(); // adminEmail_input에 입력되는 값
		var data = {adminEmail : adminEmail} // 컨트롤에 넘길 데이터 이름 : 데이터(입력값)
		
		$.ajax({
			type : "post",
			url : "./adminEmailChk",
			data : data,
			success : function(result) {
				if(result != 'fail') {
					$('.email_ok').css("display", "inline-block");
					$('.email_already').css("display", "none");
					emailokCheck = true;
				} else {
					$('.email_already').css("display", "inline-block");
					$('.email_ok').css("display", "none");
					emailokCheck = false;
				}
			}
		});
	});
	
	// 이메일 정규식 검사
	$('.adminEmail_input').on("propertychange change keyup paste input", function() {
		var email = $('.adminEmail_input').val();
		var reg = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
		
		if(email.match(reg) == null) { // 조건 불충족
			$('.email_validation').css('display', 'block');
			emailvalCheck = false;
		} else {
			$('.email_validation').css('display', 'none');
			emailvalCheck = true;
		}
	});
	
	// 비밀번호 일치 검사
	$('.adminPw_re_input').on("propertychange change keyup paste input", function() {
		var pw = $('.adminPw_input').val();
		var pwchk = $('.adminPw_re_input').val();
	
		if(pw == pwchk) {
			$('.pw_re_input_1').css('display', 'block');
			$('.pw_re_input_2').css('display','none');
			pwchkCheck = true;
		} else {
			$('.pw_re_input_1').css('display', 'none');
			$('.pw_re_input_2').css('display','block');
			pwchkCheck = false;
		}
	});
	
	// 비밀번호 정규식 검사
	$('.adminPw_input').on("propertychange change keyup paste input", function() {
		var pw = $('.adminPw_input').val();
		// 영문, 숫자, 특수문자 중 2가지 이상 조합하여 8자리 ~ 20자리 이내의 암호 정규식 (2가지 조합)
		var reg = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{8,20}$/;
		
		if(pw.match(reg) == null) { // 조건 불충족
			$('.pw_input').css('display', 'block');
			pwvaliCheck = false;
		} else {
			$('.pw_input').css('display', 'none');
			pwvaliCheck = true;
		}
	});
	
	// 휴대폰 번호 하이픈 자동추가
	const autoHyphen = (target) => {
		 target.value = target.value
		 .replace(/[^0-9]/g, '')
		 .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
	
	// 휴대폰 번호 중복검사
	$('.adminPhone_input').on("propertychange change keyup paste input", function() {
		var adminPhone = $('.adminPhone_input').val(); // parentEmail_input에 입력되는 값
		var data = {adminPhone : adminPhone} // 컨트롤에 넘길 데이터 이름 : 데이터(입력값)
		
		$.ajax({
			type : "post",
			url : "./adminPhoneChk",
			data : data,
			success : function(result) {
				if(result != 'fail') {
					$('.phone_already').css("display", "none");
					phoneokCheck = true;
				} else {
					$('.phone_already').css("display", "inline-block");
					phoneokCheck = false;
				}
			}
		});
	});
	
	
	// 공백제거
	function noSpace(obj) {
	    var str_space = /\s/; //공백 체크
	    if(str_space.exec(obj.value)) { 
	        obj.focus();
	        obj.value = obj.value.replace(/\s| /gi,''); // 공백제거
	        return false;
    	}
	}
	
</script>	
</body>
</html>