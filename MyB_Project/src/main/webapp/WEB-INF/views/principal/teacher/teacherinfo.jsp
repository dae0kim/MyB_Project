<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            <div class="card">
                <form class="form-horizontal">
                    <div class="card-body">
                        <h4 class="card-title">교사 정보</h4>
                        
                        <div class="form-group row">
                            <label for="fname" class="col-sm-2 text-right control-label col-form-label">이름</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="teacherName" name="teacherName" value="${teacherInfo.teacherName}" readonly>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="bname" class="col-sm-2 text-right control-label col-form-label">이메일</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="teacherEmail" name="teacherEmail" value="${teacherInfo.teacherEmail}" readonly />
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="cname" class="col-sm-2 text-right control-label col-form-label">비밀번호</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="teacherPw" name="teacherPw" value="${teacherInfo.teacherPw}"  readonly/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="cname" class="col-sm-2 text-right control-label col-form-label">연락처</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="teacherPhone" name="teacherPhone" value="${teacherInfo.teacherPhone}"  readonly/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="dname" class="col-sm-2 text-right control-label col-form-label">담당교실</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="classroomName" name="classroomName" value="${teacherInfo.classroomName}"  readonly/>
                            </div>
                        </div>
                        <input type="hidden" id="teacherId" value="${teacherInfo.teacherId}">
                        
	                    <div class="border-top">
	                        <div class="card-body">
	                            <button type="button" class="btn btn-success" onclick="location.href='<c:url value='/teacher/update/${teacherInfo.teacherId}'/>'">수정하기</button>
	                            <button type="button" class="btn btn-danger" onclick="deleteConfirm()">삭제하기</button>
	                            <button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/teacher/list/${loginUser.adminId}'/>'">돌아가기</button>
	                        </div>
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
	
	var teacherId = $('#teacherId').val();		

	// 삭제 버튼 누를 때
	function deleteConfirm(){
		if(confirm("교사 정보를 삭제하시겠습니까?") == true){
			alert("삭제되었습니다.");			
			location.href="../delete/"+teacherId;
		}else{			
			alert("취소되었습니다.");
		}
	}
	
</script>
</body>
</html>

