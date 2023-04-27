<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../p_header2.jsp"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <title>MyB</title>
    <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mobile/mparent_request.css" rel="stylesheet">    
</head>

<body style="font-family: Nanum Gothic">
	<div class="wrapper">
	<form action="<c:url value='/parent/mparent_request'/>" method="post">
	    <div class="title_wrap">
			<div id="title_name" style="font-weight : 700;">요청사항 작성</div>
			<input type="submit" value="작성하기">	
		</div>
		
	    <div class="request_wrap">
	    	<div id="request-form">
	    		<div class="request-name">해당하는 자녀를 선택해주세요.</div>
	    		<select name="childId" class="childId_input" id="childId" required> 
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
				
				<div class="request-name">요청사항을 등록해주세요.</div>
				<input type="text" class="requestContent1_input" name="requestContent1" id="requestContent1">
				<input type="text" class="requestContent2_input" name="requestContent2" id="requestContent2">
				<input type="text" class="requestContent3_input" name="requestContent3" id="requestContent3">
				<input type="text" class="requestContent4_input" name="requestContent4" id="requestContent4">
				<input type="text" class="requestContent5_input" name="requestContent5" id="requestContent5">
	        	<input type="hidden" name="requestId" value="">
	        </div>
	    </div>
    </form>
   </div>

<script type="text/javascript">
	// childId값에 따라 해당 자녀의 classroomId, kindergartenId 불러오기
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
	
	// 요청사항 불러오기
	$('#childId, #requestDate').on('change', function() {
		var childId = $('#childId').val();
		var requestDate = $('#requestDate').val();
		var data = {childId: childId, requestDate: requestDate};
		
		resetRequest();
		
		$.ajax({
			type: "POST",
			url: '${pageContext.request.contextPath}/parent/getRequestByChildnDate',
			data: data,
			success: function(data) {
				
				var requestContent1 = data.requestContent1;
				var requestContent2 = data.requestContent2;
				var requestContent3 = data.requestContent3;
				var requestContent4 = data.requestContent4;
				var requestContent5 = data.requestContent5;
				var requestId = data.requestId;
				
				if(!requestId){
			        $('input[name=requestId]').attr("disabled", true);
			        return false;
			    }else{
			        $('input[name=requestId]').attr("disabled", false);
			        $('input[name=requestId]').attr('value', requestId);
			    }
				
				var requestStat1 = data.requestStat1;
			    var requestStat2 = data.requestStat2;
			    var requestStat3 = data.requestStat3;
			    var requestStat4 = data.requestStat4;
			    var requestStat5 = data.requestStat5;

				$('input[name=requestContent1]').attr('value', requestContent1).prop('readonly', requestStat1 === 'Y').click(function(){showAlertIfCompleted(requestStat1);});
				$('input[name=requestContent2]').attr('value', requestContent2).prop('readonly', requestStat2 === 'Y').click(function(){showAlertIfCompleted(requestStat2);});
				$('input[name=requestContent3]').attr('value', requestContent3).prop('readonly', requestStat3 === 'Y').click(function(){showAlertIfCompleted(requestStat3);});
				$('input[name=requestContent4]').attr('value', requestContent4).prop('readonly', requestStat4 === 'Y').click(function(){showAlertIfCompleted(requestStat4);});
				$('input[name=requestContent5]').attr('value', requestContent5).prop('readonly', requestStat5 === 'Y').click(function(){showAlertIfCompleted(requestStat5);});
				
			}
		});
	});
	
	// 요청사항 리셋
	function resetRequest() {
		
		$('input[name=requestContent1]').attr('value', '').prop('readonly', false).off('click');
		$('input[name=requestContent2]').attr('value', '').prop('readonly', false).off('click');
		$('input[name=requestContent3]').attr('value', '').prop('readonly', false).off('click');
		$('input[name=requestContent4]').attr('value', '').prop('readonly', false).off('click');
		$('input[name=requestContent5]').attr('value', '').prop('readonly', false).off('click');
		$('input[name=requestId]').attr('value', '').prop('readonly', false).off('click');
	}
	
	function showAlertIfCompleted(requestStat) {
	    if (requestStat === 'Y') {
	        alert('조치가 완료된 요청사항입니다.');
	    }
	}
</script>
</body>
</html>

<%@include file="../p_footer.jsp"%>