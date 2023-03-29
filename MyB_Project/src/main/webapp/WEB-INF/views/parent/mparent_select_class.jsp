<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <title>Document</title>
    <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mobile/mparent_select_class.css" rel="stylesheet"> 
</head>
<body>
	<form action="<c:url value='/parent/mparent_select_class'/>"  method="post">
	    <div id="head_icon"><img src="../resources/images/logo.png"><b> 어린이집 등록</b></div>
		
	    <div id="kindergartenName">
	   		${kindergartenName}
	   		<input type="hidden" name="kindergartenId"  value="${kindergartenId}">
	   		<input type="hidden" name="parentId" value="${parentId}">
	   		
	    </div>
	    
	    <div id="selectclass">
            <select name="classroomId" class="classroomId_input" id="classroomId" style="
	            background: url(../resources/images/arrow.jpg) no-repeat 95% 50%;" required> 
                <option value="">- 반 선택</option>
                <c:forEach var="classroom" items="${classroomList}">
                	<option value="${classroom.classroomId}">${classroom.classroomName}</option>
                </c:forEach>
            </select>
	    </div>
	
	    <hr style="border: solid 2px black; width: 100%;">
	
	    <div id="profileplease">
	        자녀의 프로필을 등록해주세요.
	    </div>
	
	    <div class="infobox">
			<div id="babyinfo">
				<div id="babyiconbox">
		            <div id="babyicon">
		                <img src="../resources/images/babytest.jpg">
		            </div>
	            </div>
	        </div>    
	        <div id="babyinput">
	            <div id="babyname">
	            	<div id="babytext">자녀이름</div> <br>
	                <input type="text" class="childName_input" id="childName" name="childName" placeholder=" 자녀이름" required>
	            </div>
	            <div id="babydate">
	                <div id="babytext">생년월일</div> <br>
	                <input type="date" class="childDate_input" id="childDate" name="childDate" required>
	            </div>
	        </div>
	    </div>
	    
	    <div class="childbox">
	    	<div class="childSex">
	    		<input type="radio" class="childSex_input" id="childSexM" name="childSex" value="M" checked required>
	    		<label for="childSexM" >남아</label>
	    		<input type="radio" class="childSex_input" id="childSexF" name="childSex" value="F">
	    		<label for="childSexF">여아</label>
	    	</div>
	    </div>
	
	    <div id="next">
	        <input type="submit" value="등록하기" onclick="join()">
	    </div>
    </form>
 
 <script type="text/javascript">
 	function join() {
 		var name = $('.childName_input').val();
		var date = $('.childDate_input').val();
		var sex = $('.childSex_input').val();
		var room = $('.classroomId_input').val();
		
		if(name=="" || date=="" || sex=="" || room=="") {
		} else {
			alert("정보 등록을 완료하였습니다.")
		}
		
 	}
 </script>

</body>
</html>