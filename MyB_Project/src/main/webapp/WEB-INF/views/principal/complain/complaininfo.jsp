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
                <form class="form-horizontal">
                    <div class="card-body">
                        <h4 class="card-title">1:1문의 정보</h4>
                        
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label">제목</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="complainTitle" name="complainTitle" value="${complainVO.complainTitle}" readonly>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="bname" class="col-sm-3 text-right control-label col-form-label">작성일</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="complainDate" name="complainDate" value="<fmt:formatDate value="${complainVO.complainDate}" pattern="YYYY-MM-dd HH:mm:ss"/>" readonly />
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="cname" class="col-sm-3 text-right control-label col-form-label">작성자</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="parentName" name="parentName" value="${complainDetailVO.parentName}"  readonly/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="cname" class="col-sm-3 text-right control-label col-form-label">작성자 연락처</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="parentPhone" name="parentPhone" value="${complainDetailVO.parentPhone}"  readonly/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="dname" class="col-sm-3 text-right control-label col-form-label">자녀</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="childName" name="childName" value="${complainDetailVO.childName}"  readonly/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="ename" class="col-sm-3 text-right control-label col-form-label">자녀 교실</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="classroomName" name="classroomName" value="${complainDetailVO.classroomName}"  readonly/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="lname" class="col-sm-3 text-right control-label col-form-label">내용</label>
                            <div class="col-sm-5">
                                <textarea class="form-control" id="complainContent" name="complainContent" style="height:6.25rem;"  readonly>${complainVO.complainContent}</textarea>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="sname" class="col-sm-3 text-right control-label col-form-label">처리상태</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" name="complainStat" value="${complainVO.complainStat}" readonly>
                            </div>
                        </div>
                        <input type="hidden" name="adminId" value="${loginUser.adminId}">
                        <input type="hidden" id="complainId" value="${complainVO.complainId}">
                        
	                    <div class="border-top">
	                        <div class="card-body">
	                        	<c:choose>
	                        		<c:when test="${complainVO.complainStat eq 'N'}">
			                            <button type="button" class="btn btn-success" onclick="approveConfirm()">확인완료</button>
	                        		</c:when>
	                        	</c:choose>
	                            <button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/complain/list/${loginUser.adminId}'/>'">돌아가기</button>
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
	
	var complainId = $('#complainId').val();		

	// 요청확인 버튼 누를 때
	function approveConfirm(){
		if(confirm("컴플레인을 확인상태로 변경하시겠습니까?") == true){
			alert("상태가 업데이트되었습니다.");			
			location.href="../update/"+complainId;
		}else{			
			alert("취소되었습니다.");
		}
	}
	
</script>
</body>
</html>

