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
	<link href="${pageContext.request.contextPath}/resources/css/mobile/mparent_header2.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Nanum Gothic'rel='stylesheet'>
		<script>
		
		function checkForNotifications() {
		    $.ajax({
		        url: '${pageContext.request.contextPath}/checkalarm',
		        type: 'GET',
		        dataType: 'json',
		        success: function(data) {
		        	if (data.hasNewAlarm) {
		        		//새로운 알림이 있으면 빨간색으로 변경
		        	   
		        	    $('#header_alarm i').css('color', 'red'); 
		        	    console.log("new");
		        	} else {
		        	   
		        	    $('#header_alarm i').css('color', 'black'); 
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
		
		

		$(document).on('click', '#header_alarm', function() {
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
	
</head>
<body>
<div class="pheader">

	<div class="header_wrap">
		<div id="login_logo"><img src="../resources/images/logo.png" style="width: 35px; height: 30px;">MyB</div>
			
		<div id="textlow1">
		<a href='<c:url value="/parent/mparent_alarm"/>'><i class="fa-regular fa-bell"></i></a>
		</div>
			
	</div>
</div>


		


</body>



