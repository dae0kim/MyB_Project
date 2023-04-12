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
    	
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/webicons/favicon.png">
    <title>회원가입</title>
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/style.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/web/join.css" rel="stylesheet">
	
</head>
<body>
    <div class="main-wrapper">
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>
        <div class="auth-wrapper d-flex no-block justify-content-center align-items-center" style="background-color:#F5F6F7;">
            <div class="auth-box border-top border-secondary" style="background-color:#F5F6F7; margin:0 !important;">
                <div>
                    <div class="text-center" style="padding-top: 20px; padding-bottom: 20px;">
                        <span class="db">
                        	<a href="<c:url value='/' />">
                        		<img src="${pageContext.request.contextPath}/resources/images/webicons/logo5.png" alt="logo" style="width:auto; height:70px;"/>
                        	</a>
                        </span>
                    </div>
                    <!-- Form -->
                    <form id="join-form" class="form-horizontal" style="margin-top: 20px;" action="<c:url value='/principal/insert'/>" method="post">
                        <div class="row" style="padding-bottom: 30px;">
                            <div class="col-12">
                            	<!-- 이름 -->
                                <div class="input-group" style="margin-bottom: 1rem;">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-success text-white" id="basic-addon1"><i class="ti-user"></i></span>
                                    </div>
                                    <input type="text" name="adminName" id="adminName" class="form-control form-control-lg" placeholder="이름" aria-label="Username" aria-describedby="basic-addon1" onkeyup="noSpace(this);" onchange="noSpace(this);" required>
                                </div>
                                
                                <!-- 이메일 -->
                                <div class="input-group" style="margin-bottom: 1rem;">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-danger text-white" id="basic-addon1"><i class="ti-email"></i></span>
                                    </div>
                                    <input type="text" name="adminEmail" id="adminEmail" class="form-control form-control-lg" placeholder="이메일" aria-label="Username" aria-describedby="basic-addon1" onkeyup="noSpace(this);" onchange="noSpace(this);" required>
                                </div>
                                <div class="web_join_warning_text">
	                   	            <!-- email 중복 체크 -->
									<span class="email_already">해당 이메일이 이미 존재합니다.</span>
									<!-- email 정규식 체크 -->
									<span class="email_validation">이메일 형식대로 입력해주세요.</span>
                                </div>
								
                                <!-- 비밀번호 -->
                                <div class="input-group" style="margin-bottom: 1rem;">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-warning text-white" id="basic-addon2"><i class="ti-pencil"></i></span>
                                    </div>
                                    <input type="password" name="adminPw" id="adminPw" class="form-control form-control-lg" placeholder="비밀번호" aria-label="Password" aria-describedby="basic-addon1" onkeyup="noSpace(this);" onchange="noSpace(this);" required>
                                </div>
                               	<div id="joinstring">
						            <span class="pw_input">비밀번호 조건을 충족해주세요.</span>
					            	<span>● 비밀번호는 8자 이상으로 해주세요.</span><br>
					           		<span>● 영문, 숫자, 특수문자중 2가지 이상 혼합 해주세요.</span>
					           	</div>
					           	
                                <!-- 비밀번호 재확인 -->
                                <div class="input-group" style="margin-bottom: 1rem; margin-top: 1rem;">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-info text-white" id="basic-addon2"><i class="ti-pencil"></i></span>
                                    </div>
                                    <input type="password" name="adminPw_re" id="adminPw_re" class="form-control form-control-lg" placeholder="비밀번호 재확인" aria-label="Password" aria-describedby="basic-addon1" onkeyup="noSpace(this);" onchange="noSpace(this);" required>
                                </div>
                                <div class="web_join_warning_text">
	                            	<span class="pw_re_input_1">비밀번호가 일치합니다.</span>
	       							<span class="pw_re_input_2">비밀번호가 일치하지 않습니다.</span>
                                </div>
       							
                                <!-- 전화번호 -->
                                <div class="input-group" style="margin-bottom: 1rem;">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text text-white" id="basic-addon1" style="background-color: brown;"><i class="fas fa-phone"></i></span>
                                    </div>
                                    <input type="text" name="adminPhone" id="adminPhone" class="form-control form-control-lg" placeholder="('-'없이 번호만 입력)" aria-label="Username" aria-describedby="basic-addon1" oninput="autoHyphen(this)" maxlength="13" required>
                                </div>
                                <div class="web_join_warning_text">
	                               	<span class="phone_already">해당 번호가 이미 존재합니다.</span>
                                </div>                           	
                            </div>
                        </div>
                        <div class="row border-top border-secondary">
                            <div class="col-12">
                                <div class="form-group">
                                    <div style="padding-top: 20px;">
                                        <button id="join_btn" class="btn btn-block btn-lg btn-info" type="submit">회원가입</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
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
		$("#join_btn").click(function() {
					
			if(emailokCheck&&phoneokCheck) {
				$("#join-form").attr("action", "./insert");
				$("#join-form").submit();
				alert("회원가입이 완료되었습니다. 메인 화면으로 이동합니다.");								
			}else{
				alert("기입하신 정보를 확인해주세요.");				
			}
			return false;
		});
	});
	
	// 이메일 중복검사
	$('#adminEmail').on("focusout", function() {
		var email = $('#adminEmail').val(); // adminEmail에 입력되는 값
		var data = {email : email} // 컨트롤에 넘길 데이터 이름 : 데이터(입력값)
				
		$.ajax({
			type : "post",
			url : "<c:url value='/device/userEmailChk'/>",
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
	$('#adminEmail').on("propertychange change keyup paste input", function() {
		var email = $('#adminEmail').val();
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
	$('#adminPw_re').on("propertychange change keyup paste input", function() {
		var pw = $('#adminPw').val();
		var pwchk = $('#adminPw_re').val();
	
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
	$('#adminPw').on("propertychange change keyup paste input", function() {
		var pw = $('#adminPw').val();
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
	$('#adminPhone').on("focusout", function() {
		var phone = $('#adminPhone').val(); // parentEmail_input에 입력되는 값
		var data = {phone : phone} // 컨트롤에 넘길 데이터 이름 : 데이터(입력값)
		
		$.ajax({
			type : "post",
			url : "<c:url value='/device/userPhoneChk'/>",
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
<script src="${pageContext.request.contextPath}/resources/assets/libs/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script>

$('[data-toggle="tooltip"]').tooltip();
$(".preloader").fadeOut();
</script>	
</body>
</html>