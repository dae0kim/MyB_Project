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
            <div class="card" style="margin:10% 15% 10% 15%;">
                <form class="form-horizontal" action="<c:url value='/classroom/update'/>" method="post">
                    <div class="card-body">
                        <h4 class="card-title">반 정보 수정</h4>
                        
                        <div class="form-group row">
                            <label for="lname" class="col-sm-3 text-right control-label col-form-label">반 이름</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="classroomName" name="classroomName" value="${classroomName}" required>
                            </div>
                        </div>
                        
                        
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label">담당 교사</label>
                            <div class="col-sm-5">
                            	<c:choose>
									<c:when test="${empty classroomInfo.teacherName}">
                                		<input type="text" class="form-control" id="teacherName" name="teacherName" value="등록된 교사가 없습니다." readonly>
									</c:when>
									<c:otherwise>
                                		<input type="text" class="form-control" id="teacherName" name="teacherName" value="${classroomInfo.teacherName}" readonly>
									</c:otherwise>
								</c:choose>
                            </div>
                        </div>
          
                        
                        
                        <div class="form-group row">
                            <label for="sname" class="col-sm-3 text-right control-label col-form-label">원생 수</label>
                            <div class="col-sm-5">
                            	<c:choose>
									<c:when test="${empty classroomInfo.count}">
		                                <input type="text" class="form-control" name="count" value="소속된 원생이 없습니다." readonly>
									</c:when>
									<c:otherwise>
		                                <input type="text" class="form-control" name="count" value="${classroomInfo.count}" readonly>
									</c:otherwise>
								</c:choose>
                            </div>
                        </div>
                        <input type="hidden" name="classroomId" value="${classroomSeq}">
	                    <div class="border-top">
	                        <div class="card-body">
	                            <button type="submit" class="btn btn-success" onclick="showMessage()">저장하기</button>
	                            <button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/classroom/namelist/${loginUser.adminId}'/>'">돌아가기</button>
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
	
function showMessage(){
		
		var classroomName = $('#classroomName').val();
		
		if(classroomName==""){
			alert("수정하실 반의 이름을 기입해주세요.");
		}else{
			alert("수정이 완료되었습니다.");			
		}
	}
	
</script>
</body>
</html>

