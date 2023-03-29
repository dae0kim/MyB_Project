<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<%@include file="../staticFiles.jsp" %>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<%@include file="../header.jsp" %>
	<form action="<c:url value='/kindergarten/insert'/>" method="post" enctype="multipart/form-data">
		<div class="join_form_text">
         <span>어린이집 이름</span>
        </div>
        <input type="text" name="kindergartenName" placeholder=" 어린이집 이름" required>
		
		<div class="join_form_text">
         <span>어린이집 전화번호</span>
        </div>
        <input type="tel" name="kindergartenPhone" placeholder="　어린이집 전화번호" required>
		
		<div class="join_form_text">
         <span>어린이집 주소</span>
        </div>
        <input type="text" id="sample6_postcode" placeholder=" 우편번호" readonly>
		<input type="button" onclick="sample6_execDaumPostcode()" value=" 우편번호 찾기"><br>
		<input type="text" id="sample6_address" name="kindergartenAddress" placeholder=" 주소" readonly><br>
		<input type="text" id="sample6_detailAddress" placeholder=" 상세주소">
		<input type="text" id="sample6_extraAddress" placeholder=" 참고항목" readonly>
		<input type="hidden" id="addr_city" name="kindergartenCity" value="">
		<input type="hidden" id="addr_gu" name="kindergartenGu" value="">
		<input type="hidden" name="adminId" value="${loginUser.adminId}">

		<div class="join_form_text">
         <span>증명 서류</span><br>
         <p>*모든 서류를 하나의 압축파일로 만들어 업로드 하세요.</p>
        </div>
        <input type="file" name="file" accept=".zip" required>
        
        <input type="submit" value="등록 요청하기" onclick="return addrSplit()">
	</form>
<%@include file="../footer.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    function addrSplit(){
    	// 전체 주소
    	var addr = $('#sample6_address').val();
    	// 문자열 분리
    	var splits = addr.split(' ',2);
    	// hidden에 값 전달
    	$('#addr_city').attr('value',splits[0]);
    	$('#addr_gu').attr('value',splits[1]);	
    }
    
</script>
</body>
</html>