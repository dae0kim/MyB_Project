<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <title>Document</title>
    <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mobile/mparent_select_class.css" rel="stylesheet"> 
</head>
<body>
<div class="border">
	<form action="<c:url value='/parent/mparent_select_class'/>"  method="post">
		<div class="headgrid">
			<div id="login_logo"><img src="${pageContext.request.contextPath}/resources/images/logo.png"></div>	
			<div id="textlow1"><b>어린이집 등록</b></div>
		</div>
		
		
	    <div id="kindergartenName">
	    	<img id="kindergartenimg" src="${pageContext.request.contextPath}/resources/images/mobile/mparent_selectkinder.png">
	   		<div id="kindername">${kindergartenName}</div>
	   		<input type="hidden" name="kindergartenId"  value="${kindergartenId}">
	   		<input type="hidden" name="parentId" value="${parentId}">
	   		
	    </div>
	    
	    <div id="selectclass">
            <select name="classroomId" class="classroomId_input" id="classroomId" required> 
                <option value="">반 선택</option>
                <c:forEach var="classroom" items="${classroomList}">
                	<option value="${classroom.classroomId}">${classroom.classroomName}</option>
                </c:forEach>
            </select>
	    </div>
	
	    <hr>
	
	    <div id="profileplease">
	        자녀의 프로필을 등록해주세요.
	    </div>
	
	    <div class="infobox">
			<div id="babyinfo">
				<div id="babyiconbox">
		            <div id="babyicon">
		                <img src="${pageContext.request.contextPath}/resources/images/mobile/babyselect.png">
		            </div>
	            </div>
	        </div>    
	        <div id="babyinput">
	            <div id="babyname">
	            	<div id="babytext">자녀이름</div> <br>
	                <input type="text" class="childName_input" id="childName" name="childName" required>
	            </div>
	            <div id="babydate">
	                <div id="babytext">생년월일</div> <br>
	            	<input type="text" class="childDate_input" name="childDate" id="childDate" required>
	            </div>
	        </div>
	    </div>
	    
	    <div class="childbox">
	    	<div class="childSex">
	    		<input type="radio" class="childSex_input" id="childSexM" name="childSex" value="M" checked required>
	    		<label for="childSexM" ><div id="gggg">남아</div></label>
	    		<input type="radio" class="childSex_input" id="childSexF" name="childSex" value="F">
	    		<label for="childSexF"><div id="gggg">여아</div></label>
	    	</div>
	    </div>
	
	    <div id="next">
	        <input type="submit" value="등록하기" onclick="join()">
	    </div>
    </form>
    </div>
 
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
 	
 	// DatePicker
	$(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#childDate" ).datepicker({
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