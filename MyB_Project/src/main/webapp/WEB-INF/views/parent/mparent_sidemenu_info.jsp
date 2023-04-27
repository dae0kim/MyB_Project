<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../p_header2.jsp"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MyB</title>
    <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mobile/mparent_sidemenu_info.css" rel="stylesheet">

</head>
<body>
<div class="wrapper">
	<div class="title_wrap">
		<div id="title_name" style="font-weight : 700;">내 정보</div>
		<input type="button" onClick="location.href='./mparent_sidemenu_info_modify'" value="수정하기">	
	</div>

    <div class="info_wrap">
    	<div id="info-form">
    		<div class="info-name">이메일</div>
			<input type="email" class="parentEmail_input" name="parentEmail" id="parentEmail" value="${parent.parentEmail}" readonly>
			
			<div class="info-name">이름</div>
			<input type="text" class="parentName_input" name="parentName" id="parentName" value="${parent.parentName}" readonly>
			
			<div class="info-name">핸드폰 번호</div>
			<input type="text" class="parentPhone_input" name="parentPhone" id="parentPhone" value="${parent.parentPhone}" readonly>
			
			<div class="info-name">자녀와의 관계</div>
			<input type="text" class="parentRelation_input" name="parentRelation" id="parentRelation" value="${parent.parentRelation}" readonly>
			
			<div class="info-name">주소</div>
			<input type="text" class="parentAddress_input" name="parentAddress" id="parentAddress" value="${parent.parentCity} ${parent.parentGu}" readonly>
        </div>
    </div>
    </div>
</body>
</html>

<%@include file="../p_footer.jsp"%>