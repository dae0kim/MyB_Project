<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <title>500 Error</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/webicons/favicon.png">
    
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
  	
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/web/weberror.css">
  </head>
<body>
<div class="error-header"> </div>
<div class="container ">
    <section class="error-container text-center">
        <h1>500</h1>
        <div class="error-divider">
            <h2>PAGE NOT FOUND.</h2>
            <p class="description">We Couldn't Find This Page</p>
        </div>
        <a href="<c:url value='/' />" class="return-btn"><i class="fa fa-home"></i>Home</a>
    </section>
</div>

</body>
</html>