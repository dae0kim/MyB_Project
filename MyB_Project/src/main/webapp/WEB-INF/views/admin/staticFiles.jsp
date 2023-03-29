<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>MyB</title>
	
	<link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />
    <link href='https://fonts.googleapis.com/css?family=Nanum Gothic' rel='stylesheet'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/web/adminheader.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/web/chart.css">
	
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.2.1/chart.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script 
    	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
     	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" 
     	crossorigin="anonymous"></script>
     	
    <script
	  src="https://code.jquery.com/jquery-3.6.4.js"
	  integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	  crossorigin="anonymous"></script>

    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.3.0/raphael.min.js"
      integrity="sha512-tBzZQxySO5q5lqwLWfu8Q+o4VkTcRGOeQGVQ0ueJga4A1RKuzmAu5HXDOXLEjpbKyV7ow9ympVoa6wZLEzRzDg=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"></script>

    <script src="https://kit.fontawesome.com/a566e7b2bd.js" crossorigin="anonymous"></script>
</head>