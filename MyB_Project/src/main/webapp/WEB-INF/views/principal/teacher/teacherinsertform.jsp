<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<%@include file="../staticFiles.jsp" %>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<%@include file="../header.jsp" %>
	<div id="join_body">
	<div class="join_wrap">
	<div id="jb-content">
	<form id="join-form" action="<c:url value='/teacher/insert'/>" method="post">
		<div class="join_form_text">
         <span>이름</span>
        </div>
        <input type="text" name="teacherName" placeholder=" 이름" required>

		<div class="join_form_text">
         <span>교사 계정 아이디</span>
        </div>
		<input type="email" class="teacherEmail_input" name="teacherEmail" id="teacherEmail" value="${teacherVO.teacherEmail}"onkeyup="noSpace(this);" onchange="noSpace(this);" placeholder="　Email" required>
		<!-- email 중복 체크 -->
		<!-- 			<span class="email_ok">사용 가능한 이메일입니다.</span> -->
		<span class="email_already">해당 이메일이 이미 존재합니다.</span>
		<!-- email 정규식 체크 -->
		<span class="email_validation">이메일 형식대로 입력해주세요.</span>
		
		<div class="join_form_text">
         <span>교사 계정 비밀번호</span>
        </div>
        <input type="text" name="teacherPw" placeholder=" 비밀번호" required>

		<div class="join_form_text">
         <span>전화번호</span>
        </div>
        <input type="text" class="teacherPhone_input" name="teacherPhone" id="teacherPhone" value="${teacherVO.teacherPhone}" placeholder="　('-'없이 번호만 입력)" oninput="autoHyphen(this)" maxlength="13" required>
        <span class="phone_already">해당 번호가 이미 존재합니다.</span>
        
        
        <div class="join_form_text">
         <span>담당 교실</span>
        </div>

		<input type="hidden" name="adminId" value="${loginUser.adminId}">

        <select name="classroomId">
        	<c:forEach var="classroomList" items="${classroomList}" >
        		<option value="${classroomList.classroomId}">${classroomList.classroomName}</option>
        	</c:forEach>
        </select>
		
		<input type="hidden" name="kindergartenId" value="${kindergartenId}">
        
        <input type="submit" class="join_btn" value="등록하기" >
	</form>
	</div>
	</div>
	</div>
<%@include file="../footer.jsp" %>
<script type="text/javascript">

	// 유효성 검사 체크
	var emailokCheck = false;
	var emailvalCheck =false;
	var phoneokCheck = false;
	
	$(document).ready(function() {	
		$(".join_btn").click(function() {
			
			if(emailokCheck&&emailvalCheck&&phoneokCheck) {
				$("#login-form").attr("action", "././insert");
				$("#login-form").submit();
			}
			alert("기입하신 정보를 확인해주세요.");
			return false;
		});
	});
	
	// 이메일 중복검사
	$('.teacherEmail_input').on("propertychange change keyup paste input", function() {
		var teacherEmail = $('.teacherEmail_input').val(); // teacherEmail_input에 입력되는 값
		var data = {teacherEmail : teacherEmail} // 컨트롤에 넘길 데이터 이름 : 데이터(입력값)
		
		$.ajax({
			type : "post",
			url : "././teacherEmailChk",
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
	$('.teacherEmail_input').on("propertychange change keyup paste input", function() {
		var email = $('.teacherEmail_input').val();
		var reg = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
		
		if(email.match(reg) == null) { // 조건 불충족
			$('.email_validation').css('display', 'block');
			emailvalCheck = false;
		} else {
			$('.email_validation').css('display', 'none');
			emailvalCheck = true;
		}
	});
	
	// 휴대폰 번호 하이픈 자동추가
	const autoHyphen = (target) => {
		 target.value = target.value
		 .replace(/[^0-9]/g, '')
		 .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
	
	// 휴대폰 번호 중복검사
	$('.teacherPhone_input').on("propertychange change keyup paste input", function() {
		var teacherPhone = $('.teacherPhone_input').val(); // parentEmail_input에 입력되는 값
		var data = {teacherPhone : teacherPhone} // 컨트롤에 넘길 데이터 이름 : 데이터(입력값)
		
		$.ajax({
			type : "post",
			url : "././teacherPhoneChk",
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