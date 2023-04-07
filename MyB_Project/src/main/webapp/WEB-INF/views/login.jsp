<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/webicons/favicon.png">
    <title>로그인</title>
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/style.min.css" rel="stylesheet">
</head>
<body>
    <div class="main-wrapper">
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>
        <div class="auth-wrapper d-flex no-block justify-content-center align-items-center" style="background-color:#F5F6F7;">
            <div class="auth-box border-top border-secondary" style="background-color:#F5F6F7;">
                <div id="loginform">
                    <div class="text-center p-t-20 p-b-20" style="padding-top:20px; padding-bottom:20px;">
                        <span class="db">
                        	<a href="<c:url value='/' />">
                        		<img src="${pageContext.request.contextPath}/resources/images/webicons/logo5.png" alt="logo" style="width:178px; height:70px;"/>
                        	</a>
                        </span>
                    </div>
                    <!-- Form -->
                    <form class="form-horizontal m-t-20" style="margin-top:20px;" id="loginform" action="<c:url value='/login'/>" method="post">
                        <div class="row p-b-30" style="padding-bottom:30px;">
                            <div class="col-12">
                                <div class="input-group mb-3" style="margin-bottom:1rem;">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-success text-white" id="basic-addon1"><i class="ti-user"></i></span>
                                    </div>
                                    <input type="text" name="email" class="form-control form-control-lg" placeholder="아이디" aria-label="Username" aria-describedby="basic-addon1" required>
                                </div>
                                <div class="input-group mb-3" style="margin-bottom:1rem;">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-warning text-white" id="basic-addon2"><i class="ti-pencil"></i></span>
                                    </div>
                                    <input type="password" name="password" class="form-control form-control-lg" placeholder="비밀번호" aria-label="Password" aria-describedby="basic-addon1" required> 
                                </div>
                            </div>
                        </div>
                        <div>
				        	<span style="color:red;">${message}</span>
				        </div>
                        <div class="row border-top border-secondary">
                            <div class="col-12">
                                <div class="form-group">
                                    <div class="p-t-20" style="padding-top:20px;">
                                        <button class="btn btn-info" id="to-recover" type="button" onclick="location.href='<c:url value='/principal/joinform' />'"><i class="fa fa-user-plus m-r-5" style="margin-right:5px;"></i> 회원가입</button>
                                        <button class="btn btn-success float-right" type="submit"><i class="fa fa-sign-in-alt m-r-5" style="margin-right:5px;"></i>로그인</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<!-- ============================================================== -->
<!-- All Required js -->
<!-- ============================================================== -->
<script src="${pageContext.request.contextPath}/resources/assets/libs/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script>

$('[data-toggle="tooltip"]').tooltip();
$(".preloader").fadeOut();
</script>
</body>
</html>