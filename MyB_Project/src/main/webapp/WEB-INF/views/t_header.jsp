<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>header</title>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://kit.fontawesome.com/a566e7b2bd.js"	crossorigin="anonymous"></script>
	<link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_header.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Nanum Gothic'rel='stylesheet'>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
</head>
<body>

	<div class="header_wrap">

		<div id="sidewrap">
			<aside id="sidebar" style="user-select: auto; left: -200px;">
				<button style="margin-top: 16px;">
					<span class="header_menu">☰</span>
				</button>

				<div id="teachername">
					<i class="fa-solid fa-house"></i> <span>${loginUser.teacherName}선생님</span>
				</div>


				<div id="logout">
					<a href='<c:url value="/teacher/mteacher_logout" />'>로그아웃</a>
				</div>

			</aside>
		</div>

		<div id="header_logo">
			<img src="../resources/images/logo.png">
		</div>
		<!-- 알람 메시지 목록 페이지로 이동 -->
		<div id="header_alarm">
			<a href='<c:url value="/teacher/mteacher_alarm"/>'><i id="notbell" class="fa-regular fa-bell"></i></a>
			<a href='<c:url value="/teacher/mteacher_alarm"/>'><i id="bell" class="fa-solid fa-bell" style="color: #f00000; display: none;"></i></a>
			
		</div>
	</div>
	<script>
		$(function() {
			var duration = 200;

			var $side = $('#sidebar');
			var $sidebt = $side.find('button').on('click', function() {
				$side.toggleClass('☰');

				if ($side.hasClass('☰')) {
					$side.stop(true).animate({
						left : '0px'
					}, duration);
					$sidebt.find('span').text('⛌');
				} else {
					$side.stop(true).animate({
						left : '-200px'
					}, duration);
					$sidebt.find('span').text('☰');
				}
				;
			});
		});
		
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
		        	    console.log("new");
		        	} else {
		        	   
		        	    $('#bell').css('display', 'none'); 
		        	    $('#notbell').css('display', 'inline-block');
		        	    console.log("nothing");
		        	}
		            //다음 실행 시간 설정
// 		            setTimeout(checkForNotifications, 5000); // 5초마다 실행
		        },
		        // data 전송 실패 시
		        error: function(jqXHR, textStatus, errorThrown) {
		            console.error('Error checking for notifications:', textStatus, errorThrown);
// 		            setTimeout(checkForNotifications, 5000); // 5초마다 실행
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

</body>
