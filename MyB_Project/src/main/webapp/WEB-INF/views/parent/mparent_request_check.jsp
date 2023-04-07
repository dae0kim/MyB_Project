<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../p_header2.jsp"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <title>request</title>
    <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mobile/mparent_request_check.css" rel="stylesheet">    
</head>
<body style="font-family: Nanum Gothic">
<div class="wrapper">
	<form action="<c:url value='/parent/mparent_request_check'/>" method="post">
	    <div class="title_wrap">
			<div id="title_name" style="font-weight : 700;">요청사항 확인</div>
			<input type="submit" value="확인하기">	
		</div>
		
	    <div class="request_wrap">
	    	<div id="request-form">
	    		<div class="request-name">해당하는 자녀를 선택해주세요.</div>
	    		<select name="childId" class="childId_input" id="childId" " required> 
	                <option value="">자녀 선택</option>
	                <c:forEach var="child" items="${childList}">
	                	<option value="${child.childId}">${child.childName}</option>
	                </c:forEach>
	            </select>
	            
	            <input type="hidden" name="classroomId" value="">
	            <input type="hidden" name="kindergartenId" value="">
	            <input type="hidden" name="parentId" value="${parentId}">
	    	
	    		<div class="request-name">요청날짜를 선택해주세요.</div>
				<input type="text" name="requestDate" id="requestDate" required>
				
				</div>
				
				
				<div class="request-name">요청사항을 확인해주세요.</div>
				
				<div id = "reqcheck">
				<input type="text" class="requestContent1_input" name="requestContent1" value="${requestVO.requestContent1}" readonly>
				<input type="checkbox" name="requestStat1" <c:if test="${requestVO.requestStat1 eq 'Y'}">checked</c:if> onClick="return false;">
				</div>
				
				<div id = "reqcheck">
				<input type="text" class="requestContent2_input" name="requestContent2" value="${requestVO.requestContent2}" readonly>
				<input type="checkbox" name="requestStat2" <c:if test="${requestVO.requestStat2 eq 'Y'}">checked</c:if> onClick="return false;">
				</div>
				
				<div id = "reqcheck">
				<input type="text" class="requestContent3_input" name="requestContent3" value="${requestVO.requestContent3}" readonly>
				<input type="checkbox" name="requestStat3" <c:if test="${requestVO.requestStat3 eq 'Y'}">checked</c:if> onClick="return false;">
				</div>
				
				<div id = "reqcheck">
				<input type="text" class="requestContent4_input" name="requestContent4" value="${requestVO.requestContent4}" readonly>
				<input type="checkbox" name="requestStat4" <c:if test="${requestVO.requestStat4 eq 'Y'}">checked</c:if> onClick="return false;">
				</div>
				
				<div id = "reqcheck">
				<input type="text" class="requestContent5_input" name="requestContent5" value="${requestVO.requestContent5}" readonly>
	        	<input type="checkbox" name="requestStat5" <c:if test="${requestVO.requestStat5 eq 'Y'}">checked</c:if> onClick="return false;">
	        	</div>
	        	
	        	<div>
	        	<div id="teachercomment">담당 교사의 코멘트를 확인해주세요.</div>
		        
		            <div id="comment">
				        <div class="text">
				            ${requestVO.requestComment}
				        </div>
   				  </div>
		            
	        </div>
	    </div>
    </form>
</div>
<script type="text/javascript">
	$('.childId_input').on("propertychange change keyup paste input", function() {
		var childId = $('.childId_input').val(); // childId_input에 입력되는 값
		var data = {childId : childId} // 컨트롤에 넘길 데이터 이름 : 데이터(입력값)
		
		$.ajax({
			type : "POST",
			url : "./childIdChk",
			data : data,
			success : function(data) {
					
					var classroomId = data.classroomId;
					var kindergartenId = data.kindergartenId;
					$('input[name=classroomId]').attr('value', classroomId);
					$('input[name=kindergartenId]').attr('value', kindergartenId);
	
			}
		});
	});
	
	// DatePicker
	$(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#requestDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy/mm/dd"
 
            });
	});
</script>
</body>
</html>

<%@include file="../p_footer.jsp"%>