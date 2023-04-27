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
    <title>MyB</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/mparent_sidemenu_qnawrite.css">
   	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>    
</head>
<body>
	<form action="<c:url value='/parent/mparent_sidemenu_qnawrite'/>" method="post">
	<div class="wrap">
	    <div class="title_wrap">
			<div id="title_name" style="font-weight : 700;">1:1 문의</div>
			<input type="submit" value="작성완료" onclick="insertComplain()">	
		</div>
		<div id="subtitle">어린이집에 대한 문의 및 불편사항을 적어주세요.</div>
		
	    <div class="sidemenuqna_wrap">
	        <div class="sidemenuqnacontent_wrap">
	            <div>
	            	<div class="request-name">해당하는 자녀를 선택해주세요.</div>
			    		<select name="childId" class="childId_input" id="childId" required> 
			                <option value="">- 자녀 선택</option>
			                <c:forEach var="child" items="${childList}">
			                	<option value="${child.childId}">${child.childName}</option>
			                </c:forEach>
			            </select>	

	                    <input type="hidden" value="${parentEmail}">
	                	<input type="hidden" name="parentId" value="${parent.parentId}">

	                <div id="title">
	                    <div class="request-name">제목</div>
	                    <input type="text" name="complainTitle" class="complainTitle_input" maxlength="50" placeholder="글 제목" required>
	                </div>
	                <div>
						<div class="request-name">내용</div>
	                    <textarea rows="10" cols="40" maxlength="500" name="complainContent" class="complainContent_input" required></textarea>
	                </div>
	            </div>
	        </div>
	    </div>
	    </div>
    </form>
    
 <script type="text/javascript">
 	function insertComplain() {
 		var childid = $('.childId_input').val();
		var complainTitle = $('.complainTitle_input').val();
		var complainContent = $('.complainContent_input').val();
		
		if(childid=="" || complainTitle=="" || complainContent=="") {
		} else {
			alert("1:1 문의 등록을 완료하였습니다.")
		}
 	}
 </script>    
</body>
</html>
<%@include file="../p_footer.jsp"%>