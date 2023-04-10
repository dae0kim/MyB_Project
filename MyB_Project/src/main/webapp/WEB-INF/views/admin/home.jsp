<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@include file="staticFiles.jsp" %>
<body>
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
		<%@include file="header.jsp" %>
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
             <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Dashboard</h4>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Sales Cards  -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- Column -->
                    <div class="col-md-6 col-lg-2 col-xlg-3">
                        <div class="card card-hover">
                        	<a href="<c:url value='/kindergarten/request/list' />">
                            <div class="box bg-cyan text-center">
                                <h1 class="font-light text-white"><i class="fa-solid fa-chalkboard"></i></h1>
                                <h6 class="text-white">어린이집 등록 관리</h6>
                            </div>
                            </a>
                        </div>
                    </div>               
                    <!-- Column -->
                    <div class="col-md-6 col-lg-2 col-xlg-3">
                        <div class="card card-hover">
                        	<a href="<c:url value='/diseaselog/check' />">
                            <div class="box bg-danger text-center">
                                <h1 class="font-light text-white"><i class="fa-solid fa-virus-covid"></i></h1>
                                <h6 class="text-white">질병 통계</h6>
                            </div>
                            </a>
                        </div>
                    </div>
                    <!-- Column -->
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
		    <%@include file="footer.jsp" %>
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="${pageContext.request.contextPath}/resources/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
</body>
</html>

