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
		<div id="header_alarm">
			<a href="알람 링크"><i class="fa-regular fa-bell"></i></a>
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
	</script>

</body>
