<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../t_header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/resources/css/mobile/reset.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_requset_check.css"
	rel="stylesheet">
</head>
<body>
<div class="wrapper">
	<form id="request-form" action="<c:url value='/teacher/mteacher_requset_check'/>" method="POST">
		<div class="title_wrap">
			<div id="title_name" style="font-weight: 700;">요청사항 상세</div>
			<input type='submit' value='제출하기'>
		</div>
		
		<div class="request_wrap">

				<input type="hidden" id="requestId" name="requestId" value="${getCheckDetail.requestId}">
				<input type="hidden" id="childId" name="childId" value="${getCheckDetail.childId}">
				<input type="hidden" id="parentId" name="parentId" value="${parentId}">
	
			<div id = "reqcheck">
				<input type="text" class="requestContent1_input" name="requestContent1" value="${getCheckDetail.requestContent1}" readonly>
				<input type="checkbox" name="requestStat1" <c:if test="${getCheckDetail.requestStat1 eq 'Y'}">checked</c:if>>
			</div>
			
			<div id = "reqcheck">
				<input type="text" class="requestContent2_input" name="requestContent1" value="${getCheckDetail.requestContent2}" readonly>
				<input type="checkbox" name="requestStat2" <c:if test="${getCheckDetail.requestStat2 eq 'Y'}">checked</c:if>>
			</div>
			
			<div id = "reqcheck">
				<input type="text" class="requestContent3_input" name="requestContent1" value="${getCheckDetail.requestContent3}" readonly>
				<input type="checkbox" name="requestStat3" <c:if test="${getCheckDetail.requestStat3 eq 'Y'}">checked</c:if>>
			</div>
			
			<div id = "reqcheck">
				<input type="text" class="requestContent4_input" name="requestContent1" value="${getCheckDetail.requestContent4}" readonly>
				<input type="checkbox" name="requestStat4" <c:if test="${getCheckDetail.requestStat4 eq 'Y'}">checked</c:if>>
			</div>
			
			<div id = "reqcheck">
				<input type="text" class="requestContent5_input" name="requestContent1" value="${getCheckDetail.requestContent5}" readonly>
				<input type="checkbox" name="requestStat5" <c:if test="${getCheckDetail.requestStat5 eq 'Y'}">checked</c:if>>
			</div>
	
			<input type="hidden" id="requestvo" name="requestvo" value="${getCheckDetail.requestId}">
			<input type="hidden" id="requestvo" name="requestId" value="${requestId}">
			
			<div id="comment">
		      <TEXTAREA NAME = "requestComment"  ROWS = "5"  COLS = "25" >${getCheckDetail.requestComment }</TEXTAREA>
		  	</div>
		</div>	
</form>
</div>

<script>
$("input:checkbox").change(function() {
	if(this.checked) {
	$(this).attr('value','Y');
	}
	});

</script>
	
</body>
<%@include file="../t_footer.jsp"%>
</html>