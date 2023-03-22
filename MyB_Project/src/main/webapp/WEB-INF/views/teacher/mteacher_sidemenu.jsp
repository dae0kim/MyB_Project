<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../t_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sidemenu</title>
    <link rel="stylesheet" href="css/">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/m_web_main.css">    
     <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_menu.css" rel="stylesheet">
     
</head>
<body>
   <nav>
  	<div class="menu-btn">
    <div class="line line--1"></div>
    <div class="line line--2"></div>
    <div class="line line--3"></div>
  </div>

  <div class="nav-links">
    <a href="" class="link">Home</a>
    <a href="" class="link">Contact</a>
    <a href="" class="link">Profile</a>
    <a href="" class="link">About</a>
  </div>
	</nav>
<script>
   var menuBtn = document.querySelector('.menu-btn');
   var nav = document.querySelector('nav');
   var lineOne = document.querySelector('nav .menu-btn .line--1');
   var lineTwo = document.querySelector('nav .menu-btn .line--2');
   var lineThree = document.querySelector('nav .menu-btn .line--3');
   var link = document.querySelector('nav .nav-links');
   menuBtn.addEventListener('click', () => {
       nav.classList.toggle('nav-open');
       lineOne.classList.toggle('line-cross');
       lineTwo.classList.toggle('line-fade-out');
       lineThree.classList.toggle('line-cross');
       link.classList.toggle('fade-in');
   })
   </script>
</body>
</html>