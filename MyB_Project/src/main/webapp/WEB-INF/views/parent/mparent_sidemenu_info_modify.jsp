<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../p_header.jsp"%>     
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
    <link href="${pageContext.request.contextPath}/resources/css/mobile/mparent_sidemenu_info_modify.css" rel="stylesheet">

</head>
<body>
	<div class="title_wrap">
		<div id="title_name" style="font-weight : 700;">내 정보</div>
	</div>
	<div class="info_wrap">
        <form id="update-form" action="<c:url value='/parent/mparent_sidemenu_info_modify'/>" method="post">

			<div class="info-name">이메일</div>
			<input type="email" class="parentEmail_input" name="parentEmail" id="parentEmail" value="${parent.parentEmail}" readonly>
			
			<div class="info-name">비밀번호</div>
            <input type="password" class="parentPw_input" name="parentPw" id="parentPw" value="${parentVO.parentPw}" placeholder="　Password" onkeyup="noSpace(this);" onchange="noSpace(this);" required>
            <div class="info-name"">비밀번호 확인</div>
            <input type="password" class="parentPw_re_input" name="parentPw_re" id="parentPw_re" placeholder="　Password2" onkeyup="noSpace(this);" onchange="noSpace(this);"
            style="margin-bottom:5px;" required>
            <span class="pw_re_input_1">비밀번호가 일치합니다.</span>
            <span class="pw_re_input_2">비밀번호가 일치하지 않습니다.</span>
            <span class="pw_input">비밀번호 조건을 충족해주세요.</span>
            <div id="joinstring">● 비밀번호는 8자리~20자리 이내로 해주세요.<br>
            ● 영문, 숫자, 특수문자중 2가지 이상 혼합 해주세요.</div>
            
            <div class="info-name">이름</div>
            <input type="text" class="parentName_input" name="parentName" id="parentName" value="${parent.parentName}" readonly>
			
			<div class="info-name">핸드폰 번호</div>
			<input type="text" class="parentPhone_input" name="parentPhone" id="parentPhone" value="${parent.parentPhone}" readonly>
			
			<div class="info-name">자녀와의 관계</div>
			<input type="text" class="parentRelation_input" name="parentRelation" id="parentRelation" value="${parent.parentRelation}" readonly>

			<div class="info-name">주소</div>
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

            <input type="button" class="update_btn" value="수정완료">
        </form>
    </div>
    
<script type="text/javascript">

	// 유효성 검사 체크
	var pwchkCheck = false;
	var pwvaliCheck = false;
	
	$(document).ready(function() {	
		$(".update_btn").click(function() {
			
			var city = $('.parentCity_input').val();
			var gu = $('.parentGu_input').val();
			
			if(city=="" || gu=="") {
				alert("정보를 모두 입력해주세요.");
				return false;
			}
			
			if(pwchkCheck&&pwvaliCheck) {
// 				$("#update-form").attr("action", "./mparent_sidemenu_info_modify");
				alert("정보 수정을 완료하였습니다.")
				$("#update-form").submit();
			}
			
			return false;
		});
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