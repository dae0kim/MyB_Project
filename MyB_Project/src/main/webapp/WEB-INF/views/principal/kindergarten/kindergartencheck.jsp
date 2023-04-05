<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@include file="../staticFiles.jsp" %>
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
		<%@include file="../header.jsp" %>
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
            <div style="text-align:center; padding-top:50px;">
				<c:choose>
					<c:when test="${empty kindergartenStat}">
						<div class="web_kinder_chk_container">
				      		<i class="fa-sharp fa-solid fa-ban web_kinder_chk_icon"></i>
				        	<h2>아직 어린이집을 등록하지 않았습니다!</h2>   
				        	<a href="<c:url value='/kindergarten/form'/>" class="btn btn-success btn-lg btn-rounded waves-effect waves-light" style="margin-top:40px;">어린이집 등록하기</a> 
				      	</div>
					</c:when>
					<c:when test="${kindergartenStat eq 'Y'}">
						<div class="web_kinder_chk_container">
				      		<i class="fa-solid fa-circle-check web_kinder_chk_icon"></i>
				        	<h2>이미 어린이집을 등록했습니다!</h2>      
				      	</div>
					</c:when>		
					<c:when test="${kindergartenStat eq 'N'}">
						<div class="web_kinder_chk_container">
				      		<i class="fa-solid fa-hourglass-half web_kinder_chk_icon"></i>
				        	<h2>어린이집 등록 승인 대기중 입니다!</h2>      
				      	</div>
					</c:when>		
				</c:choose>
            </div>
            </div>    
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
        	<%@include file="../footer.jsp" %>
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- All Required js -->
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
	<script>
	$('[data-toggle="tooltip"]').tooltip();
	$(".preloader").fadeOut();
	</script>	
</body>
</html>

