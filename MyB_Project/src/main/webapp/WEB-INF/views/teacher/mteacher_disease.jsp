<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../t_header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyB</title>
<link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_disease.css" rel="stylesheet">
</head>
<body>
<div class="wrap">
<form id="diseaselog-form" action="<c:url value='/teacher/mteacher_disease'/>" method="post">
	<div class="title_wrap">
		<div id="title_name" style="font-weight: 700;">원생 질병관리</div>
		<input type='submit' value='제출하기'>
	</div>
	<div id="subtitle">현재 담당하는 반은 : [${teacherclass.classroomName }] 입니다.</div>
	
	<div class="diseaselog">
		
			<input type="hidden" id="teacherclass" name="classroomId" value="${teacherclass.classroomId}">
			<input type="hidden" id="kindergarten" name="kindergartenId" value="${kindergarten.kindergartenId}">
			<input type="hidden" id="kindergarten" name="kindergartenCity" value="${kindergarten.kindergartenCity}">
			<input type="hidden" id="kindergarten" name="kindergartenGu" value="${kindergarten.kindergartenGu}">
			
			
			
			<c:forEach items="${getChildNameList }" var="getChildNameList" varStatus="status">
				<div id="diseaseform">
				
				
					<div id="childname">${getChildNameList.childName}</div>
					<input type="hidden" id="childId" name="childId[]" value="${getChildNameList.childId}">
					
					
					<div id="selectstat">
					    <label><input type="radio" name="roll_info_${status.count}" value="결석"><span>결석</span></label>
					    <label><input type="radio" name="roll_info_${status.count}" value="조퇴"><span>조퇴</span></label>
					</div>

			 		
 				<select id="diseaseList" name="diseaseId[]">							
						<c:forEach items="${diseaseList}" var="diseaseList"	varStatus="status1">
									<option value="${diseaseList.diseaseId }" 
									<c:if test ="${diseaseList.diseaseId eq diseaselogetcvo[status.index].diseaseId}">selected="selected"</c:if>>
									${diseaseList.diseaseName}
									</option>
						</c:forEach>			
				</select> 
				
						
						
				</div>
			</c:forEach>
			</div>
			</form>
			</div>
			
			
</body>

<%@include file="../t_footer.jsp"%>
</html>
