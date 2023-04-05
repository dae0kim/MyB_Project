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
            <div class="card" style="margin:10% 15% 10% 15%;">
                <form class="form-horizontal" action="<c:url value='/notice/update'/>" method="post">
                    <div class="card-body">
                        <h4 class="card-title">공지사항 수정</h4>
                        <input type="hidden" name="noticeId" value="${noticeVO.noticeId}">
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label">제목</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="noticeTitle" name="noticeTitle" value="${noticeVO.noticeTitle}" required>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="lname" class="col-sm-3 text-right control-label col-form-label">내용</label>
                            <div class="col-sm-5">
                                <textarea class="form-control" id="noticeContent" name="noticeContent" required>${noticeVO.noticeContent}</textarea>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label class="col-md-3">상단 고정여부</label>
                            <div class="col-md-9">
                                <div class="custom-control custom-radio">
                                    <input type="radio" class="custom-control-input" id="customControlValidation1" name="noticeStat" value='O'>
                                    <label class="custom-control-label" for="customControlValidation1">O (작성일과 상관없이 사용자 화면의 최상단에 보여집니다.)</label>
                                </div>
                                 <div class="custom-control custom-radio">
                                    <input type="radio" class="custom-control-input" id="customControlValidation2" name="noticeStat" value='X' checked>
                                    <label class="custom-control-label" for="customControlValidation2">X</label>
                                </div>
             
                            </div>
                        </div>
                        <input type="hidden" name="adminId" value="${loginUser.adminId}">
                    </div>
                    <div class="border-top">
                        <div class="card-body">
                            <button type="submit" class="btn btn-success" onclick="showMessage()">수정하기</button>
                            <button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/notice/info/${noticeVO.noticeId}'/>'">돌아가기</button>
                        </div>
                    </div>
                </form>
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
	<script type="text/javascript">
	function showMessage(){
		
		var noticeTitle = $('#noticeTitle').val();
		var noticeContent = $('#noticeContent').val();
		
		if(noticeTitle=="" || noticeContent==""){
			alert("모든 항목을 기입해주세요.");
		}else{
			alert("공지사항 수정이 완료되었습니다.");			
		}
	}
</script>
</body>
</html>

