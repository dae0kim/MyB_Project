<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>header</title>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://kit.fontawesome.com/a566e7b2bd.js"	crossorigin="anonymous"></script>
	<link href="${pageContext.request.contextPath}/resources/css/mobile/mparent_header.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Nanum Gothic'rel='stylesheet'>
</head>
<body>
<div class="pheader">

	<div class="header_wrap">
		<div id="login_logo"><img src="../resources/images/logo.png" style="height: 30px;">MyB</div>
			
		<div id="textlow1">
			<a href='<c:url value="/parent/mparent_alarm"/>'><i class="fa-regular fa-bell"></i></a>
		</div>
			
		<div id="textlow2">		      
	            ${childName}<br>
	            ${kindergartenName}<br>
	            ${classroomName}
	   </div>
	   
	   <div id="textlow3">
	   		<img src="../resources/images/images/mobile/mparent_family.png" style="width: 8em;">
	   </div>
	</div>
</div>
	
<%-- 		<div id="11">
			<img src="../resources/images/logo.png" style="width: 35px; height: 35px;">
		</div>
		
		<div id="21">
			<a href='<c:url value="/parent/mparent_alarm"/>'><i class="fa-regular fa-bell"></i></a>
		</div>
		
		<div id="22">
		    <div id="child_name">   
	            ${childName}
	        </div>
	        <div id="kindergarten_name">
	            ${kindergartenName}
	        </div>
	        <div id="kindergarten_class">
	             ${classroomName}
	        </div>
		</div> --%>
		

	<script>
		
		function checkForNotifications() {
		    $.ajax({
		        url: '${pageContext.request.contextPath}/checkalarm',
		        type: 'GET',
		        dataType: 'json',
		        success: function(data) {
		        	if (data.hasNewAlarm) {
		        		//새로운 알림이 있으면 빨간색으로 변경
		        	   
		        	    $('#textlow1 i').css('color', 'red'); 
		        	    console.log("new");
		        	} else {
		        	   
		        	    $('#textlow1 i').css('color', 'black'); 
		        	    console.log("nothing");
		        	}
		            //다음 실행 시간 설정
		            setTimeout(checkForNotifications, 5000); // 5초마다 실행
		        },
		        // data 전송 실패 시
		        error: function(jqXHR, textStatus, errorThrown) {
		            console.error('Error checking for notifications:', textStatus, errorThrown);
		            setTimeout(checkForNotifications, 5000); // 5초마다 실행
		        }
		    });
		}
		
		

		$(document).on('click', '#textlow1', function() {
		    $.ajax({
		        url: '${pageContext.request.contextPath}/updatealarm',
		        type: 'POST',
		        data: {parentId: '${parentId}'},
		        success: function() {
		            console.log("Alarm update successful");
		           
		        },
		        error: function(jqXHR, textStatus, errorThrown) {
		            console.error('Error updating alarm:', textStatus, errorThrown);
		        }
		    });
		});
		// Start checking for notifications
		checkForNotifications();
		
		
	</script>

</body>






		<%-- <div id="sidewrap">
			<aside id="sidebar" style="user-select: auto; left: -200px;">
				<button style="margin-top: 16px;">
					<span class="header_menu">☰</span>
				</button>

				<div id="teachername">
					<i class="fa-solid fa-house"></i> <span>${childName} ${parentRelation}</span>
				</div>

				<div id="menulist">
					<div class="menu">
						<a href='<c:url value="/parent/mparent_select_kinder_mypage"/>'>자녀 등록</a>
					</div>
					<div class="menu">
						<a href='<c:url value="/parent/mparent_sidemenu_info"/>'>내 정보</a>
					</div>
					<div class="menu">
						<a href='<c:url value="/parent/mparent_sidemenu_qna"/>'>1:1 문의</a>
					</div>
				</div>
				
				<div id="logout">
					<a href='<c:url value="/parent/mparent_logout"/>'>로그아웃</a>
				</div> --%>
