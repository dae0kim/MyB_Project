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
    <link href="${pageContext.request.contextPath}/resources/css/mobile/mparent_join.css" rel="stylesheet">

</head>
<body>
    
    <div id="head_icon"><img src="../resources/images/logo.png"><b> 회원가입</b></div>


    <div class="join_wrap">
        <form id="login-form" action="<c:url value='/parent/mparent_join'/>" method="post">

	       <input type="email" class="parentEmail_input" name="parentEmail" id="parentEmail" value="${parentVO.parentEmail}" onkeyup="noSpace(this);" onchange="noSpace(this);" placeholder="　Email" required>
            <!-- email 중복 체크 -->
<!-- 			<span class="email_ok">사용 가능한 이메일입니다.</span> -->
			<span class="email_already">해당 이메일이 이미 존재합니다.</span>
			<!-- email 정규식 체크 -->
			<span class="email_validation">이메일 형식대로 입력해주세요.</span>
			

            <input type="password" class="parentPw_input" name="parentPw" id="parentPw" value="${parentVO.parentPw}" placeholder="　Password" onkeyup="noSpace(this);" onchange="noSpace(this);" required>
            <input type="password" class="parentPw_re_input" name="parentPw_re" id="parentPw_re" placeholder="　Password2" onkeyup="noSpace(this);" onchange="noSpace(this);" required>
            <span class="pw_re_input_1">비밀번호가 일치합니다.</span>
            <span class="pw_re_input_2">비밀번호가 일치하지 않습니다.</span>
            <span class="pw_input">비밀번호 조건을 충족해주세요.</span>
            <div id="joinstring">● 비밀번호는 8자리~20자리 이내로 해주세요.<br>
            ● 영문, 숫자, 특수문자중 2가지 이상 혼합 해주세요.</div>
            
            <input type="text" class="parentName_input" name="parentName" id="parentName" value="${parentVO.parentName}" placeholder="　Name" onkeyup="noSpace(this);" onchange="noSpace(this);" required>
            
            <input type="text" class="parentPhone_input" name="parentPhone" id="parentPhone" value="${parentVO.parentPhone}" placeholder="　Phone('-'없이 번호만 입력)" oninput="autoHyphen(this)" maxlength="13" required>
            <span class="phone_already">해당 번호가 이미 존재합니다.</span>
            
            <select name="parentRelation" id="parentRelation" style="
            margin-top: 20px;
            height: 48px;
            width: 85%;
            border: 1px solid #999;
            font-family: inherit;
            background: url(../resources/images/arrow.jpg) no-repeat 95% 50%;
            border-radius: 6px;" 
            class="parentRelation_input"
            required>
                <option value="">- 자녀와의 관계</option>
                <option value="엄마">엄마</option>
                <option value="아빠">아빠</option>
            </select>

            <div id="address">
               <select name="parentCity" id="parentCity" style="background: url(../resources/images/arrow.jpg) no-repeat 95% 50%;" class="parentCity_input" onChange="chnGu(this.value)" required>
                   <option value="">- 시 선택</option>
                   <option value="서울특별시">서울특별시</option>
                   <option value="부산광역시">부산광역시</option>
                   <option value="광주광역시">광주광역시</option>
               </select>
               <br>
               <select name="parentGu" id="parentGu" style="background: url(../resources/images/arrow.jpg) no-repeat 95% 50%;" display:none; class="parentGu_input" required>
					<option value="">- 구 선택</option>
               </select>
           </div>

            <input type="button" class="join_btn" value="Join">
        </form>
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
			
			var name = $('.parentName_input').val();
			var relation = $('.parentRelation_input').val();
			var city = $('.parentCity_input').val();
			var gu = $('.parentGu_input').val();
			
			if(name=="" || relation=="" || city=="" || gu=="") {
				alert("정보를 모두 입력해주세요.");
				return false;
			}
			
			if(emailokCheck&&emailvalCheck&&pwchkCheck&&pwvaliCheck&&phoneokCheck) {
				$("#login-form").attr("action", "./mparent_join");
				$("#login-form").submit();
			}
			
			return false;
		});
	});
	
	// 이메일 중복검사
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
	$('.parentEmail_input').on("propertychange change keyup paste input", function() {
		var email = $('.parentEmail_input').val();
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
	$('.parentPw_re_input').on("propertychange change keyup paste input", function() {
		var pw = $('.parentPw_input').val();
		var pwchk = $('.parentPw_re_input').val();
	
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
	$('.parentPw_input').on("propertychange change keyup paste input", function() {
		var pw = $('.parentPw_input').val();
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
	$('.parentPhone_input').on("propertychange change keyup paste input", function() {
		var parentPhone = $('.parentPhone_input').val(); // parentEmail_input에 입력되는 값
		var data = {parentPhone : parentPhone} // 컨트롤에 넘길 데이터 이름 : 데이터(입력값)
		
		$.ajax({
			type : "post",
			url : "./parentPhoneChk",
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
	
	// 시 >> 구 선택
	function chnGu(type, select) {
		$('#parentGu').empty();
		
		if(type == '서울특별시') {
			$('#parentGu').append("<option value=''>- 구 선택</option>'");
			$('#parentGu').append("<option value='강남구'>강남구</option>'");
			$('#parentGu').append("<option value='강동구'>강동구</option>'");
			$('#parentGu').append("<option value='강북구'>강북구</option>'");
			$('#parentGu').append("<option value='강서구'>강서구</option>'");
			$('#parentGu').append("<option value='관악구'>관악구</option>'");
			$('#parentGu').append("<option value='광진구'>광진구</option>'");
			$('#parentGu').append("<option value='구로구'>구로구</option>'");
			$('#parentGu').append("<option value='금천구'>금천구</option>'");
			$('#parentGu').append("<option value='노원구'>노원구</option>'");
			$('#parentGu').append("<option value='도봉구'>도봉구</option>'");
			$('#parentGu').append("<option value='동대문구'>동대문구</option>'");
			$('#parentGu').append("<option value='동작구'>동작구</option>'");
			$('#parentGu').append("<option value='마포구'>마포구</option>'");
			$('#parentGu').append("<option value='서대문구'>서대문구</option>'");
			$('#parentGu').append("<option value='서초구'>서초구</option>'");
			$('#parentGu').append("<option value='성동구'>성동구</option>'");
			$('#parentGu').append("<option value='성북구'>성북구</option>'");
			$('#parentGu').append("<option value='송파구'>송파구</option>'");
			$('#parentGu').append("<option value='양천구'>양천구</option>'");
			$('#parentGu').append("<option value='영등포구'>영등포구</option>'");
			$('#parentGu').append("<option value='용산구'>용산구</option>'");
			$('#parentGu').append("<option value='은평구'>은평구</option>'");
			$('#parentGu').append("<option value='종로구'>종로구</option>'");
			$('#parentGu').append("<option value='중구'>중구</option>'");
			$('#parentGu').append("<option value='중랑구'>중랑구</option>'");
		} else {
			$('#parentGu').append("<option value=''>- 구 선택</option>'");
		}
		
		document.getElementById("parentGu").style.display = "";
		
		if ($.trim(select) != "") {
		        $('#parentCity').val(type);
		        $('#parentGu').val(select);
		}
	}
	
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