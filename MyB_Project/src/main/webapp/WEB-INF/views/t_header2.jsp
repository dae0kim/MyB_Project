<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>MyB</title>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://kit.fontawesome.com/a566e7b2bd.js"	crossorigin="anonymous"></script>
	<link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_header2.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Nanum Gothic'rel='stylesheet'>
		<script>
		
		window.onload = function checkForNotifications() {
		    $.ajax({
		        url: '${pageContext.request.contextPath}/checkteacheralarm',
		        type: 'GET',
		        dataType: 'json',
		        success: function(data) {
		        	if (data.hasNewTeacherAlarm) {
		        		//새로운 알림이 있으면 빨간색으로 변경
		        	   
		        		$('#bell').css('display', 'inline-block');
		        	    $('#notbell').css('display', 'none');
		        	} else {
		        	   
		        	    $('#bell').css('display', 'none'); 
		        	    $('#notbell').css('display', 'inline-block');
		        	}
		        },
		        // data 전송 실패 시
		        error: function(jqXHR, textStatus, errorThrown) {
		            console.error('Error checking for notifications:', textStatus, errorThrown);
		        }
		    });
		}
		
		

		$(document).on('click', '#header_alarm', function() {
		    $.ajax({
		        url: '${pageContext.request.contextPath}/updateteacheralarm',
		        type: 'POST',
		        data: {teacherId: '${teacherId}'},
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
	
</head>
<body>
<div class="pheader">

	<div class="header_wrap">
		<div id="login_logo">
			<img src="${pageContext.request.contextPath}/resources/images/logo.png">
		</div>
		
		<div id="maintitle">
			MyB
		</div>
			
		<div id="textlow1">
			<a href='<c:url value="/teacher/mteacher_alarm"/>'><i id="notbell" class="fa-regular fa-bell" style="color: #000000;"></i></a>
			<a href='<c:url value="/teacher/mteacher_alarm"/>'><i id="bell" class="fa-solid fa-bell" style="color: #f00000; display: none;"></i></a>
		</div>
			
	</div>
</div>


		


</body>



